# Maintainer: Didrole <Didrole@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgbase=sia
pkgname=('siac' 'siad')
pkgver=1.5.0
pkgrel=2
pkgdesc='Decentralized storage for the post-cloud world'
arch=('x86_64')
makedepends=('git' 'go')
url='https://sia.tech'
license=('MIT')
conflicts=('sia-daemon')
source=("git+https://gitlab.com/NebulousLabs/Sia.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Sia"
  
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  make release
}

package_siac() {
  pkgdesc="Sia Client - $pkgdesc"
  optdepends=('siad: sia daemon to interact with')
  
  cd "$srcdir/Sia"
  install -Dm 755 "$srcdir/bin/siac" -t "$pkgdir/usr/bin"
}

package_siad() {
  pkgdesc="Sia Daemon - $pkgdesc"
  optdepends=('siac: cli tool to manage a siad instance')

  cd "$srcdir/Sia"

  install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/sia"
  
  install -dm 755 "$pkgdir/usr/share/doc/sia"
  cp -dpr doc/* "$pkgdir/usr/share/doc/sia"
  
  install -dm 755 "$pkgdir/usr/share/man/man1"
  cp -dp doc/manpages/* "$pkgdir/usr/share/man/man1"
  
  install -Dm 755 "$srcdir/bin/siad" -t "$pkgdir/usr/bin"
}
