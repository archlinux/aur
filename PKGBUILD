# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="plutovg"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=1.3.2.r287.20251118.5695a71
pkgrel=1
pkgdesc="A standalone 2D vector graphics library in C."
arch=(
  'x86_64'
  'i686'
  'aarch64'
  'armv6h'
  'armv7h'
)
_githost='github.com'
_gituser='sammycage'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("MIT")
depends=(
  'glibc'
)
makedepends=(
  'cmake'
  'git'
)
optdepends=()
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "libplutovg.so"
)
conflicts=(
  "${_pkgname}"
)
options+=('!lto') # Otherwise build of 'plutosvg' throws linking  errors.

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUTOVG_BUILD_EXAMPLES=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON

  make -C build
}

package() {
  cd "${srcdir}"

  make -C build DESTDIR="${pkgdir}" install
  make -C build/examples clean # Remove built executable in examples directory.

  _docfiles=(
    "${srcdir}/git.log"
    "${srcdir}/${_pkgname}/README.md"
    "${srcdir}/${_pkgname}/smiley.png"
  )
  _docdirs=(
    "${srcdir}/build/examples"
  )
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    "${srcdir}/${_pkgname}/LICENSE"
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

