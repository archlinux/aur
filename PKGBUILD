pkgname=riseup-vpn-git
pkgver() {
   cd "bitmask-vpn"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgver=0.21.2
pkgdesc="RiseupVPN is a branded build of Bitmask VPN. Bitmask VPN is a minimal rewrite of the Bitmask VPN Client, written in golang, that for now lacks client authentication, and is preconfigured to use a single provider."
url="https://0xacab.org/leap/bitmask-vpn"
arch=('x86_64')
license=('GPL3')
depends=(
    'python'
    'openvpn'
    'qt5-declarative'
    'qt5-quickcontrols'
    'qt5-quickcontrols2'
    'hicolor-icon-theme'
)
makedepends=(
    'go'
    'golang-golang-x-text'
    'qt5-base'
    'qt5-tools'
    'git'
    'qt-installer-framework'
    'pkgconf'
    'cmake'
    'fakeroot'
)
source=(
    "git+https://0xacab.org/leap/bitmask-vpn.git"
    "riseup-vpn_launcher.desktop"
    "riseup-vpn.png"
)
sha1sums=(
    'SKIP'
    '17e503a9c0a119c4eb78f0eee243ffc7f85095b5'
    '7cb4d92288febba7de7da27c5ee8f7d867a0b221'
)
build() {
    cd "bitmask-vpn"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

	make generate

    go build -buildmode=c-archive -o lib/libgoshim.a gui/backend.go

    PROVIDER=riseup make build
}

check() {
	cd "bitmask-vpn"

	make test
}

package() {
	install -Dm644 riseup-vpn_launcher.desktop "${pkgdir}/usr/share/applications/riseup-vpn_launcher.desktop"
	install -Dm644 riseup-vpn.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/riseup-vpn.png"

    cd "bitmask-vpn"
    install -Dm755 helpers/bitmask-root "${pkgdir}/usr/bin/bitmask-root"
    install -Dm644 helpers/se.leap.bitmask.policy "${pkgdir}/usr/share/polkit-1/actions/se.leap.bitmask.policy"
    install -Dm755 build/qt/release/riseup-vpn "${pkgdir}/usr/bin/riseup-vpn"
}
