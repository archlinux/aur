# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=fynedesk
pkgver=0.4.0
pkgrel=1
pkgdesc="An easy to use Linux/Unix desktop environment following material design"
arch=('x86_64' 'armv7h')
url="https://fyshos.com/desktop/"
license=('BSD-3-Clause')
depends=('libx11')
makedepends=('git' 'go')
optdepends=('arandr: for modifying display settings'
            'xorg-xbacklight: for laptop brightness'
            'brightnessctl: for laptop brightness'
            'connman-gtk: used for configuring Wi-Fi network settings'
            'picom: for compositor support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FyshOS/fynedesk/archive/refs/tags/v0.4.0.tar.gz")
sha256sums=('8103a1be64e841c2c0e68a9cf8e8c513a9f94fbb2ea1ec678b23bf50983a1c45')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build ./cmd/fynedesk_runner
    go build ./cmd/fynedesk
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm00644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    install -Dm00755 fynedesk_runner "${pkgdir}"/usr/bin/fynedesk_runner
    install -Dm00755 fynedesk "${pkgdir}"/usr/bin/fynedesk
    install -Dm00644 fynedesk.desktop "${pkgdir}"/usr/share/xsessions/fynedesk.desktop
}
