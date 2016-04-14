pkgname=('heka')
srcname='heka'
pkgdesc='Data collection and processing made easy'
pkgver='0.10.0'
pkgrel='7'
arch=('i686' 'x86_64')
url="https://github.com/mozilla-services/${srcname}"
license=('MPL2')

depends=('geoip')
makedepends=(
    'cmake'
    'gcc'
    'git'
    'go'
    'make'
    'mercurial'
    'patch'
)
optdepends=('geoip-database-extra: GeoIpDecoder')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=(
    "${srcname}::git+https://github.com/mozilla-services/${srcname}.git#tag=v${pkgver}"
    'heka.service'
    'cmake.patch'
)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

install='install.sh'

prepare() {
    cd "${srcdir}/${srcname}"

    git apply "${srcdir}/cmake.patch"
}

build() {
    path_build="${srcdir}/build"
    mkdir --parents "${path_build}"
    cd "${path_build}"

    export GOPATH="${path_build}/heka"
    export LD_LIBRARY_PATH="${GOPATH}/lib"
    export DYLD_LIBRARY_PATH="${GOPATH}/lib"
    export GOBIN="${GOPATH}/bin"
    export PATH="${GOBIN}:${PATH}"
    export CTEST_OUTPUT_ON_FAILURE=1

    cmake \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='release' \
        -DHEKA_PATH='/usr/share/heka' \
        "${srcdir}/${srcname}"
    make
}

package() {
    path_build="${srcdir}/build"
    cd "${path_build}"

    export GOPATH="${path_build}/heka"
    export GOBIN="${GOPATH}/bin"
    export PATH="${GOBIN}:${PATH}"

    make DESTDIR="${pkgdir}" install

    install --owner='533' --group='533' --mode='750' --directory "${pkgdir}/var/cache/hekad"
    install --directory "${pkgdir}/etc/heka/conf.d"
    install -D --mode='644' "${srcdir}/heka.service" "${pkgdir}/usr/lib/systemd/system/heka.service"
}
