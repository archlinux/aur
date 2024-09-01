# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="holyc-lang"
pkgname="${_pkgname}-git"
pkgver=0.0.3beta.r12.b7c7de2
pkgrel=2
pkgdesc="A HolyC compiler built from scratch in C"
arch=('x86_64')
url="https://holyc-lang.com"
_url="https://github.com/Jamesbarford/${_pkgname}"
license=('BSD-2-Clause')
makedepends=('git' 'cmake>=3.10')
depends=('glibc')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_math_linking.patch")
sha256sums=('SKIP'
            'eb4f018417b4f6181e7361d9b887e535c0aee5e9899c56d088acae4515ad045a')

pkgver() {
  cd "${_pkgsrc}"  
  local rev_count=$(git rev-list $(git describe --tags --abbrev=0)..HEAD --count)
  local short_hash=$(git rev-parse --short=7 HEAD)
  local version=$(git describe --tags --no-abbrev | sed -e 's/^beta-v//')
  
  printf "%sbeta.r%s.%s" "${version}" "${rev_count}" "${short_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake \
    -G 'Unix Makefiles' \
    -B "src/build" \
    -S "src" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "src/build"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="${pkgdir}" cmake --install "src/build"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
