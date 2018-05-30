# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>
# Contributor: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=('kopano-core')

replaces=('zarafa-server-arm'
	  'zarafa-server')

pkgver=8.6.1
pkgrel=7
pkgdesc="Open Source Groupware Solution"

arch=('armv7h'
      'armv6h'
      'x86_64'
      'i686')

url="https://www.kopano.com/"
license=('AGPL3')

makedepends=(
	     'gcc'
	     'gcc-libs'
	     'e2fsprogs'
	     'automake'
	     'xmlto'
	     'docbook-xsl'
	     'git'
	    )
depends=(
	 # TEST
	 'lzo'
	 'kbproto'
	 	 
	 # common
	 'gperftools'
	 # 'tidy' => broken
	 'openldap'
	 'php'
	 'mariadb'
	 'curl'
	 'libxml2'
	 'openldap'
	 'krb5'
         'bison'
         'python2'
         'python'
         'swig'
	 'bash-completion'
	 'icu'
	 'jsoncpp'

	 # common: version dependend in the past 
	 'gcc-libs'
	 'icu'
	 'libical'
         'libvmime'	 	 
	 'boost'	 
         'boost-libs'	          
	 'gsoap'
	 'openssl'
	 
	 # presence
         'python2-minimock'
         'python2-dnspython'
         'python2-nose'
         'python2-pyopenssl'
         'python2-tlslite'
         'python2-soappy'
         
         # presence-xmpp
         'python2-flask'
	 'python2-sleekxmpp'
         'ejabberd'     	 

         # search
         'python2-xapian'
         'python2-dateutil'
         'xapian-core'
         'php-xapian>=1.2.21'
	 'catdoc'
	 'poppler'
         'w3m'	 
         'libxslt'                  
         
         # pietma setup
	 'unzip'         
	 
         # imap-, smtp-, ical-, carddav-proxy
         'php-fpm'
         'nginx'         

         # mta + athentification
         'postfix'
         'cyrus-sasl'         
        )
install="install"        
optdepends=('zarafa-webapp'
        'sabre-zarafa'
        'z-push'
        'apache')
                
source=(
	"git+https://stash.kopano.io/scm/kc/kopanocore.git#tag=kopanocore-${pkgver}"
	"kopano-pietma::git+https://git.pietma.com/pietma/com-pietma-zarafa.git#branch=kopano"
	)
md5sums=(
	 'SKIP'
	 'SKIP'
	)

# DEBUG
# OPTIONS=(!strip docs libtool staticlibs emptydirs zipman purge !optipng !upx debug)

prepare() {
  cd kopanocore

  # Python is not recognized. Package is called python2 in Archlinux
  sed -i -r 's|PKG_CHECK_MODULES\(\[PYTHON\], \[python\], \[\], \[:\]\)|PKG_CHECK_MODULES\(\[PYTHON\], \[python2\], \[\], \[:\]\)|' configure.ac
  
  ./bootstrap.sh
}

build() {
  cd kopanocore
  
#  CPPFLAGS="-I/usr/include/python2.7"  ./configure \
#    DEBUG
#    CXXFLAGS="-O0 -ggdb3" \
  CPPFLAGS="-I/usr/include/python2.7"  ./configure \
    --prefix=/ \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --exec-prefix=/usr \
    --sbindir=/usr/bin \
    --datarootdir=/usr/share \
    --includedir=/usr/include \
    --enable-release \
    --enable-epoll \
    --enable-python \
    --disable-debug \
    --disable-static \
    --with-userscript-prefix=/etc/kopano/userscripts \
    --with-quotatemplate-prefix=/etc/kopano/quotamails \
    --with-searchscripts-prefix=/etc/kopano/searchscripts \
    --with-php=7 \
    PYTHON=/usr/bin/python2
    
  make
}

function cfg_set() {
    # 1: field / 2: value / 3: file
    # Replaces optional comments and spaces
    # "# name = value" => "name = newvalue"
    #
    sed -i "s|^#*\s*\($1\)\s*\=.*|\1 = $2|" $3
}

