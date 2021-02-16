# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=emptty
pkgdesc="Dead simple CLI Display Manager on TTY"
pkgver=0.5.0
pkgrel=2
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam' 'libx11')
makedepends=('go' 'git')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
backup=('etc/emptty/conf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4bc9d03fcc4a9a30a2f93f046f6fba422d0950508d87cf21e6cf565c02718bcb2c05e3c947a0cda648129d4cd3b8ef7d3f0d4a81388c7f3d15e437b270841d82')

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
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
