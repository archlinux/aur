# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgname=('teleport' 'teleport-client')
_pkgname=teleport
pkgver=10.2.6
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=('glibc')
makedepends=('go>=1.17.0' 'rust')
provides=('tctl' 'tsh')

_webassets_ref='7d687f6907da48e528924ab3486e0467c134bc99'

_go_srcpath="go/src/github.com/gravitational"

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "${_pkgname}-webassets-${_webassets_ref}.tar.gz::https://github.com/gravitational/webassets/archive/${_webassets_ref}.tar.gz"
        "teleport.service"
        "teleport@.service"
        "teleport.install")

sha256sums=('85090cbc25ff0d415488c5dedfe2f4c40d1b72b8ee5c61eda11ee14b71bce314'
            'fdff671af37cbad76f7f2a04cc9e729bab1d8ab20ad34ee6c26a6317992dc6ef'
            '10ac25cea1b5c193d7f968ca28a1da0e54b847f29c2a0186b46fd853194be38a'
            '4bc17fdde981f91c5d9972ae0555ee5e8b63a6b67e007c28f83ada80823980fd'
            'ce2dd61cae3c0c3684e7e629f98b77551e66ddedca2194250a34f0efbc674f3a')

prepare() {
    install -dm755 "${srcdir}/go/src/github.com"

    if [ -d "${srcdir}/${_pkgname}-${pkgver}" ]; then
        rm -Rf "${srcdir}/${_go_srcpath}"
        mv "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_go_srcpath}"
    fi

    if [ -d "${srcdir}/webassets-${_webassets_ref}" ]; then
        rm -Rf "${srcdir}/${_go_srcpath}/webassets"
        mv "${srcdir}/webassets-${_webassets_ref}" "${srcdir}/${_go_srcpath}/webassets"
    fi
}

build() {
    cd "${srcdir}/${_go_srcpath}"

    export GOPATH="${srcdir}/go"
    export CARGO_HOME="${srcdir}/cargo"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export ADDFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # Build
    PATH="${PATH}:${CARGO_HOME}/bin" make full

    # Make sure go path is writable so it can be cleaned up
    chmod -R u+w "${srcdir}/go"
}

package_teleport() {
    install=teleport.install
    replaces=('teleport-client')

    cd "${srcdir}/${_go_srcpath}"

    # Install binaries
    install -Dm755 build/teleport "${pkgdir}/usr/bin/teleport"
    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"

    # Install services
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport@.service "${pkgdir}/usr/lib/systemd/system/teleport@.service"

    # Copy example files
    install -dm755 "${pkgdir}/usr/share/teleport"
    cp -r examples "${pkgdir}/usr/share/teleport/"
}

package_teleport-client() {
    replaces=('teleport')

    cd "${srcdir}/${_go_srcpath}"

    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}
