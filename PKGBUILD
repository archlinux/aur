# Build props
phpbase=72
pkgver=7.2.34
pkgrel=6

# Custom suffix
suffix=

# Const props
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'freetds' 'pcre' 'libsodium'
             'patchutils' 'oniguruma')
checkdepends=('procps-ng')

# Has "php" string
_base="php"

# Calculated props
pkgdesc="${_base} ${pkgver} compiled as to not conflict with mainline ${_base}"
pkgbase="${_base}${phpbase}${suffix}"
pkgname=("${pkgbase}" "${_base}${phpbase}-"{cgi,apache,fpm,embed,phpdbg,dblib,enchant,gd,imap,intl,odbc,pgsql,pspell,snmp,sqlite,tidy,xsl,sodium}${suffix})

# Source
source=("https://php.net/distributions/${_base}-${pkgver}.tar.xz" 'icu.patch'
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch' 'enchant.patch' 'php-freetype-2.9.1.patch' )

# Version specific"
name_libapache_source="libphp7.so"
name_libembed_source="libphp7.so"

# Path
path_prefix="usr"
path_config="etc/${pkgbase}"
path_extensions="${path_prefix}/lib/${pkgbase}/modules"

# Binary names
name_phpconfig="php-config${phpbase}${suffix}"
name_phpize="phpize${phpbase}${suffix}"
name_phar="phar${phpbase}${suffix}"

# Conf names
name_apache_module_conf="${pkgbase/-/_}_module.conf"


prepare() {
    cd "${_base}-${pkgver}"
    patch -p0 -i ${srcdir}/apache.patch
    patch -p0 -i ${srcdir}/php-fpm.patch
    patch -p0 -i ${srcdir}/php.ini.patch
    patch -p1 -i ${srcdir}/enchant.patch
    patch -p1 -i ${srcdir}/php-freetype-2.9.1.patch
    patch -p1 -i ${srcdir}/icu.patch
    rm tests/output/stream_isatty_*.phpt
}

build() {
    CPPFLAGS+=' -DU_USING_ICU_NAMESPACE=1'
    CPPFLAGS+=' -DU_DEFINE_FALSE_AND_TRUE=1'
    CPPFLAGS+=' -DEL_BUILD=1'
    export EXTENSION_DIR="/${path_extensions}"

    local _phpconfig="--srcdir=../${_base}-${pkgver} \
        --config-cache \
        --cache-file=config-${pkgbase}-${pkgver}-${pkgrel}.cache
        --prefix=/${path_prefix} \
        --sbindir=/${path_prefix}/bin \
        --sysconfdir=/${path_config} \
        --localstatedir=/var \
        --libdir=/${path_prefix}/lib/${pkgbase} \
        --datarootdir=/${path_prefix}/share/${pkgbase} \
        --datadir=/${path_prefix}/share/${pkgbase} \
        --program-suffix=${phpbase}${suffix} \
        --with-layout=GNU \
        --with-config-file-path=/${path_config} \
        --with-config-file-scan-dir=/${path_config}/conf.d \
        --disable-rpath \
        --mandir=/${path_prefix}/share/man \
        --without-pear \
        "

    local _phpextensions="\
        --enable-bcmath=shared \
        --enable-calendar=shared \
        --enable-dba=shared \
        --enable-exif=shared \
        --enable-ftp=shared \
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
        --with-db4=/${path_prefix} \
        --with-enchant=shared,/${path_prefix} \
        --with-freetype-dir=/${path_prefix} \
        --with-gd=shared,/${path_prefix} \
        --with-gdbm \
        --with-gettext=shared \
        --with-gmp=shared \
        --with-iconv=shared \
        --with-imap-ssl \
        --with-imap=shared \
        --with-kerberos=/${path_prefix} \
        --with-ldap=shared \
        --with-ldap-sasl \
        --with-libzip \
        --with-mhash \
        --with-mysql-sock=/run/mysqld/mysqld.sock \
        --with-mysqli=shared,mysqlnd \
        --with-openssl \
        --with-pcre-regex=/${path_prefix} \
        --with-pdo-dblib=shared,/${path_prefix} \
        --with-pdo-mysql=shared,mysqlnd \
        --with-pdo-odbc=shared,unixODBC,/${path_prefix} \
        --with-pdo-pgsql=shared \
        --with-pdo-sqlite=shared,/${path_prefix} \
        --with-pgsql=shared \
        --with-pspell=shared \
        --with-readline \
        --with-snmp=shared \
        --with-sodium=shared \
        --with-sqlite3=shared,/${path_prefix} \
        --with-tidy=shared \
        --with-unixODBC=shared,/${path_prefix} \
        --with-xmlrpc=shared \
        --with-xsl=shared \
        --with-zlib \
        --enable-pcntl \
        "

    # php
    if [ ! -d "${srcdir}/build" ]; then
        mkdir "${srcdir}/build"
    fi
    cd "${srcdir}/build"
    if [ -L configure ]; then
       rm configure
    fi

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
    cp -a "${srcdir}/build" "${srcdir}/build-apache"
    cd "${srcdir}/build-apache"
    ./configure ${_phpconfig} \
        --with-apxs2 \
        ${_phpextensions}
    make

    # phpdbg
    cp -a "${srcdir}/build" "${srcdir}/build-phpdbg"
    cd "${srcdir}/build-phpdbg"
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
    backup=("${path_config}/php.ini")
    #provides=("${pkgbase}=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
    
    install -D -m644 ${srcdir}/${_base}-${pkgver}/php.ini-production ${pkgdir}/${path_config}/php.ini
    install -d -m755 ${pkgdir}/${path_config}/conf.d/

    # remove static modules
    rm -f ${pkgdir}/${path_extensions}/*.a
    # remove modules provided by sub packages
    rm -f ${pkgdir}/${path_extensions}/{enchant,gd,imap,intl,sodium,mcrypt,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
    # remove empty directory
    rmdir ${pkgdir}/${path_prefix}/include/php/include
 
    # move include directory
    mv ${pkgdir}/${path_prefix}/include/php ${pkgdir}/${path_prefix}/include/${pkgbase}

    # fix phar symlink
    rm ${pkgdir}/${path_prefix}/bin/phar  
    ln -sf ${name_phar}.phar ${pkgdir}/${path_prefix}/bin/${name_phar}

    # rename executables
    mv ${pkgdir}/${path_prefix}/bin/phar.phar ${pkgdir}/${path_prefix}/bin/${name_phar}.phar


    # rename man pages
    mv ${pkgdir}/${path_prefix}/share/man/man1/{phar,${name_phar}}.1
    mv ${pkgdir}/${path_prefix}/share/man/man1/phar.{phar,${name_phar}}.1

    # fix paths in executables
    sed -i "/^includedir=/c \includedir=/${path_prefix}/include/${pkgbase}" ${pkgdir}/${path_prefix}/bin/${name_phpize}
    sed -i "/^include_dir=/c \include_dir=/${path_prefix}/include/${pkgbase}" ${pkgdir}/${path_prefix}/bin/${name_phpconfig}

    # make phpize use php-config${phpbase}
    sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${name_phpconfig}]], ${name_phpconfig}, no)" ${pkgdir}/${path_prefix}/lib/${pkgbase}/build/phpize.m4
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
    echo "LoadModule php_module7 modules/lib${pkgbase}.so"
    echo "AddHandler php7-script .php"
    echo "# End of Include List"
    echo "Include conf/extra/${name_apache_module_conf}"
    install -D -m755 ${srcdir}/build-apache/libs/${name_libapache_source} ${pkgdir}/${path_prefix}/lib/httpd/modules/lib${pkgbase}.so
    install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${name_apache_module_conf}
}

package_php72-fpm() {
    pkgdesc='FastCGI Process Manager for PHP'
    depends=("${pkgbase}" 'systemd')
    backup=("etc/${pkgbase}/php-fpm.conf" "etc/${pkgbase}/php-fpm.d/www.conf")
    options=('!emptydirs')
    #provides=("${pkgbase}-fpm=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} install-fpm
    install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/${path_prefix}/lib/systemd/system/${pkgbase}-fpm.service
    install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/${path_prefix}/lib/tmpfiles.d/${pkgbase}-fpm.conf
}

package_php72-embed() {
    pkgdesc='Embedded PHP SAPI library'
    depends=("${pkgbase}" 'libsystemd')
    options=('!emptydirs')
    #provides=("${pkgbase}-embed=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
    mv ${pkgdir}/${path_prefix}/lib/${name_libembed_source} ${pkgdir}/${path_prefix}/lib/libphp${phpbase}${suffix}.so
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

    install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/${path_extensions}/pdo_dblib.so
}

package_php72-enchant() {
    pkgdesc='enchant module for PHP'
    depends=("${pkgbase}" 'enchant')
    #provides=("${pkgbase}-enchant=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/${path_extensions}/enchant.so
}

package_php72-gd() {
    pkgdesc='gd module for PHP'
    depends=("${pkgbase}" 'gd')
    #provides=("${pkgbase}-gd=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/${path_extensions}/gd.so
}

package_php72-imap() {
    pkgdesc='imap module for PHP'
    depends=("${pkgbase}" 'c-client')
    #provides=("${pkgbase}-imap=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/${path_extensions}/imap.so
}

package_php72-intl() {
    pkgdesc='intl module for PHP'
    depends=("${pkgbase}" 'icu')
    #provides=("${pkgbase}-intl=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/${path_extensions}/intl.so
}

package_php72-odbc() {
    pkgdesc='ODBC modules for PHP'
    depends=("${pkgbase}" 'unixodbc')
    #provides=("${pkgbase}-odbc=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/${path_extensions}/odbc.so
    install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/${path_extensions}/pdo_odbc.so
}

package_php72-pgsql() {
    pkgdesc='PostgreSQL modules for PHP'
    depends=("${pkgbase}" 'postgresql-libs')
    #provides=("${pkgbase}-pgsql=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/${path_extensions}/pgsql.so
    install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/${path_extensions}/pdo_pgsql.so
}

package_php72-pspell() {
    pkgdesc='pspell module for PHP'
    depends=("${pkgbase}" 'aspell')
    #provides=("${pkgbase}-pspell=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/${path_extensions}/pspell.so
}

package_php72-snmp() {
    pkgdesc='snmp module for PHP'
    depends=("${pkgbase}" 'net-snmp')
    #provides=("${pkgbase}-snmp=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/${path_extensions}/snmp.so
}

package_php72-sqlite() {
    pkgdesc='sqlite module for PHP'
    depends=("${pkgbase}" 'sqlite')
    #provides=("${pkgbase}-sqlite=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/${path_extensions}/sqlite3.so
    install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/${path_extensions}/pdo_sqlite.so
}

package_php72-tidy() {
    pkgdesc='tidy module for PHP'
    depends=("${pkgbase}" 'tidy')
    #provides=("${pkgbase}-tidy=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/${path_extensions}/tidy.so
}

package_php72-xsl() {
    pkgdesc='xsl module for PHP'
    depends=("${pkgbase}" 'libxslt')
    #provides=("${pkgbase}-xsl=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/${path_extensions}/xsl.so
}

package_php72-sodium() {
    pkgdesc='sodium module for PHP'
    depends=("${pkgbase}" 'libsodium')
    #provides=("${pkgbase}-sodium=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/sodium.so ${pkgdir}/${path_extensions}/sodium.so
}

sha256sums=('409e11bc6a2c18707dfc44bc61c820ddfd81e17481470f3405ee7822d8379903'
            'e438f7a429915d9fe5affce2a32315b670fa0f2b2638ca51e7072374d367ca07'
            'a67ed00467fb886e73808a3246e7a6f6bfb60fa3c24a692e21a4dd474b8353fd'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce'
            'bdd47c439c81b46384332c8b0180e70b80d8b38d844f0dde9d1be329e4c62f18'
            '3217979d2ea17f9c6c9209e220d41a5f4e6a6b65fcc7cd5ab8d938f65ca2b59e'
            'd47310dfa4c53fd30744e49b0bacfcabe055568a33af08e28bc5bc80a852b4c4'
            'b11c3de747ef222696f5135556d624e3f7f0135a3cb1b06082f1ec8e9b7eeb0a'
            'f9fe57f809ac13e0043d18b795ef777af3e8c710a83745b37b09db536f683d2a')
