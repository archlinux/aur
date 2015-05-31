# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=grim-fandango
pkgver=1.3.0.6
pkgrel=1
pkgdesc="Grim Fandango Remastered - GOG version"
arch=('i686' 'x86_64')
url="http://grimremastered.com/"
license=('custom: commercial')
depends=('libxcursor' 'gcc-libs' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')

if test "$CARCH" == x86_64; then
depends=('lib32-libxcursor' 'lib32-gcc-libs' 'lib32-alsa-lib' 'lib32-libxrandr' 'lib32-libxinerama' 'lib32-mesa')
fi

PKGEXT=.pkg.tar
source=(${pkgname}.desktop
        ${pkgname})
md5sums=('8ef119e66bbdb8017aa045eef9736054'
         'b84aeccef5eb8dfc3679cdee874f218c')
        
_gamepkg=gog_grim_fandango_remastered_${pkgver}.tar.gz

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
  tar xf "${pkgpath}/${_gamepkg}" -C "${srcdir}"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"

  cd "${srcdir}/Grim Fandango Remastered/"
  mv * "${pkgdir}/opt/${pkgname}/"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m644 "${pkgdir}/opt/${pkgname}/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"

  chmod 777 "${pkgdir}"/opt/${pkgname} -R
}
