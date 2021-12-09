# Build props
phpbase=81
pkgver=8.1.0
pkgrel=4

# Custom suffix
suffix=

arch=('x86_64' 'i686')
license=('PHP')
url='https://www.php.net/'

# Has php string
_base="php"

# Calculated
pkgdesc="${_base} ${pkgver} compiled as to not conflict with mainline ${_base}"
pkgbase="${_base}${phpbase}${suffix}"
pkgname=("${pkgbase}" "${_base}${phpbase}-"{cgi,apache,fpm,embed,phpdbg,dblib,enchant,gd,imap,intl,odbc,pgsql,pspell,snmp,sqlite,tidy,xsl,sodium}${suffix})

makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libsodium' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds' 'pcre2' 'libnsl'
             'oniguruma' 'patchutils')
checkdepends=('procps-ng')

source=("https://php.net/distributions/${_base}-${pkgver}.tar.xz"
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch')

# Version specific"
name_libapache_source="libphp.so"
name_libembed_source="libphp.so"

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
    autoconf
    rm tests/output/stream_isatty_*.phpt
    rm Zend/tests/arginfo_zpp_mismatch*.phpt
}

build() {
    # http://site.icu-project.org/download/61#TOC-Migration-Issues
    #unset CPPFLAGS
    CPPFLAGS+=' -DU_USING_ICU_NAMESPACE=1'
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
        --enable-gd=shared \
        --enable-intl=shared \
        --enable-mbstring \
        --enable-pcntl \
        --enable-shmop=shared \
        --enable-soap=shared \
        --enable-sockets=shared \
        --enable-sysvmsg=shared \
        --enable-sysvsem=shared \
        --enable-sysvshm=shared \
        --with-bz2=shared \
        --with-curl=shared \
        --with-db4=/${path_prefix} \
        --with-enchant=shared \
        --with-external-gd \
        --with-external-pcre \
        --with-ffi=shared \
        --with-gdbm \
        --with-gettext=shared \
        --with-gmp=shared \
        --with-iconv=shared \
        --with-imap-ssl \
        --with-imap=shared \
        --with-kerberos \
        --with-ldap=shared \
        --with-ldap-sasl \
        --with-mhash \
        --with-mysql-sock=/run/mysqld/mysqld.sock \
        --with-mysqli=shared,mysqlnd \
        --with-openssl \
        --with-password-argon2 \
        --with-pdo-dblib=shared,/${path_prefix} \
        --with-pdo-mysql=shared,mysqlnd \
        --with-pdo-odbc=shared,unixODBC,/${path_prefix} \
        --with-pdo-pgsql=shared \
        --with-pdo-sqlite=shared \
        --with-pgsql=shared \
        --with-pspell=shared \
        --with-readline \
        --with-snmp=shared \
        --with-sodium=shared \
        --with-sqlite3=shared \
        --with-tidy=shared \
        --with-unixODBC=shared \
        --with-xsl=shared \
        --with-zlib \
        --with-zip=shared \
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
    #unset CPPFLAGS
    cd ${srcdir}/build

    # Check if sendmail was configured correctly (FS#47600)
    sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

    export REPORT_EXIT_STATUS=1
    export NO_INTERACTION=1
    export SKIP_ONLINE_TESTS=1
    export SKIP_SLOW_TESTS=1
    export TEST_PHP_ARGS="-j$(nproc)"
    export TESTS='tests Zend'
    make test
}

