# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: rany <rany at i2pmail dot org>
# Contributor: Akuma (https://0xacab.org/leap/bitmask-vpn/-/issues/94#note_173017)

pkgname=riseup-vpn
pkgver=0.21.11
pkgrel=3
pkgdesc="Easy, fast, and secure VPN service from riseup.net"
url="https://0xacab.org/leap/bitmask-vpn"
arch=('x86_64')
license=('GPL3')
depends=('hicolor-icon-theme' 'openvpn' 'python' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2')
makedepends=('cmake' 'fakeroot' 'git' 'go' 'golang-golang-x-text' 'qt-installer-framework' 'qt5-base' 'qt5-svg' 'qt5-tools')
source=("git+$url.git#tag=$pkgver"
        "riseup-vpn.png"
        "riseup-vpn_launcher.desktop")
sha256sums=('SKIP'
            '76955f7b4ab01aa9a6fa8213fc062765158dda8783075459b79c147febe45bb4'
            'e21a0d99dcea6b849f80960fccc488e6294e3e794b0033fdc163291ecc8595ff')

build() {
  cd bitmask-vpn
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  make generate

  go build -buildmode=c-archive -o lib/libgoshim.a gui/backend.go

  PROVIDER=riseup make build
}

check() {
  cd bitmask-vpn
  make test
}

package() {
  install -Dm644 riseup-vpn_launcher.desktop "$pkgdir/usr/share/applications/riseup-vpn_launcher.desktop"
  install -Dm644 riseup-vpn.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/riseup-vpn.png"
  cd bitmask-vpn
  install -Dm755 helpers/bitmask-root "$pkgdir/usr/bin/bitmask-root"
  install -Dm644 helpers/se.leap.bitmask.policy "$pkgdir/usr/share/polkit-1/actions/se.leap.bitmask.policy"
  install -Dm755 build/qt/release/riseup-vpn "$pkgdir/usr/bin/riseup-vpn"
}
