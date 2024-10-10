# Maintainer:  SanskritFritz (gmail; https://aur.archlinux.org/account/SanskritFritz)
# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=toppler
pkgname="${_pkgname}-git"
pkgver=1.3+8+r542.20220323.c8bf02b
pkgrel=5
pkgdesc='A reimplementation of the classic jump & run game "Nebulus"'
arch=('i686' 'x86_64')
url="https://gitlab.com/roever/toppler/"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'sdl2'
  'sdl2_mixer' 
  'zlib'
)
makedepends=(
  'gettext'
  'gimp'
  'git'
  'imagemagick'
  'libpng'
  'povray'
)
optdepends=(
  "${_pkgname}-upstream-levels: The upstream levels as individual missions that can be played individually, and files that can be loaded into the level editor."
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}-darcs")
source=(
  "${_pkgname}::git+https://gitlab.com/roever/toppler.git"
  "fix-for-gcc14.patch"
  "${_pkgname}.desktop"
)

sha256sums=(
  'SKIP'                                                              # Upstream git source
  '25753ed79c12e9635d5ef8cb3f1ec380998f5ccaec37818b056b0541c9cd4c9f'  # fix-for-gcc14.patch
  '828b4f8f6901e757de8cce76473caa1064b2db1375330eee370b0eff79909e9a'  # ${_pkgname}.desktop

)

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}"/fix-for-gcc14.patch; do
    printf '%s\n' "   > Applying patch $(basename "${_patch}") ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > "${srcdir}/git.log"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -v -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "dist/${_pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${_pkgname}.xpm"
  for _docfile in README.md doc/*; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/git.log" "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -D -v -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL3.txt"
}
