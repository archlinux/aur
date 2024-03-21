pkgname=riseup-vpn-git
pkgrel=1
pkgver=0.24.03.rc.1.r1.g316e632
pkgdesc="RiseupVPN is a branded build of Bitmask VPN. Bitmask VPN is a minimal rewrite of the Bitmask VPN Client, written in golang, that for now lacks client authentication, and is preconfigured to use a single provider."
url="https://0xacab.org/leap/bitmask-vpn"
arch=('x86_64')
license=('GPL3')
conflicts=('riseup-vpn')
source=(
    "git+https://0xacab.org/leap/bitmask-vpn.git"
    "riseup-vpn_launcher.desktop"
    "riseup-vpn.png"
)

sha256sums=('SKIP'
            'e21a0d99dcea6b849f80960fccc488e6294e3e794b0033fdc163291ecc8595ff'
            '18cdea88cb7feb3de898918a78f612318b066d18c174d2a9addaa448f58de15c')

pkgver() {
   cd "bitmask-vpn"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

makedepends=(
    'git'
    'cmake'
    'make'
    'which'
    'gcc'
    'go'
)

depends=(
    'qt6-base'
    'qt6-tools'
    'qt6-quickcontrols2'
    'qt6-svg'
    'openvpn'
    'python'
    'lxsession'
)

prepare() {
        cd "bitmask-vpn"
        PROVIDER=riseup make vendor
}

build() {
    cd "bitmask-vpn"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    PROVIDER=riseup QMAKE=qmake6 LRELEASE=/usr/lib/qt6/bin/lrelease make build -j $(nproc)
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

