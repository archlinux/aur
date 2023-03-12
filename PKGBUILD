# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="nominatim"
pkgdesc="Geocoding tool using OpenStreetmap data"
url="https://nominatim.org"

pkgver=4.2.1
pkgrel=1

arch=("x86_64")
license=("GPL2")

makedepends=(
    "clang"
    "cmake"
)
depends=(
    "expat"
    "proj"
    "boost"
    "boost-libs"

    "git"
    "libosmium"
    "osm2pgsql"

    "postgresql"
    "postgis"
    "python-psycopg2"
    "python-dotenv"
    "python-psutil"
    "python-jinja"
    "python-pyicu"
    "python-yaml"
    "python-requests"
    "libdatrie"
    "php"
    "php-cgi"
    "php-intl"
    "php-pgsql"
    "pyosmium"
)
optdepends=(
    "nominatim-data-wikipedia: optional auxiliary data source to help indicate the importance of OSM features"
    "nominatim-data-postcodes-gb: improve searches that involve a UK postcode"
    "nominatim-data-postcodes-us: improve searches that involve a US postcode"
    "nominatim-data-tiger: improves searches that involve US house numbers"
)
checkdepends=(
    "python-behave"
    "phpunit"
    "php-codesniffer"
    "python-pylint"
    "python-pytest"
)

source=(
    "https://nominatim.org/release/Nominatim-${pkgver}.tar.bz2"
    "https://www.nominatim.org/data/country_grid.sql.gz"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
    "apache.conf"
    "nginx.conf"
    "php.ini"
    "php-fpm.conf"
    "0001-Fix-configuration-to-point-to-installed-files.patch"
    "0002-Set-default-project-directory-to-package-provided-di.patch"
)
sha256sums=('5fb07d880faa2a0f96fda6357847e82a683b3e6cc7520fb46084d47cc6547091'
            'fe66393aaf561749255cebf4c61d13a8425e326b8ce50409d88c4035165de049'
            '7f71b5217cbe0713fa5f8baa138348c9cd49f42c2b6025c059076042e0c04c6d'
            '50bf612ad951bcf3c1969aa79b0c7ab78745983720bc5f2deb37d1704c0e37d8'
            'fdde0a7fb8fac01fabf05a63ff7d2d4dd7bdaa2fca980de899f01ce2a4063e56'
            'ed00242d06d6a17297a30675befef110f354a6f4bd2804d58796d956a9ae54a2'
            '37c4b17463f8317d39bb741b07bbb693afc0bbf584eec590f89b849542b98b7d'
            'c2d5391160704bc636fde73c0e92346529ae1698f1cc909a8341271e0e4967d4'
            'ed051533ad83fb93e458e31d4e116ad9717ff8d4edc7af0dec2b2a3bb61c7172'
            '4650a98992bb0371cffa740c9ffc3b92032346d0ae13fb78e34aeeb534ee5255')
noextract=(
    "country_grid.sql.gz"
)

install="${pkgname}.install"

prepare() {
    cd "Nominatim-$pkgver"

    patch -p1 < "$srcdir/0001-Fix-configuration-to-point-to-installed-files.patch"
    patch -p1 < "$srcdir/0002-Set-default-project-directory-to-package-provided-di.patch"
    cp "$srcdir/country_grid.sql.gz" "data/country_grid.sql.gz"
}

build() {
    # The postgres module is built using postgres' module makefiles, which set CFLAGS to the ones
    # used during postgres' compilation. This includes -ffile-prefix-map, which breaks debug packages.
    # Add our $DEBUG_CFLAGS to CUSTOM_COPT, which is appended to CFLAGS in
    # /usr/lib/postgresql/pgxs/src/Makefile.global.
    export CUSTOM_COPT=$DEBUG_CFLAGS

    cmake -S "Nominatim-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE="None" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DBUILD_OSM2PGSQL=off

    make -C build VERBOSE=1
}

package() {
    cd "${srcdir}/build/"
    make DESTDIR="${pkgdir}/" install

    # install apache and nginx example configs
    install -Dm644 "${srcdir}/apache.conf" -t "${pkgdir}/usr/share/doc/$pkgname/examples/"
    install -Dm644 "${srcdir}/nginx.conf" -t "${pkgdir}/usr/share/doc/$pkgname/examples/"

    # Install PHP configs
    install -Dm644 "${srcdir}/php-fpm.conf" "${pkgdir}/etc/php/php-fpm.d/nominatim.conf"
    install -Dm644 "${srcdir}/php.ini" "${pkgdir}/etc/php/conf.d/nominatim.ini"

    # create users and directories
    install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim: set et ts=4:
