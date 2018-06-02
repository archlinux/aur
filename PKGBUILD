# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>
# Contributor: C Anthony Risinger

pkgname=('zarafa-server')
groups=('zarafa')
replaces=('zarafa-server-arm')
pkgver=7.2.6.10
_pkgmajver=7.2
pkgrel=68
pkgdesc="Open Source Groupware Solution"
arch=('armv7h'
      'armv6h'
      'x86_64'
      'i686')

url="http://www.zarafa.com/"
license=('AGPL3')
provides=("zarafa-server-arm=${pkgver}")
depends=(
	 # from debian packages
	 'gcc-libs' # => libstdc++6, locales
         'bash>=3.0'
         'bash-completion'
         'catdoc'
         'coreutils>=5.93' # => mktemp
         'file'
         'gawk'
	 'boost=1.58.0'
	 'boost-libs=1.58.0' # => libboost-system, libboost-filesystem
	 'glibc>=2.2.5' # => libc6, libtinfo5, libcomerr2, libgcc1
	 'gsoap=2.8.22'
         'krb5>=1.6' # => libk5crypto3
	 'icu>=52'
	 'libldap>=2.4.7'
	 'mariadb>=5.5.24' #=> libmysqlclient
	 'ncurses>=5.6'
	 'pam>=0.99.7.1'
	 'python2>=2.7'	# => libpython2.7, python
#	 'libs3'
	 'openssl>=1.0.0' # => libssl
	 'gperftools' # => libtcmalloc-minimal4
	 'libutil-linux>=2.16' #=> libuuid1
	 'libxml2>=2.7.4' # => xsltproc
	 'util-linux' # => lsb-base, 
	 'php<7' # => php5-cli, phpapi-20131226
	 'poppler' # => poppler-utils
	 'python2-flask'
	 'python2-sleekxmpp'
	 'python2-xapian'
	 'xapian-core'
	 'tzdata'
	 'unzip'
	 'w3m'
	 'zlib>=1.2.6'
	 'zarafa-libical>=7.2.0'
         'zarafa-libvmime>=7.2.0'
         
         # from https://documentation.zarafa.com/zcp_administrator_manual/release_notes.html?#major-release-zcp-7-2-0
	 'python2-minimock'
	 'python2-dnspython'
	 'python2-nose'
	 'python2-pyopenssl'
	 'python2-tlslite'
	 'python2-soappy'
         
	 # from https://download.zarafa.com/community/final/7.2/7.2.4.29/zcp-7.2.4.29-rhel-6-x86_64-opensource.tar.gz
	 # from https://jira.zarafa.com/browse/ZCP-12647
	 'php-xapian>=1.2.21'
	 'python2-werkzeug>=0.10.4'
	 'python2-markupsafe>=0.23'
	 'python2-jinja>=2.7.3'
	 'python2-itsdangerous>=0.24'
	 'python2-coverage'
         
         # from pietma
	 # 
	 'php-fpm<7'
         'nginx'
         
         # mail transfer agent + smtps
         'postfix'
         'cyrus-sasl'
         
         # presence
         'ejabberd'
         
         # search
         'libxslt'
         )

# compile gcc from https://git.pietma.com/pietma-aur/gcc
# makepkg -scCi
makedepends=(
             # from Debian column on https://documentation.zarafa.com/zcp_administrator_manual/installing.html?highlight=dependencies#installing-from-source
#	     'basedevel' # (autoconf, automake, bison, binutils, flex, gettext, libtool, pkg-config...) # => build-essential (base-files, base-passwd, bash, coreutils, dash, debianutils, diffutils, dpkg, e2fsprogs, findutils, grep, gzip, hostname, ncurses-base, ncurses-bin, perl-base, sed, login, sysvinit-utils, sysvinit, tar, bsdutils, mount, util-linux, debhelper, flex, gettext, gsoap)
#	     'base' # (perl...)  # => 
	     'curl'
	     'swig=3.0.7'
	     'xmlto' 
	     'docbook-xsl'

             # from Red Hat column on https://documentation.zarafa.com/zcp_administrator_manual/installing.html?highlight=dependencies#installing-from-source	     
#	     'base' # (e2fsprogs)
	     'imake'
	     'keyutils'
	     'libidn'

             # from Ubuntu column on https://documentation.zarafa.com/zcp_administrator_manual/installing.html?highlight=dependencies#installing-from-source	     
#	     'apache'
	     'clucene'
	     'python2-daemon'
	     'python2-ldap'
	     'python2-lockfile'
	     'python2-lxml'
	     'python2-mysql-connector'
	     'python2-vobject'
# 	     'slapd'
#	     'tinyca'
	     'valgrind'
	     
	     # from pietma
	     'gcc<=4.9.2'
	     'gcc-libs<=4.9.2'
	     'git'
	     )
	     
optdepends=('zarafa-webapp'
	    'sabre-zarafa'
	    'z-push'
	    'apache')
	    
install="install"
source=("http://archives.z-hub.io/sourcecode/zcp-${pkgver}.tar.xz"
	'zarafa-tools::git+https://github.com/zarafagroupware/zarafa-tools.git'
	'python-zarafa::git+https://github.com/zarafagroupware/python-zarafa.git'
	'zarafa-inspector::git+https://github.com/zarafagroupware/zarafa-inspector.git'
	"zarafa-pietma::git+https://git.pietma.com/pietma/com-pietma-zarafa.git#tag=${_pietmaver}"
	'ECDBDef.h'
	'ECDatabaseMySQL.cpp'
	'ECDatabaseUpdate.h'
	'ECDatabaseUpdate.cpp')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd ${srcdir}/zcp-${pkgver}
  cp -f ${srcdir}/ECDBDef.h provider/libserver/
  cp -f ${srcdir}/ECDatabaseMySQL.cpp provider/libserver/ 
  cp -f ${srcdir}/ECDatabaseUpdate.h provider/libserver/ 
  cp -f ${srcdir}/ECDatabaseUpdate.cpp provider/libserver/ 
  return 0
}

