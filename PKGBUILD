# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="927b79a5ba895dd3fbd3f158b49ebf2094d4805d"
pkgname="readpe"
pkgver="0.85"
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
  "fix-version-string.diff"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

prepare() {
  cd "${srcdir}/readpe"
  git apply < "${srcdir}/fix-install-prefix.diff"
  git apply < "${srcdir}/fix-version-string.diff"
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
