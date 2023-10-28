# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=emptty
pkgdesc="Dead simple CLI Display Manager on TTY"
pkgver=0.11.0
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
sha512sums=('05ca5968742e139dd1e4579b9863ba69cf958d3a7a4ae85429b30be4464635a24130d43016c63eb62f444218ebad1a1dbbe6c63379c174dd8a290d79c5102b1a')

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
  for doc in 'README.md' 'SAMPLES.md' 'screenshot.png'; do
    install -Dm 644 "$doc" -t "$pkgdir/usr/share/doc/$pkgname"
  done
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
