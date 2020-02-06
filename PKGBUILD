# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim"
pkgdesc="Geocoding tool using OpenStreetmap data"
url="https://nominatim.org"

pkgver=3.4.1
pkgrel=5

arch=("x86_64")
license=("GPL2")

makedepends=(
    "clang"
    "cmake"
    "libxml2"
)
depends=(
    "boost"
    "boost-libs"
    "expat"
    "git"
    "php"
    "php-pgsql"
    "postgis"
    "postgresql"
    "proj"
    "pyosmium"
)
optdepends=(
    "nominatim-data-wikipedia: optional auxiliary data source to help indicate the importance of OSM features"
    "nominatim-data-postcodes-gb: improve searches that involve a UK postcode"
    "nominatim-data-postcodes-us: improve searches that involve a US postcode"
)
# checkdepends=(
#     "php-codesniffer"
#     "phpunit"
#     "python-behave"
#     "python-nose"
#     "python-pip"
#     "python-psycopg2"
#     "python-setuptools"
#     "python-tidylib"
# )

source=(
    "https://nominatim.org/release/Nominatim-${pkgver}.tar.bz2"
    "${pkgname}.install"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
    "apache.conf"
    "php.ini"
    "settings-local.php"
    "webapps-paths.patch"
)
sha256sums=(
    "eea1e0e4bd0fd5c9408a734e3ad687879fbcdf670edbfa7c678daf7dc1d0fae2"
    "0be6ea5234b8622854e6147aa22afd7adfe15546ee1b514acde1654f44e75148"
    "7db2c5ff31954c02421fadd06b6758e181a7028f5ac73b16f3abdcb4caef6879"
    "1999cb2bb75046a4ea1b326082a4c1cf5de54f12ed36b1d22540c842c7c30b9d"
    "8dd94ea1a88156bc55dc41e4f4df878df4f28c23c31bfda36c89470e2f5997d0"
    "1bf1328abbc9b7453800d3e408ae14ea22d0d4ba9dc6d49b21a0e3121a6fbd49"
    "a1f3c804b2066501554c2e3af0dff3b9b16a3f89117b7e4c5e45e9c858747f74"
    "26c0cf16dd4fe2ce597a9495f5161d78a9f1f5276d8c3cf60b26b40b56caf8f1"
)
install="${pkgname}.install"

prepare() {
    mkdir -p "${srcdir}/build"
    patch -d "${srcdir}/Nominatim-${pkgver}" -p1 < webapps-paths.patch 
}

build() {
    cd "${srcdir}/build"
    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "../Nominatim-${pkgver}"
    make
}

# check() {
#     cd "${srcdir}/Nominatim-${pkgver}/test"
#     make
# }

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    
    # install is a bit confusing (~manual);
    # upstream instructs to run from build and src 
    # directory, which does not sound like the
    # thing I’d want to do.
    
    # directories to copy from source dir
    for _dir in \
        "data" \
        "data-sources" \
        "lib" \
        "munin" \
	"settings" \
        "sql" \
        "utils" \
        "wikidata"
    do
        install \
            -Ddm755 \
            "${pkgdir}/usr/share/webapps/${pkgname}/src/${_dir}"
        cp \
            -avR \
            "${srcdir}/Nominatim-${pkgver}/${_dir}" \
            "${pkgdir}/usr/share/webapps/${pkgname}/src/"
    done

    # directories to copy from build dir
    for _dir in \
        "settings" \
	"utils" \
        "website"
    do
        install \
            -Ddm755 \
            "${pkgdir}/usr/share/webapps/${pkgname}/${_dir}"

        cp \
            -avR \
            "${srcdir}/build/${_dir}" \
            "${pkgdir}/usr/share/webapps/${pkgname}/"
    done

    install -Dm755 "${srcdir}/build/module/nominatim.so" -t "${pkgdir}/usr/share/webapps/${pkgname}/module/"
    install -Dm755 "${srcdir}/build/nominatim/nominatim" -t "${pkgdir}/usr/share/webapps/${pkgname}/nominatim/"
    
    install -Ddm755 "${pkgdir}/etc/webapps/${pkgname}/settings/"
    ln -s "/usr/share/webapps/${pkgname}/settings/" "${pkgdir}/etc/webapps/${pkgname}/settings/"
    install -Dm644 "${srcdir}/apache.conf" -t "${pkgdir}/etc/webapps/${pkgname}"
    install -Dm644 "${srcdir}/settings-local.php" "${pkgdir}/usr/share/webapps/${pkgname}/settings/local.php"

    install -Dm644 "${srcdir}/php.ini" "${pkgdir}/etc/php/conf.d/nominatim.ini"

    install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
