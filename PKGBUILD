# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="ad4d5a586f022f36b6b925a63ffd667cb729731d"
pkgname=readpe
pkgver=0.82
pkgrel=1
pkgdesc="PE file analysis toolkit"
arch=(x86_64)
url="https://github.com/mentebinaria/readpe"
license=(GPL custom:OpenSSL)
provides=(readpe)
conflicts=(readpe)
depends=(openssl)
makedepends=(git)
source=(
  "readpe::git+https://github.com/mentebinaria/readpe.git#commit=$_commit"
  "fix-install-prefix.diff"
)
sha256sums=(
  "SKIP"
  "8fcdc73cc46a283cb243e16c253195084c5e025c50fe42b76cff07ae8b1933c9"
)

build() {
  cd readpe
  git apply < "$srcdir/fix-install-prefix.diff"
  make all
}

package() {
  (
    cd readpe/src
    make DESTDIR="$pkgdir/" install
  )
  (
    cd readpe/lib/libpe
    make DESTDIR="$pkgdir/" install
  )
  install -Dm644 \
    -t "$pkgdir/usr/share/licenses/$pkgname/" \
    "$srcdir/readpe/LICENSE.OpenSSL"
}
