# Maintainer: TNE <tne@garudalinux.org>

pkgname=snapper-tools
pkgver=1.3.2
pkgrel=1
pkgdesc="A highly opinionated Snapper GUI and CLI"
arch=('x86_64')
url="https://gitlab.com/garuda-linux/applications/$pkgname"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'polkit')
makedepends=('qt6-tools' 'cmake' 'git' 'polkit')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('71462162362a63a3baf52e2984630b7572e4e409b8714ed56410cfe520663c9a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir" install

  install -Dm0644 org.garuda.snapper-tools.pkexec.policy "$pkgdir/usr/share/polkit-1/actions/org.garuda.snapper-tools.pkexec.policy"
  install -Dm0755 snapper-tools-pkexec "$pkgdir/usr/lib/snapper-tools-pkexec"
  install -Dm0644 snapper-tools-check.desktop "$pkgdir/etc/xdg/autostart/snapper-tools-check.desktop"
}
