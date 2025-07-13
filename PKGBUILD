# Contributor: Poscat <poscat@mail.poscat.moe>

pkgname=tinyfecvpn-git
_pkgname=tinyfecvpn
pkgver=20230206.0.r2.gcbdf9be
pkgrel=1
pkgdesc="A Lightweight VPN with Build-in Forward Error Correction Support"
arch=('x86_64')
url="https://github.com/wangyu-/tinyfecVPN"
license=('MIT')
provides=("tinyfecvpn")
conflicts=("tinyfecvpn")
makedepends=('git')
source=("git+https://github.com/wangyu-/tinyfecvpn.git"
        "git+https://github.com/wangyu-/UDPspeeder.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed -r 's/-([0-9]+)-g/.r\1.g/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    git submodule init
    git config submodule.UDPspeeder.url "$srcdir/UDPspeeder"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${_pkgname}"
    make nolimit 
}

package() {
    cd "${_pkgname}"
    install -D -m 755 tinyvpn "${pkgdir}/usr/bin/tinyvpn"
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
