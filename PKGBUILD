# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="paramotopy"
pkgname="${_pkgname}-git"
pkgver=1.0.3.7.r15.48174f3
_commit="36121881a137cf29c7f662bd792a0e823d5742f2"
pkgrel=2
pkgdesc="Parallel parameter homotopy through Bertini"
arch=('x86_64')
url="https://${_pkgname}.com"
_url="https://github.com/ofloveandhate/${_pkgname}"
license=('custom:Paramotopy license')
makedepends=('git' 'boost>=1.53' 'gmp')
depends=('glibc' 'gcc-libs' 'boost-libs>=1.53' 'bertini' 'mpfr' 'openmpi')
optdepends=("${_pkgname}-docs: HTML documentation")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_deprecated_boost_timer.patch")
sha256sums=('SKIP'
            'e355ddea4c31f22c008e63f0418a2a6e77103b6779763a817604daaa3b644c21')

pkgver() {
  cd "${_pkgsrc}"
  local rev_count=$(git rev-list --count "${_commit}..HEAD")
  local short_hash=$(git rev-parse --short=7 HEAD)

  cd "${srcdir}/${_pkgsrc}"
  local version=$(sed -n 's/AC_INIT(\[paramotopy\], \[\([^]]*\)\],.*/\1/p' "configure.ac")

  printf "%s.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  sed -i 's/1\.3\.7/1.0.3.7/g' "COPYING"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  autoupdate
  CPPFLAGS+=" -I/usr/include/bertini"
  LDFLAGS+=" -L/usr/lib/bertini"
  ./configure \
    --prefix='/usr' \
    --includedir='/usr/include'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  # install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"
}
