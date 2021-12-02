# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=shonenjump
pkgver=0.7.21
pkgrel=1
pkgdesc="A faster way to change directory and improve command line productivity"
arch=(x86_64)
url="https://github.com/suzaku/shonenjump"
license=(custom)
makedepends=(go)
depends=(glibc)
conflicts=(autojump)
install=readme.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/suzaku/shonenjump/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('69e9ced4213aeb1f6a06b08201bd6f91e3f4840e3315bfa6ae2afe4c0c49af7a3976c3c7839e2d1d4470e9692bf9bfa27641853f664899dd03f1e12a1620b82c')

build() {
  cd "$pkgname-$pkgver"
  go build -buildmode=pie -ldflags "-linkmode=external -extldflags=$LDFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin/"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/etc/profile.d"

  cd scripts
  for i in bash fish zsh; do
    install -m644 "$pkgname.$i" "$pkgdir/etc/profile.d/$pkgname.$i"
  done

  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -m644 _j "$pkgdir/usr/share/zsh/site-functions/_j"
}