package_php81() {
    pkgdesc='A general-purpose scripting language that is especially suited to web development'
    depends=('libxml2' 'hspell' 'nuspell' 'libvoikko' 'curl' 'libzip' 'pcre2' 'argon2')
    backup=("etc/${pkgbase}/php.ini")
    #provides=("${pkgbase}=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
    install -D -m644 ${srcdir}/${_base}-${pkgver}/php.ini-production ${pkgdir}/${path_config}/php.ini
    install -d -m755 ${pkgdir}/${path_config}/conf.d/

    # remove static modules
    rm -f ${pkgdir}/${path_extensions}/*.a
    # remove modules provided by sub packages
    rm -f ${pkgdir}/${path_extensions}/{enchant,gd,imap,intl,sodium,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
    # remove empty directory
    rmdir ${pkgdir}/${path_prefix}/include/php/include

    # move include directory
    mv ${pkgdir}/${path_prefix}/include/php ${pkgdir}/${path_prefix}/include/${pkgbase}

    # fix phar symlink
    #rm ${pkgdir}/${path_prefix}/bin/phar  
    ln -sf ${name_phar}.phar ${pkgdir}/${path_prefix}/bin/${name_phar}

    # rename executables
    #mv ${pkgdir}/${path_prefix}/bin/phar.phar ${pkgdir}/${path_prefix}/bin/${name_phar}.phar


    # rename man pages
    #mv ${pkgdir}/${path_prefix}/share/man/man1/{phar,${name_phar}}.1
    #mv ${pkgdir}/${path_prefix}/share/man/man1/phar.{phar,${name_phar}}.1

    # fix paths in executables
    sed -i "/^includedir=/c \includedir=/${path_prefix}/include/${pkgbase}" ${pkgdir}/${path_prefix}/bin/${name_phpize}
    sed -i "/^include_dir=/c \include_dir=/${path_prefix}/include/${pkgbase}" ${pkgdir}/${path_prefix}/bin/${name_phpconfig}

    # make phpize use php-config${phpbase}
    sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${name_phpconfig}]], ${name_phpconfig}, no)" ${pkgdir}/${path_prefix}/lib/${pkgbase}/build/phpize.m4
}

package_php81-cgi() {
    pkgdesc='CGI and FCGI SAPI for PHP'
    depends=("${pkgbase}")
    #provides=("${pkgbase}-cgi=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php81-apache() {
    pkgdesc='Apache SAPI for PHP'
    depends=("${pkgbase}" 'apache')
    backup=("etc/httpd/conf/extra/${name_apache_module_conf}")
    #provides=("${pkgbase}-apache=${pkgver}")
    echo "# End of LoadModule in httpd.conf - see ArchWiki Apache HTTP Server"
    echo "LoadModule php_module modules/lib${pkgbase}.so"
    echo "AddHandler php-script .php"
    echo "# End of Include List"
    echo "Include conf/extra/${name_apache_module_conf}"
    install -D -m755 ${srcdir}/build-apache/libs/${name_libapache_source} ${pkgdir}/${path_prefix}/lib/httpd/modules/lib${pkgbase}.so
    install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${name_apache_module_conf}
}

package_php81-fpm() {
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

package_php81-embed() {
    pkgdesc='Embedded PHP SAPI library'
    depends=("${pkgbase}" 'libsystemd')
    options=('!emptydirs')
    #provides=("${pkgbase}-embed=${pkgver}")

    cd ${srcdir}/build
    make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
    mv ${pkgdir}/${path_prefix}/lib/${name_libembed_source} ${pkgdir}/${path_prefix}/lib/libphp${phpbase}${suffix}.so
}

package_php81-phpdbg() {
    pkgdesc='Interactive PHP debugger'
    depends=("${pkgbase}")
    options=('!emptydirs')
    #provides=("${pkgbase}-phpdbg=${pkgver}")

    cd ${srcdir}/build-phpdbg
    make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php81-dblib() {
    pkgdesc='dblib module for PHP'
    depends=("${pkgbase}" 'freetds')
    #provides=("${pkgbase}-dblib=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/${path_extensions}/pdo_dblib.so
}

package_php81-enchant() {
    pkgdesc='enchant module for PHP'
    depends=("${pkgbase}" 'enchant')
    #provides=("${pkgbase}-enchant=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/${path_extensions}/enchant.so
}

package_php81-gd() {
    pkgdesc='gd module for PHP'
    depends=("${pkgbase}" 'gd')
    #provides=("${pkgbase}-gd=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/${path_extensions}/gd.so
}

package_php81-imap() {
    pkgdesc='imap module for PHP'
    depends=("${pkgbase}" 'c-client')
    #provides=("${pkgbase}-imap=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/${path_extensions}/imap.so
}

package_php81-intl() {
    pkgdesc='intl module for PHP'
    depends=("${pkgbase}" 'icu')
    #provides=("${pkgbase}-intl=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/${path_extensions}/intl.so
}

package_php81-odbc() {
    pkgdesc='ODBC modules for PHP'
    depends=("${pkgbase}" 'unixodbc')
    #provides=("${pkgbase}-odbc=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/${path_extensions}/odbc.so
    install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/${path_extensions}/pdo_odbc.so
}

package_php81-pgsql() {
    pkgdesc='PostgreSQL modules for PHP'
    depends=("${pkgbase}" 'postgresql-libs')
    #provides=("${pkgbase}-pgsql=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/${path_extensions}/pgsql.so
    install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/${path_extensions}/pdo_pgsql.so
}

package_php81-pspell() {
    pkgdesc='pspell module for PHP'
    depends=("${pkgbase}" 'aspell')
    #provides=("${pkgbase}-pspell=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/${path_extensions}/pspell.so
}

package_php81-snmp() {
    pkgdesc='snmp module for PHP'
    depends=("${pkgbase}" 'net-snmp')
    #provides=("${pkgbase}-snmp=${pkgver}")

    install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/${path_extensions}/snmp.so
}

package_php81-sqlite() {
    pkgdesc='sqlite module for PHP'
    depends=("${pkgbase}" 'sqlite')
    #provides=("${pkgbase}-sqlite=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/${path_extensions}/sqlite3.so
    install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/${path_extensions}/pdo_sqlite.so
}

package_php81-tidy() {
    pkgdesc='tidy module for PHP'
    depends=("${pkgbase}" 'tidy')
    #provides=("${pkgbase}-tidy=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/${path_extensions}/tidy.so
}

package_php81-xsl() {
    pkgdesc='xsl module for PHP'
    depends=("${pkgbase}" 'libxslt')
    #provides=("${pkgbase}-xsl=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/${path_extensions}/xsl.so
}

package_php81-sodium() {
    pkgdesc='sodium module for PHP'
    depends=("${pkgbase}" 'libsodium')
    #provides=("${pkgbase}-sodium=${pkgver}")
    install -D -m755 ${srcdir}/build/modules/sodium.so ${pkgdir}/${path_extensions}/sodium.so
}


sha256sums=('a1317eff0723a2b3d3122bbfe107a1158570ea2822dc35a5fb360086db0f6bbc'
            '702b163c66c65af92dcad8d79f41bda84bcd5d863235fcf1497c33a86db9e4ca'
            '4a2add00d93fa991ccdf6356090264c1059c79935642afff6e8d4a2107fa037e'
            '96e0b05a5ec72ee0f907d29fbb9612414d9dfebeee1249cbf2f2318bacf2d37c'
            'eb0c0aec5b5fb282df0bfefd4d5bbc229ee80a5c5da6760ecf52697a23cc7175'
            'cc17f28807c63c49c6047fbaf19384f348af51bb0e737b364b9780e7b3cd4050')
