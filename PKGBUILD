# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="4a87bc9fac83a334dd2d6c4f63e9a5172b1d5fc7"
pkgname=readpe
pkgver=0.83
pkgrel=1
pkgdesc="PE file analysis toolkit"
arch=("x86_64")
url="https://github.com/mentebinaria/readpe"
license=("GPL" "custom:OpenSSL")
conflicts=("pev")
depends=("openssl")
makedepends=("git")
source=(
  "readpe::git+https://github.com/mentebinaria/readpe.git#commit=$_commit"
  "fix-install-prefix.diff"
  "fix-version-string.diff"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

prepare() {
  cd readpe
  git apply < "$srcdir/fix-install-prefix.diff"
  git apply < "$srcdir/fix-version-string.diff"
}

build() {
  cd readpe
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
