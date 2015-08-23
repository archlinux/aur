# Maintainer: saneki <s@neki.me>
pkgname=toxfile-git
_pkgname=toxfile
pkgver=43.650640c
pkgrel=1
pkgdesc="Utilities for toxfiles."
arch=("any")
url="https://github.com/saneki/toxfile"
license=("GPL-3.0")
makedepends=(git)
depends=(jansson toxcore)
source=("git://github.com/saneki/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  git submodule update --init --recursive
  TOXDUMP_SO_JANSSON=true make
}

package() {
  # Install binaries
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm0755 "${_pkgname}/toxdump" "${pkgdir}/usr/bin/"
  install -Dm0755 "${_pkgname}/toxfile" "${pkgdir}/usr/bin/"
  # Install man pages
  mkdir -p "${pkgdir}/usr/share/man/man1"
  gzip --stdout "${_pkgname}/man/toxdump.1" > "${pkgdir}/usr/share/man/man1/toxdump.1.gz"
  gzip --stdout "${_pkgname}/man/toxfile.1" > "${pkgdir}/usr/share/man/man1/toxfile.1.gz"
}
