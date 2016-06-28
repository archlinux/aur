# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-experimental
pkgver=0.13.0
pkgrel=2
pkgdesc="A 2D game about building and maintaining factories. - Experimental Version"
arch=('i686' 'x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio-demo')
depends=('libxcursor' 'gcc-libs' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
conflicts=('factorio')
md5sums=('5cacd198a3156c157a482aeab368e9a1'
         '22fce67d66c080fa5c89ab437b3d8724')
source=(factorio.desktop LICENSE)
_gamepkg=factorio_alpha_x64_${pkgver}.tar.gz
_factorio_arch=x64
if [ "${CARCH}" = "i686" ]; then
    _gamepkg=factorio_alpha_i386.tar.gz
    _factorio_arch=i386
fi
_pkgpaths_tries=("${startdir}" "${SRCDEST}" "${HOME}/Downloads" "${XDG_DOWNLOAD_DIR}")
build() {
  msg "You need a full copy of this game in order to install it"

  for pkgpath_try in "${_pkgpaths_tries[@]}"; do
    msg "Searching for ${_gamepkg} in \"${pkgpath_try}\""
    if [[ -f "${pkgpath_try}/${_gamepkg}" ]]; then
      pkgpath="${pkgpath_try}"
      break
    fi
  done

  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
    error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      error "Unable to find game package." && return 1
    fi
  fi

  msg "Found game package, unpacking..."
  tar xf "${pkgpath}/${_gamepkg}" -C "${srcdir}"
}

# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "$srcdir/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio"
  install -d -m777 "${pkgdir}/usr/share/factorio/scenario-pack"

  install -m755 "bin/${_factorio_arch}/factorio" "$pkgdir/usr/bin/factorio"
  cp -r data/* "$pkgdir/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}
