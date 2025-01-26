# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: peanut2 <riseup-vpn-git>
# Contributor: rany <rany at i2pmail dot org>
# Contributor: Akuma <https://0xacab.org/leap/bitmask-vpn/-/issues/94#note_173017>

pkgname=riseup-vpn
pkgver=0.24.10
_commit=e19159452c312d46ca7795844c5b32fc3fd32f2b
pkgrel=1
pkgdesc="Easy, fast, and secure VPN service from riseup.net"
url="https://0xacab.org/leap/bitmask-vpn"
license=('GPL-3.0-only')
arch=('x86_64')
depends=('gcc-libs' 'hicolor-icon-theme' 'libglvnd' 'lxsession' 'openvpn'
         'python' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-tools')
makedepends=('cmake' 'go' 'git')
source=("git+$url.git#commit=$_commit"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '76955f7b4ab01aa9a6fa8213fc062765158dda8783075459b79c147febe45bb4'
            'e21a0d99dcea6b849f80960fccc488e6294e3e794b0033fdc163291ecc8595ff')

prepare() {
  cd bitmask-vpn
  export GOCACHE="$srcdir/GOCACHE"
  PROVIDER=riseup make vendor
}

build() {
  cd bitmask-vpn
  export GOCACHE="$srcdir/GOCACHE"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  PROVIDER=riseup LRELEASE=/usr/lib/qt6/bin/lrelease RELEASE=yes make build
}

check() {
  cd bitmask-vpn
  export GOCACHE="$srcdir/GOCACHE"
  CI="dont run CI tests as they are broken" make test
}

package() {
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $pkgname.png -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  cd bitmask-vpn
  install -Dm644 gui/resources/riseup-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 helpers/se.leap.bitmask.policy -t "$pkgdir/usr/share/polkit-1/actions"
  install -Dm755 helpers/bitmask-root -t "$pkgdir/usr/bin"
  install -Dm755 build/qt/release/$pkgname -t "$pkgdir/usr/bin"
}
