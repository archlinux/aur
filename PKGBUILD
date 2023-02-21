# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Thibaut Pérami (https://aur.archlinux.org/account/tperami)

_pkgname=magic_enum
pkgname="${_pkgname}-git"
pkgver=0.8.2+8.r436.20230216.6542403
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=('any')
url="https://github.com/Neargye/magic_enum"
license=('MIT')
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  'gcc-libs: To run the built examples.'
)
provides=(
  "${_pkgname}=${pkgver}"
  # "${_pkgname}-nonascii=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare(){
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver(){
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=ON \
    -DMAGIC_ENUM_OPT_BUILD_TESTS=OFF \
    -DMAGIC_ENUM_OPT_ENABLE_NONASCII=OFF \
    -B build
  cmake --build build
}

check(){
  cd "${srcdir}/${_pkgname}"

  make test
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}"
  for _docfile in README.md doc/* example/*; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  cp -rv "build/example"                            "${pkgdir}/usr/share/doc/${_pkgname}/example/built"

  install -D -v -m644 "${srcdir}/git.log"           "${pkgdir}/usr/share/doc/${_pkgname}/git.log"

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svf "/usr/share/licenses/${pkgname}/LICENSE"  "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
