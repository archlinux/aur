# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=trauma
pkgver=3
pkgrel=4
pkgdesc="TRAUMA is a unique photographic experience by game designer Krystian Majewski. Dive into the mind of a traumatized young woman to learn and understand."
arch=('i686' 'x86_64')
url="http://www.traumagame.com/"
license=('custom')
depends=('flashplayer-standalone')

install="trauma.install"
source=(trauma.png
        trauma.desktop
        trauma.sh)

md5sums=('41951abca248a5e2f4831cab92b6c281'
         '6560fcfccf2f48f955efdaab81413eda'
         '618a5bd22abe98666d1e7980256e70ce')

_gamepkg="trauma_3_all.tar"

package () {
   cd "${srcdir}"
  
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: \"${startdir}\""
	 pkgpath="${startdir}"
   if [[ ! -f "${startdir}/${_gamepkg}" ]]; then
       error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
       read pkgpath
       if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
           error "Unable to find game package." && return 1
       fi
    fi
    msg "Found game package, installing..."

    ln -fs  "${pkgpath}/${_gamepkg}" .
    tar xvf "${pkgpath}/${_gamepkg}"

  # create pkgdir folders
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/{applications,games,icons}
  install -d "${pkgdir}"/usr/share/games/${pkgname}

  # install files
  cp -r . "${pkgdir}/usr/share/games/${pkgname}"
  find "${pkgdir}"/usr/share/games/${pkgname}/ -type d -exec chmod 0755 {} \;
  find "${pkgdir}"/usr/share/games/${pkgname}/ -type f -exec chmod 0644 {} \;
  chmod 0755 "${pkgdir}"/usr/share/games/${pkgname}/${pkgname}.sh
  chmod 0755 "${pkgdir}"/usr/share/games/${pkgname}/${pkgname}.swf
  chmod +x "${pkgdir}"/usr/share/games/${pkgname}/${pkgname}.swf
  rm -rf "${pkgdir}"/usr/share/games/${pkgname}/flashplayer
  
  # license
  # I can't find a license for this game anywhere, not even in the game :(
  #install -d "${pkgdir}"/usr/share/licenses/${pkgname}

  # launch script
  install -m755 "${srcdir}"/${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
  
  # icon/.desktop
  install -Dm644 "${pkgname}.png" "${pkgdir}"/usr/share/icons/
  install -Dm644 "${pkgname}.desktop" "${pkgdir}"/usr/share/applications/
}
