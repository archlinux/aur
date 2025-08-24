# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="ffmpeg_split"
_pyname="${_gitname}"
_pkgname="${_pyname}"
pkgname="${_pkgname}-git"
pkgver=1.0.r24.20250811.5979ae8
pkgrel=1
pkgdesc="Split a media file by embedded chapter information, using ffmpeg."
arch=(
  'any'
)
_githost='github.com'
_gituser='harryjackson'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("Apache-2.0")
depends=(
  'ffmpeg'
  'python>=3'
)
makedepends=(
  'git'
)
optdepends=()
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_pyname}.git"
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

  #_ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _ver="$(python ./split_ffmpeg.py --version | awk '{print $2}')"
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

package() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> installing ..."

  install -Dvm755 split_ffmpeg.py "${pkgdir}/usr/bin"/ffmpeg_split_chapters

  _docfiles=(
    "${srcdir}/git.log"
    README.md
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    LICENSE
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

