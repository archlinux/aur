# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim"
pkgdesc="Geocoding tool using OpenStreetmap data"
url="https://nominatim.org"

pkgver=3.4.1
pkgrel=4

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
    "settings-local.php"
    "webapps-paths.patch"
)
sha256sums=(
    "eea1e0e4bd0fd5c9408a734e3ad687879fbcdf670edbfa7c678daf7dc1d0fae2"
    "79499b5d2a4c364f3e658e837e315644023cf120eca6b7c368aa059ab6b5082d"
    "7db2c5ff31954c02421fadd06b6758e181a7028f5ac73b16f3abdcb4caef6879"
    "1999cb2bb75046a4ea1b326082a4c1cf5de54f12ed36b1d22540c842c7c30b9d"
    "8dd94ea1a88156bc55dc41e4f4df878df4f28c23c31bfda36c89470e2f5997d0"
    "df040410ab16df4e45c14b3c3857b58d995e8a4a73dbc111612426617e68f53a"
    "c056160b4d7ec1ed43905a6d13f265f4c726ed660b819091ba17786aca525477"
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
        "sql" \
        "utils" \
        "wikidata"
    do
        install \
            -Ddm755 \
            "${srcdir}/Nominatim-${pkgver}/${_dir}" \
            "${pkgdir}/usr/share/webapps/${pkgname}/${_dir}"
        cp \
            -aR \
            "${srcdir}/Nominatim-${pkgver}/${_dir}" \
            "${pkgdir}/usr/share/webapps/${pkgname}/${_dir}"
    done

    # directories to copy from build dir
    for dir in \
        "settings" \
        "website"
    do
        install \
            -Ddm755 \
            "${srcdir}/build/${_dir}" \
            "${pkgdir}/usr/share/webapps/${pkgname}/${_dir}"

        cp \
            -aR \
            "${srcdir}/build/${_dir}" \
            "${pkgdir}/usr/share/webapps/${pkgname}/${_dir}"
    done

    install -Dm755 "${srcdir}/build/module/nominatim.so" -t "${pkgdir}/usr/share/webapps/${pkgname}/module/"
    install -Dm755 "${srcdir}/build/nominatim/nominatim" -t "${pkgdir}/usr/share/webapps/${pkgname}/nominatim/"
    
    install -Ddm755 "${pkgdir}/etc/webapps/${pkgname}/settings/"
    ln -s "/usr/share/webapps/${pkgname}/settings/" "${pkgdir}/etc/webapps/${pkgname}/settings/"
    install -Dm644 "${srcdir}/apache.conf" -t "${pkgdir}/etc/webapps/${pkgname}"
    install -Dm644 "${srcdir}/settings-local.php" "${pkgdir}/usr/share/webapps/${pkgname}/settings/local.php"

    install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
