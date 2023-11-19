# Maintainer:‌  evorster          (https://aur.archlinux.org/account/evorster)
# Contributor: dreieck          (https://aur.archlinux.org/account/dreieck)
# Contributor: Daniel Menelkir  (https://aur.archlinux.org/account/Menelkir)

_pkgname="raplcap"
pkgname="$_pkgname-git"
pkgver=v0.9.0.4.g1bc9486
pkgrel=1
pkgdesc="RAPL power capping C interface with multiple implementations, the git version for testing fixes."
arch=('x86_64')
url="https://github.com/powercap/raplcap"
license=('custom:BSD')
depends=(
  'glibc'
  'powercap'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=(
  'cmake'
)
_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v([0-9]{4})([0-9]{2})([0-9]{2})-/\1.\2.\3-r/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p _build
  cd _build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRAPLCAP_CONFIGURE_MSR_EXTRA=ON \
    ..
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  cd _build
  make test
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd _build
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"
  for _docfile in AUTHORS README.md RELEASES.md; do 
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
