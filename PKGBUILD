# Maintainer: sikfeng <sikfeng@gmail.com>

pkgname='gog-xenonauts'
pkgdesc="Xenonauts - GOG Version"
pkgver=1.65
pkgrel=1
url='https://www.gog.com/game/xenonauts'
arch=('i686' 'x86_64')
groups=('games' 'gog')
license=('custom')
depends=('alsa-plugins' 'alsa-utils' 'sdl2' 'mesa' 'lib32-libglvnd' 'lib32-gtk2')
PKGEXT=.pkg.tar
source=(
  "${pkgname}"
  "${pkgname}.desktop"
)
sha256sums=(
  '3e76f0b15772d6670adfcd5c8a24de8e1ea8c54f52344e5acae5724e4e502004'
  'e75c528f260c3e811cc133776a304c077a6285f29e82d2e227312ae96b484ce2'
)

_gamepkg=xenonauts_en_1_65_21328.sh
# The sh file is a mojosetup wrapper around a zip archive.
# Skip the useless bits so we can extract it without errors.
_skipbytes=860556
build() {
  msg "You need a full copy of this game in order to install it"
  msg "Searching for ${_gamepkg} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
    error "Game package not found, please type absolute path to ${_gamepkg} (/home/user):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
      error "Unable to find game package." && return 1
    fi
  fi
  msg "Found game package, unpacking..."
  mkdir "${srcdir}/extract"
  tail -c +$_skipbytes "${pkgpath}/${_gamepkg}" > clean.zip
  unzip clean.zip -d "${srcdir}/extract"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"

  cd "${srcdir}/extract/data/noarch"
  mv * "${pkgdir}/opt/${pkgname}/"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m644 "${pkgdir}/opt/${pkgname}/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"

  chmod 777 "${pkgdir}"/opt/${pkgname} -R
}