package() {
  cd kopanocore
  
  # => multithreaded build breaks everything
  export MAKEFLAGS="-j1"
  make install DESTDIR="$(realpath ${pkgdir})"


  # => move bash-completion to arch location 
  mkdir -p ${pkgdir}/usr/share/bash-completion/completions
  mv ${pkgdir}/etc/bash_completion.d/kopano-bash-completion.sh ${pkgdir}/usr/share/bash-completion/completions/kopano

  # => move /lib/* to /usr/lib/ arch location. /lib is a symlink to /usr/lib anyways.
  mv ${pkgdir}/lib/* ${pkgdir}/usr/lib/

  # => remove not appliable content
  rm -Rf ${pkgdir}/lib
  rm -Rf ${pkgdir}/etc/init.d
  rm -Rf ${pkgdir}/etc/sysconfig
  rm -Rf ${pkgdir}/etc/cron.daily
  rm -Rf ${pkgdir}/etc/logrotate.d
  rm -Rf ${pkgdir}/etc/bash_completion.d
  rm -Rf ${pkgdir}/etc/kopano/license

  # PREPARE LICENSE 
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp -R {RELNOTES.txt,CONTRIBUTING.md,AGPL-3,LICENSE.txt} ${pkgdir}/usr/share/licenses/${pkgname}


  # PREPARE SETTINGS
#??  rm ${pkgdir}/etc/kopano/*.cfg

  # General
  cfg_path="/usr/share/doc/kopano/example-config"
  run_as_user="kopano"
  run_as_group="kopano"
  running_path="/var/lib/kopano"
  server_socket="/var/run/kopano/server.sock"
  server_socket_prio="/var/run/kopano/prio.sock"
  search_socket="/var/run/kopano/search.sock"
  ssl_protocols="TLSv1 TLSv1\.1 TLSv1\.2"
  ssl_ciphers="AES256\+EECDH:AES256\+EDH:\!aNULL"
  ssl_privatekey="/etc/ssl/private/kopano.key"
  ssl_certificate="/etc/ssl/private/kopano.crt"


  # server.cfg
  cfg="${pkgdir}${cfg_path}/server.cfg"
  cfg_set "attachment_compression" "0" ${cfg}
  cfg_set "disabled_features" "" ${cfg}
  cfg_set "hide_everyone" "yes" ${cfg}
  cfg_set "search_enabled" "yes" "${cfg}"
  cfg_set "search_socket" "file://${search_socket}" "${cfg}"
  cfg_set "mysql_socket" "/run/mysqld/mysqld.sock" ${cfg}
  cfg_set "mysql_user" "kopano" ${cfg}
  cfg_set "mysql_password" "kopano" ${cfg}
  #=> service
  cfg_set "run_as_user" "${run_as_user}" ${cfg}
  cfg_set "run_as_group" "${run_as_group}" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection (socket only)
  cfg_set "server_pipe_name" "${server_socket}" ${cfg}
  cfg_set "server_pipe_priority" "${server_socket_prio}" ${cfg}
  cfg_set "server_listen" "" ${cfg}
  cfg_set "server_listen_tls" "" ${cfg}
  cfg_set "server_ssl_prefer_server_ciphers" "yes" ${cfg}
  cfg_set "server_ssl_protocols" "${ssl_protocols}" ${cfg}
  cfg_set "server_ssl_ciphers" "${ssl_ciphers}" ${cfg}
  cfg_set "server_ssl_key_file" "${ssl_privatekey}" ${cfg}
  cfg_set "server_ssl_key_pass" "" ${cfg}
  cfg_set "server_ssl_ca_file" "${ssl_certificate}" ${cfg}
  cfg_set "server_ssl_ca_path" "/etc/ssl/certs" ${cfg}

  # archiver.cfg
  cfg="${pkgdir}${cfg_path}/archiver.cfg"
  #=> service
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_socket" "file://${server_socket}" ${cfg}

  # backup.cfg
  cfg="${pkgdir}${cfg_path}/backup.cfg"
  #=> service
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_socket" "file://${server_socket}" ${cfg}

  # dagent.cfg
  cfg="${pkgdir}${cfg_path}/dagent.cfg"
  #=> service
  cfg_set "run_as_user" "${run_as_user}" ${cfg}
  cfg_set "run_as_group" "${run_as_group}" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_bind" "127.0.0.1" ${cfg}
  cfg_set "server_socket" "file://${server_socket}" ${cfg}

  # gateway.cfg
  cfg="${pkgdir}${cfg_path}/gateway.cfg"
  cfg_set "imap_generate_utf8" "no" "${cfg}"
  cfg_set "imap_public_folders" "yes" "${cfg}"
  cfg_set "process_model" "fork" ${cfg}
  #=> service (avoid requests to be upgraded to admin privileges)
  cfg_set "run_as_user" "nobody" ${cfg}
  cfg_set "run_as_group" "nobody" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_bind" "127.0.0.1" ${cfg}
  cfg_set "server_socket" "file://${server_socket}" ${cfg}
  cfg_set "ssl_prefer_server_ciphers" "yes" ${cfg}   
  cfg_set "ssl_protocols" "${ssl_protocols}" ${cfg}
  cfg_set "ssl_ciphers" "${ssl_ciphers}" ${cfg}
  cfg_set "ssl_private_key_file" "${ssl_privatekey}" ${cfg}   
  cfg_set "ssl_certificate_file" "${ssl_certificate}" ${cfg}   

  # ical.cfg
  cfg="${pkgdir}${cfg_path}/ical.cfg"
  cfg_set "process_model" "fork" ${cfg}
  #=> service (avoid requests to be upgraded to kopano-admin)
  cfg_set "run_as_user" "nobody" ${cfg}
  cfg_set "run_as_group" "nobody" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_bind" "127.0.0.1" ${cfg}
  cfg_set "server_socket" "file://${server_socket}" ${cfg}
  cfg_set "ssl_prefer_server_ciphers" "yes" ${cfg}
  cfg_set "ssl_protocols" "${ssl_protocols}" ${cfg}
  cfg_set "ssl_ciphers" "${ssl_ciphers}" ${cfg}
  cfg_set "ssl_private_key_file" "${ssl_privatekey}" ${cfg}   
  cfg_set "ssl_certificate_file" "${ssl_certificate}" ${cfg}   

  # monitor.cfg
  cfg="${pkgdir}${cfg_path}/monitor.cfg"
  #=> service
  cfg_set "run_as_user" "${run_as_user}" ${cfg}
  cfg_set "run_as_group" "${run_as_group}" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_socket" "file://${server_socket}" ${cfg}

  # presence.cfg
  cfg="${pkgdir}${cfg_path}/presence.cfg"
  cfg_set "plugins" "xmpp" "${cfg}"
  cfg_set "server_bind" "127.0.0.1" ${cfg}
  #=> service
  cfg_set "run_as_user" "${run_as_user}" ${cfg}
  cfg_set "run_as_group" "${run_as_group}" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}

  # unix.cfg

  # search.cfg
  cfg="${pkgdir}${cfg_path}/search.cfg"
  cfg_set "index_attachements" "yes" "${cfg}"
  cfg_set "server_bind_name" "file://${search_socket}" "${cfg}"
  cfg_set "ssl_private_key_file" "${ssl_privatekey}" ${cfg}   
  cfg_set "ssl_certificate_file" "${ssl_certificate}" ${cfg}   
  #=> service
  cfg_set "run_as_user" "${run_as_user}" ${cfg}
  cfg_set "run_as_group" "${run_as_group}" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_socket" "file://${server_socket}" ${cfg}

  # spooler.cfg
  cfg="${pkgdir}${cfg_path}/spooler.cfg" 
  cfg_set "allow_send_to_everyone" "no" "${cfg}"
  #=> service
  cfg_set "run_as_user" "${run_as_user}" ${cfg}
  cfg_set "run_as_group" "${run_as_group}" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection
  cfg_set "server_socket" "file://${server_socket}" ${cfg}


  # PIETMA
  ###
  cd ${srcdir}/kopano-pietma
  mkdir -p ${pkgdir}/usr/share/doc/kopano
  cp -LRf doc/* ${pkgdir}/usr/share/doc/kopano
  cp -LRf usr/* ${pkgdir}/usr
  
  
  # ADDITIONS
  ###
#  cd ${srcdir}/kopano-tools
#  mkdir -p ${pkgdir}/usr/share/doc/kopano/kopano-tools
#  cp -LR * ${pkgdir}/usr/share/doc/kopano/kopano-tools/
  
#  cd ${srcdir}/python-kopano
#  mkdir -p ${pkgdir}/usr/share/doc/kopano/python-kopano
#  cp -LR * ${pkgdir}/usr/share/doc/kopano/python-kopano/
  
#  cd ${srcdir}/kopano-inspector
#  mkdir -p ${pkgdir}/usr/share/doc/kopano/kopano-inspector
#  cp -LR * ${pkgdir}/usr/share/doc/kopano/kopano-inspector/
}
