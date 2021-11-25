# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=shonenjump
pkgver=0.7.20
pkgrel=3
pkgdesc="A faster way to change directory and improve command line productivity"
arch=(x86_64)
url="https://github.com/suzaku/shonenjump"
license=(custom)
makedepends=(go)
depends=(glibc)
conflicts=(autojump)
install=readme.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/suzaku/shonenjump/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fbc85639dfde6451a7103d186e6d2db72b9d6b2294c13f794b80d50804b544b47d7422b93375026473eb732a9cd9597ad8016903d8e2370e54e9868b8c9001f7')

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="$LDFLAGS"
  go build -v -ldflags "-buildmode=pie"
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
