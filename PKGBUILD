# Maintainer: Jedrzej Nowak <pigmej@gmail.com>
# Co-Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=teleport-client
_pkgname=teleport
pkgver=6.2.8
pkgrel=1
pkgdesc="Client-only (tsh, tctl) package for teleport"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=()
makedepends=('go>=1.14.0')
provides=('tctl' 'tsh')

_webassets_ref=7820228a3ed3fac73aa74d12f2ef851eb2905058

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-webassets-${_webassets_ref}.tar.gz::https://github.com/gravitational/webassets/archive/${_webassets_ref}.tar.gz")

sha256sums=('bbc128d0778d253ec6e8af44286df750caec65d8c8e2616c85cf2656c267460f'
            'a7fac0f1bab9d73d6e60d94740bc7462f051fec9ac5febe38a22b260982a2b8e')

prepare() {
    mv "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${pkgname}"
    rm -Rf "${srcdir}/${pkgname}/webassets"
    mv "${srcdir}/webassets-${_webassets_ref}" "${srcdir}/${pkgname}/webassets"

    install -m755 -d "${srcdir}/go/src/github.com/gravitational"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/gravitational/teleport"
}

build() {
    export GOPATH="${srcdir}/go"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${GOPATH}/src/github.com/gravitational/teleport"

    make build/tctl
    make build/tsh

    rm -Rf "${srcdir}/go"
    unset GOPATH
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}
