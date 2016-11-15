# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>
# Contributor: C Anthony Risinger

pkgname=('zarafa-server')
groups=('zarafa'
	'kopano')
replaces=('zarafa-server-arm')
pkgver=7.2.4.29
_pkgmajver=7.2
pkgrel=77
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
	 'php-fpm<7'         
         'postfix'
         'ejabberd'
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
source=("https://download.zarafa.com/community/final/${_pkgmajver}/${pkgver}/zcp-${pkgver}.tar.xz"
	'zarafa-tools::git+https://github.com/zarafagroupware/zarafa-tools.git'
	'python-zarafa::git+https://github.com/zarafagroupware/python-zarafa.git'
	'zarafa-inspector::git+https://github.com/zarafagroupware/zarafa-inspector.git'
	'zarafa-pietma::git+https://git.pietma.com/pietma/com-pietma-zarafa.git#tag=v0.7'	
	'zarafa-sysusers.conf')
md5sums=('0790d8314fa4aef9788e5020be832535'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '90eefac8740a8e30a5ccca221c1af426')

prepare() {
  cd ${srcdir}/zcp-${pkgver}
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

function setconf() {
    # 1: field / 2: value / 3: file
    sed -i "s|^#*\s*\($1\).*|\1 = $2|" $3
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
  
  # *.cfg
  for cfg in ${pkgdir}/usr/share/doc/zarafa/example-config/*.cfg; do
   setconf "run_as_user" "zarafa" ${cfg}
   setconf "run_as_group" "zarafa" ${cfg}   
   setconf "running_path" "/var/lib/zarafa" ${cfg}   
   setconf "log_method" "syslog" ${cfg}  
   setconf "log_file" "-" ${cfg}
   setconf "log_level" "3" ${cfg}   
   # => ssl security
   setconf "ssl_prefer_server_ciphers" "yes" ${cfg}   
   setconf "ssl_protocols" "TLSv1 TLSv1\.1 TLSv1\.2" ${cfg}
   setconf "ssl_ciphers" "AES256\+EECDH:AES256\+EDH:\!aNULL" ${cfg}
   setconf "ssl_private_key_file" "/etc/ssl/private/zarafa.key" ${cfg}   
   setconf "ssl_certificate_file" "/etc/ssl/private/zarafa.crt" ${cfg}   
   # => socket connections only
   setconf "server_bind" "127.0.0.1" ${cfg}   
   setconf "server_socket" "file:///var/run/zarafad/server.sock" ${cfg}
  done
 
  # server.cfg
  cfg="${pkgdir}/usr/share/doc/zarafa/example-config/server.cfg"
  setconf "mysql_socket" "/run/mysqld/mysqld.sock" ${cfg}
  setconf "mysql_user" "zarafa" ${cfg}
  setconf "mysql_password" "zarafa" ${cfg}
  setconf "sync_log_all_changes" "no" ${cfg}
  setconf "hide_everyone" "yes" ${cfg}   
  setconf "attachment_compression" "0" ${cfg}
  setconf "search_enabled" "no" ${cfg}
  setconf "disabled_features" "" ${cfg}  
  # => ssl security
  setconf "server_tcp_enabled" "no" ${cfg}   
  setconf "server_ssl_prefer_server_ciphers" "yes" ${cfg}   
  setconf "server_ssl_protocols" "TLSv1 TLSv1\.1 TLSv1\.2" ${cfg}
  setconf "server_ssl_ciphers" "AES256\+EECDH:AES256\+EDH:\!aNULL" ${cfg}
  setconf "server_ssl_key_file" "/etc/ssl/private/zarafa.key" ${cfg}
  setconf "server_ssl_key_pass" "" ${cfg}
  setconf "server_ssl_ca_file" "/etc/ssl/private/zarafa.crt" ${cfg}
  setconf "server_ssl_ca_path" "/etc/ssl/certs" ${cfg}
  # => socket connection only
  setconf "server_pipe_name" "/var/run/zarafad/server.sock" ${cfg}

  # spooler.cfg
  setconf "allow_send_to_everyone" "no" "${pkgdir}/usr/share/doc/zarafa/example-config/spooler.cfg"

    
  # presence.cfg
  setconf "plugins" "xmpp" "${pkgdir}/usr/share/doc/zarafa/example-config/presence.cfg"  

  # gateway.cfg
  cfg="${pkgdir}/usr/share/doc/zarafa/example-config/gateway.cfg"
  setconf "imap_generate_utf8" "no" "${cfg}"  
  setconf "imap_public_folders" "yes" "${cfg}"  
  
  # FIXES
  cd ${srcdir}
  # set home directory
  cp -f zarafa-sysusers.conf ${pkgdir}/usr/lib/sysusers.d/
  
  # ADDITIONS
  cd ${srcdir}/zarafa-pietma
  mkdir -p ${pkgdir}/usr/share/doc/zarafa/zarafa-pietma
  cp -LR utils/* ${pkgdir}/usr/share/doc/zarafa/zarafa-pietma/
  
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
