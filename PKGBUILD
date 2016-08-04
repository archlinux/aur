# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=grim-fandango
pkgver=1.4.0
pkgrel=3
pkgdesc="Grim Fandango Remastered - GOG version"
arch=('i686' 'x86_64')
url="http://grimremastered.com/"
license=('custom: commercial')
depends_i686=('libxcursor' 'gcc-libs' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
depends_x86_64=('lib32-libxcursor' 'lib32-gcc-libs' 'lib32-alsa-lib' 'lib32-libxrandr' 'lib32-libxinerama' 'lib32-mesa')

# The install size is close to 6GB, so don't bother with xz.
PKGEXT=.pkg.tar
source=(${pkgname}.desktop
        ${pkgname})
md5sums=('8ef119e66bbdb8017aa045eef9736054'
         'b84aeccef5eb8dfc3679cdee874f218c')
        
_gamepkg=gog_grim_fandango_remastered_2.3.0.7.sh
# The sh file is a mojosetup wrapper around a zip archive.
# Skip the useless bits so we can extract it without errors.
_skipbytes=1005115
build() {
  msg "You need a full copy of this game in order to install it"
  msg "Searching for ${_gamepkg} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
    error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
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
