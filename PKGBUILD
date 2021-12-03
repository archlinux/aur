# Build props
phpbase=72
pkgver=7.2.34
pkgrel=5

# Custom suffix
suffix=

# Const props
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'freetds' 'pcre' 'libsodium' 'patchutils')
checkdepends=('procps-ng')

# Calculated props
_base="php"
program_suffix="${phpbase}${suffix}"
pkgdesc="${_base} ${pkgver} compiled as to not conflict with mainline ${_base}"
pkgbase="${_base}${program_suffix}"
pkgname=("${pkgbase}" "${_base}${phpbase}-"{cgi,apache,fpm,embed,phpdbg,dblib,enchant,gd,imap,intl,odbc,pgsql,pspell,snmp,sqlite,tidy,xsl,sodium}${suffix})
# Has "php" string

# Source
source=("https://php.net/distributions/${_base}-${pkgver}.tar.xz" 'intl.patch' 'icu.patch'
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch' 'enchant.patch' 'php-freetype-2.9.1.patch' )
        
# Version specific"
name_libapache_source="libphp7.so"
name_libembed_source="libphp7.so"

# Dirs
dir_config="etc/${pkgbase}"
dir_lib="usr/lib/${pkgbase}"

# Binary names
name_phpconfig="php-config${program_suffix}"
name_phpize="phpize${program_suffix}"
name_phar="phar${program_suffix}"

# Conf names
name_apache_module_conf="${pkgbase/-/_}_module.conf"


prepare() {
    cd "${_base}-${pkgver}"
    patch -p0 -i ${srcdir}/apache.patch
    patch -p0 -i ${srcdir}/php-fpm.patch
    patch -p0 -i ${srcdir}/php.ini.patch
    patch -p1 -i ${srcdir}/enchant.patch
    patch -p1 -i ${srcdir}/php-freetype-2.9.1.patch
    patch -p1 -i ${srcdir}/intl.patch
    patch -p1 -i ${srcdir}/icu.patch
}

build() {
    local _phpconfig="--srcdir=../${_base}-${pkgver} \
        --config-cache \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/${dir_config} \
        --localstatedir=/var \
                --libdir=/${dir_lib} \
                --datarootdir=/usr/share/${pkgbase} \
                --datadir=/usr/share/${pkgbase} \
                --program-suffix=${program_suffix} \
        --with-layout=GNU \
        --with-config-file-path=/${dir_config} \
        --with-config-file-scan-dir=/${dir_config}/conf.d \
        --disable-rpath \
        --without-pear \
        "

    local _phpextensions="\
        --enable-bcmath=shared \
        --enable-calendar=shared \
        --enable-dba=shared \
        --enable-exif=shared \
        --enable-ftp=shared \
        --enable-gd-native-ttf \
        --enable-intl=shared \
        --enable-mbstring \
        --enable-shmop=shared \
        --enable-soap=shared \
        --enable-sockets=shared \
        --enable-sysvmsg=shared \
        --enable-sysvsem=shared \
        --enable-sysvshm=shared \
        --enable-zip=shared \
        --with-bz2=shared \
        --with-curl=shared \
        --with-db4=/usr \
        --with-enchant=shared,/usr \
        --with-freetype-dir=/usr \
        --with-gd=shared,/usr \
        --with-gdbm \
        --with-gettext=shared \
        --with-gmp=shared \
        --with-iconv=shared \
        --with-imap-ssl \
        --with-imap=shared \
        --with-kerberos=/usr \
        --with-ldap=shared \
        --with-ldap-sasl \
        --with-libzip \
        --with-mhash \
        --with-mysql-sock=/run/mysqld/mysqld.sock \
        --with-mysqli=shared,mysqlnd \
        --with-openssl \
        --with-pcre-regex=/usr \
        --with-pdo-dblib=shared,/usr \
        --with-pdo-mysql=shared,mysqlnd \
        --with-pdo-odbc=shared,unixODBC,/usr \
        --with-pdo-pgsql=shared \
        --with-pdo-sqlite=shared,/usr \
        --with-pgsql=shared \
        --with-pspell=shared \
        --with-readline \
        --with-snmp=shared \
        --with-sodium=shared \
        --with-sqlite3=shared,/usr \
        --with-tidy=shared \
        --with-unixODBC=shared,/usr \
        --with-xmlrpc=shared \
        --with-xsl=shared \
        --with-zlib \
        --enable-pcntl \
        "

    EXTENSION_DIR="/${dir_lib}/modules"
    export EXTENSION_DIR
    
    mkdir ${srcdir}/build
    cd ${srcdir}/build    
    ln -s ../${_base}-${pkgver}/configure
    ./configure ${_phpconfig} \
        --enable-cgi \
        --enable-fpm \
        --with-fpm-systemd \
        --with-fpm-acl \
        --with-fpm-user=http \
        --with-fpm-group=http \
        --enable-embed=shared \
        ${_phpextensions}
    make

    # apache
    # reuse the previous run; this will save us a lot of time
    cp -a ${srcdir}/build ${srcdir}/build-apache
    cd ${srcdir}/build-apache
    ./configure ${_phpconfig} \
        --with-apxs2 \
        ${_phpextensions}
    make

    # phpdbg
    cp -a ${srcdir}/build ${srcdir}/build-phpdbg
    cd ${srcdir}/build-phpdbg
    ./configure ${_phpconfig} \
        --enable-phpdbg \
        ${_phpextensions}
    make
}

check() {
   cd "${_base}-${pkgver}"

   # Check if sendmail was configured correctly (FS#47600)
   ${srcdir}/build/sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

   export REPORT_EXIT_STATUS=1
   export NO_INTERACTION=1
   export SKIP_ONLINE_TESTS=1
   export SKIP_SLOW_TESTS=1

   ${srcdir}/build/sapi/cli/php -n run-tests.php -n -P {tests,Zend}
}

package_php72() {
    pkgdesc='A general-purpose scripting language that is especially suited to web development'
    depends=('libxml2' 'curl' 'libzip' 'pcre')
    backup=("${dir_config}/php.ini")
    #provides=("${pkgbase}=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
    install -D -m644 ${srcdir}/${_base}-${pkgver}/php.ini-production ${pkgdir}/${dir_config}/php.ini
    install -d -m755 ${pkgdir}/${dir_config}/conf.d/

    # remove static modules
    rm -f ${pkgdir}/${dir_lib}/modules/*.a
    # remove modules provided by sub packages
    rm -f ${pkgdir}/${dir_lib}/modules/{enchant,gd,imap,intl,sodium,mcrypt,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
    # remove empty directory
    rmdir ${pkgdir}/usr/include/php/include

    # move include directory
    mv ${pkgdir}/usr/include/php ${pkgdir}/usr/include/${pkgbase}

    # fix phar symlink
    rm ${pkgdir}/usr/bin/phar  
    ln -sf ${name_phar}.phar ${pkgdir}/usr/bin/${name_phar}

    # rename executables
    mv ${pkgdir}/usr/bin/phar.phar ${pkgdir}/usr/bin/${name_phar}.phar


    # rename man pages
    mv ${pkgdir}/usr/share/man/man1/{phar,${name_phar}}.1
    mv ${pkgdir}/usr/share/man/man1/phar.{phar,${name_phar}}.1

    # fix paths in executables
    sed -i "/^includedir=/c \includedir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/${name_phpize}
    sed -i "/^include_dir=/c \include_dir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/${name_phpconfig}

    # make phpize use php-config${phpbase}
    sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${name_phpconfig}]], ${name_phpconfig}, no)" ${pkgdir}/${dir_lib}/build/phpize.m4
}

package_php72-cgi() {
    pkgdesc='CGI and FCGI SAPI for PHP'
    depends=("${pkgbase}")
    #provides=("${pkgbase}-cgi=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php72-apache() {
    pkgdesc='Apache SAPI for PHP'
    depends=("${pkgbase}" 'apache')
    backup=("etc/httpd/conf/extra/${name_apache_module_conf}")
    #provides=("${pkgbase}-apache=${pkgver}")
        echo "# End of LoadModule in httpd.conf - see ArchWiki Apache HTTP Server"
        echo "LoadModule php7_module modules/lib${pkgbase}.so"
        echo "AddHandler php7-script .php"
        echo "# End of Include List"
        echo "Include conf/extra/${name_apache_module_conf}"
    install -D -m755 ${srcdir}/build-apache/libs/${name_libapache_source} ${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so
    install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${name_apache_module_conf}
}

package_php72-fpm() {
    pkgdesc='FastCGI Process Manager for PHP'
    depends=("${pkgbase}" 'systemd')
    backup=("${dir_config}/php-fpm.conf" "${dir_config}/php-fpm.d/www.conf")
    options=('!emptydirs')
    #provides=("${pkgbase}-fpm=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} install-fpm
    install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${pkgbase}-fpm.service
    install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}-fpm.conf
}

package_php72-embed() {
    pkgdesc='Embedded PHP SAPI library'
    depends=("${pkgbase}" 'libsystemd')
    options=('!emptydirs')
    #provides=("${pkgbase}-embed=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
    mv ${pkgdir}/usr/lib/${name_libembed_source} ${pkgdir}/usr/lib/libphp${program_suffix}.so
}

package_php72-phpdbg() {
    pkgdesc='Interactive PHP debugger'
    depends=("${pkgbase}")
    options=('!emptydirs')
    #provides=("${pkgbase}-phpdbg=${pkgver}")

    cd ${srcdir}/build-phpdbg
    make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php72-dblib() {
    pkgdesc='dblib module for PHP'
    depends=("${pkgbase}" 'freetds')
    #provides=("${pkgbase}-dblib=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/${dir_lib}/modules/pdo_dblib.so
}

package_php72-enchant() {
    pkgdesc='enchant module for PHP'
    depends=("${pkgbase}" 'enchant')
    #provides=("${pkgbase}-enchant=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/${dir_lib}/modules/enchant.so
}

package_php72-gd() {
    pkgdesc='gd module for PHP'
    depends=("${pkgbase}" 'gd')
    #provides=("${pkgbase}-gd=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/${dir_lib}/modules/gd.so
}

package_php72-imap() {
    pkgdesc='imap module for PHP'
    depends=("${pkgbase}" 'c-client')
    #provides=("${pkgbase}-imap=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/${dir_lib}/modules/imap.so
}

package_php72-intl() {
    pkgdesc='intl module for PHP'
    depends=("${pkgbase}" 'icu')
    #provides=("${pkgbase}-intl=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/${dir_lib}/modules/intl.so
}

package_php72-odbc() {
    pkgdesc='ODBC modules for PHP'
    depends=("${pkgbase}" 'unixodbc')
    #provides=("${pkgbase}-odbc=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/${dir_lib}/modules/odbc.so
    install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/${dir_lib}/modules/pdo_odbc.so
}

package_php72-pgsql() {
    pkgdesc='PostgreSQL modules for PHP'
    depends=("${pkgbase}" 'postgresql-libs')
    #provides=("${pkgbase}-pgsql=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/${dir_lib}/modules/pgsql.so
    install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/${dir_lib}/modules/pdo_pgsql.so
}

package_php72-pspell() {
    pkgdesc='pspell module for PHP'
    depends=("${pkgbase}" 'aspell')
    #provides=("${pkgbase}-pspell=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/${dir_lib}/modules/pspell.so
}

package_php72-snmp() {
    pkgdesc='snmp module for PHP'
    depends=("${pkgbase}" 'net-snmp')
    #provides=("${pkgbase}-snmp=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/${dir_lib}/modules/snmp.so
}

package_php72-sqlite() {
    pkgdesc='sqlite module for PHP'
    depends=("${pkgbase}" 'sqlite')
    #provides=("${pkgbase}-sqlite=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/${dir_lib}/modules/sqlite3.so
    install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/${dir_lib}/modules/pdo_sqlite.so
}

package_php72-tidy() {
    pkgdesc='tidy module for PHP'
    depends=("${pkgbase}" 'tidy')
    #provides=("${pkgbase}-tidy=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/${dir_lib}/modules/tidy.so
}

package_php72-xsl() {
    pkgdesc='xsl module for PHP'
    depends=("${pkgbase}" 'libxslt')
    #provides=("${pkgbase}-xsl=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/${dir_lib}/modules/xsl.so
}

package_php72-sodium() {
    pkgdesc='sodium module for PHP'
    depends=("${pkgbase}" 'libsodium')
    #provides=("${pkgbase}-sodium=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/sodium.so ${pkgdir}/${dir_lib}/modules/sodium.so
}

sha256sums=('409e11bc6a2c18707dfc44bc61c820ddfd81e17481470f3405ee7822d8379903'
            'aa118bc3f15d33fc3e4c87de8fcd82ae1a7e66cb8469dfdb74bec1025acf56af'
            'e438f7a429915d9fe5affce2a32315b670fa0f2b2638ca51e7072374d367ca07'
            'a67ed00467fb886e73808a3246e7a6f6bfb60fa3c24a692e21a4dd474b8353fd'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce'
            'bdd47c439c81b46384332c8b0180e70b80d8b38d844f0dde9d1be329e4c62f18'
            '3217979d2ea17f9c6c9209e220d41a5f4e6a6b65fcc7cd5ab8d938f65ca2b59e'
            'd47310dfa4c53fd30744e49b0bacfcabe055568a33af08e28bc5bc80a852b4c4'
            'b11c3de747ef222696f5135556d624e3f7f0135a3cb1b06082f1ec8e9b7eeb0a'
            'f9fe57f809ac13e0043d18b795ef777af3e8c710a83745b37b09db536f683d2a')