build() {
  cd ${srcdir}/zcp-${pkgver}

  export PYTHON=/usr/bin/python2
  ./configure \
    --prefix=/ \
    --sysconfdir=/etc \
    --exec-prefix=/usr \
    --sbindir=/usr/bin \
    --datarootdir=/usr/share \
    --includedir=/usr/include \
    --enable-release \
    --enable-unicode \
    --enable-icu \
    --disable-debug \
    --disable-static \
    --enable-static-boost
    
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
  cd ${srcdir}/zcp-${pkgver}
  
  # => multithreaded build breaks everything
  export MAKEFLAGS="-j1"
  make install DESTDIR="$(realpath ${pkgdir})"


  # => move bash-completion to arch location 
  mkdir -p ${pkgdir}/usr/share/bash-completion/completions
  mv ${pkgdir}/etc/bash_completion.d/zarafa-bash-completion.sh ${pkgdir}/usr/share/bash-completion/completions/zarafa

  # => move /lib/* to /usr/lib/ arch location. /lib is a symlink to /usr/lib anyways.
  mv ${pkgdir}/lib/* ${pkgdir}/usr/lib/

  # => remove not appliable content
  rm -Rf ${pkgdir}/lib
  rm -Rf ${pkgdir}/etc/init.d
  rm -Rf ${pkgdir}/etc/sysconfig
  rm -Rf ${pkgdir}/etc/cron.daily
  rm -Rf ${pkgdir}/etc/logrotate.d
  rm -Rf ${pkgdir}/etc/bash_completion.d
  rm -Rf ${pkgdir}/etc/zarafa/license

  # PREPARE LICENSE 
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp -R {RELNOTES.txt,CONTRIBUTORS.txt,AGPL-3,LICENSE.txt} ${pkgdir}/usr/share/licenses/${pkgname}


  # PREPARE SETTINGS
  rm ${pkgdir}/etc/zarafa/*.cfg

  # General
  cfg_path="/usr/share/doc/zarafa/example-config"
  run_as_user="zarafa"
  run_as_group="zarafa"
  running_path="/var/lib/zarafa"
  server_socket="/var/run/zarafad/server.sock"
  search_socket="/var/run/zarafad/search.sock"
  ssl_protocols="TLSv1 TLSv1\.1 TLSv1\.2"
  ssl_ciphers="AES256\+EECDH:AES256\+EDH:\!aNULL"
  ssl_privatekey="/etc/ssl/private/zarafa.key"
  ssl_certificate="/etc/ssl/private/zarafa.crt"


  # server.cfg
  cfg="${pkgdir}${cfg_path}/server.cfg"
  cfg_set "attachment_compression" "0" ${cfg}
  cfg_set "disabled_features" "" ${cfg}
  cfg_set "hide_everyone" "yes" ${cfg}
  cfg_set "search_enabled" "yes" "${cfg}"
  cfg_set "search_socket" "file://${search_socket}" "${cfg}"
  cfg_set "sync_log_all_changes" "no" ${cfg}
  cfg_set "mysql_socket" "/run/mysqld/mysqld.sock" ${cfg}
  cfg_set "mysql_user" "zarafa" ${cfg}
  cfg_set "mysql_password" "zarafa" ${cfg}
  #=> service
  cfg_set "run_as_user" "${run_as_user}" ${cfg}
  cfg_set "run_as_group" "${run_as_group}" ${cfg}
  cfg_set "running_path" "${running_path}" ${cfg}
  cfg_set "log_method" "syslog" ${cfg}  
  cfg_set "log_file" "-" ${cfg}
  cfg_set "log_level" "3" ${cfg}
  #=> server-connection (socket only)
  cfg_set "server_pipe_name" "${server_socket}" ${cfg}
  cfg_set "server_tcp_enabled" "no" ${cfg}
  cfg_set "server_bind" "127.0.0.1" ${cfg}
  cfg_set "server_ssl_enable" "no" ${cfg}
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

  # backup-plus.cfg
  cfg="${pkgdir}${cfg_path}/backup-plus.cfg"
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
  #=> service (avoid requests to be upgraded to zarafa-admin)
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
  cd ${srcdir}/zarafa-pietma
  mkdir -p ${pkgdir}/usr/share/doc/zarafa
  cp -LRf doc/* ${pkgdir}/usr/share/doc/zarafa
  cp -LRf usr/* ${pkgdir}/usr
  
  
  # ADDITIONS
  ###
  cd ${srcdir}/zarafa-tools
  mkdir -p ${pkgdir}/usr/share/doc/zarafa/zarafa-tools
  cp -LR * ${pkgdir}/usr/share/doc/zarafa/zarafa-tools/
  
  cd ${srcdir}/python-zarafa
  mkdir -p ${pkgdir}/usr/share/doc/zarafa/python-zarafa
  cp -LR * ${pkgdir}/usr/share/doc/zarafa/python-zarafa/
  
  cd ${srcdir}/zarafa-inspector
  mkdir -p ${pkgdir}/usr/share/doc/zarafa/zarafa-inspector
  cp -LR * ${pkgdir}/usr/share/doc/zarafa/zarafa-inspector/
}
