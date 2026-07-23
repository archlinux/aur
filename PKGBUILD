# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="d1e885a271de3477bea212508be88aecff171a26"
pkgname="readpe"
pkgver="0.85"
pkgrel="1"
pkgdesc="PE file analysis toolkit"
arch=("x86_64")
url="https://github.com/mentebinaria/readpe"
license=(
  "LicenseRef-GPL-2.0-or-later-with-OpenSSL-exception AND LGPL-3.0-or-later"
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
