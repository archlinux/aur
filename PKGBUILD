# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=emptty
pkgdesc="Dead simple CLI Display Manager on TTY"
pkgver=0.4.2
pkgrel=1
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam')
makedepends=('go' 'libx11')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
backup=('etc/emptty/conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6f5deaf70d622ecf99234cd5b39b5c0b61107ab0a5d0c232d6b418fb0bafd2122237439ec52fae7f63b4ebfe66a4eb8492c8b2d09d43c141751433fcd45d9553')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-all
  make DESTDIR="$pkgdir/" install-config
  make DESTDIR="$pkgdir/" install-systemd
  echo "Disable your DM and run 'systemctl enable emptty' to enable emptty at the next boot"
}
