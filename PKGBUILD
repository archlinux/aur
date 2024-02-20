# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="3c4163e30896c9a22e996815d5e0f7876b3fc64f"
pkgname="readpe"
pkgver="0.84"
pkgrel="1"
pkgdesc="PE file analysis toolkit"
arch=("x86_64")
url="https://github.com/mentebinaria/readpe"
license=(
  "GPL-2.0-or-later"
  "OpenSSL"
)
conflicts=("pev")
depends=("openssl")
makedepends=("git")
source=(
  "readpe::git+https://github.com/mentebinaria/readpe.git#commit=${_commit}"
  "fix-install-prefix.diff"
)
sha256sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${srcdir}/readpe"
  git apply < "${srcdir}/fix-install-prefix.diff"
}

build() {
  cd "${srcdir}/readpe"
  make all
}

package() {
  (
    cd "${srcdir}/readpe/src"
    make DESTDIR="${pkgdir}/" install
  )
  (
    cd "${srcdir}/readpe/lib/libpe"
    make DESTDIR="${pkgdir}/" install
  )
  install -Dm644 \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    "${srcdir}/readpe/LICENSE.OpenSSL"
}
