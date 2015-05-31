# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=the-binding-of-isaac
pkgver=20111101
pkgrel=4
pkgdesc="A randomly generated action RPG shooter with heavy Rogue-like elements."
url="http://www.bindingofisaac.com"
license=('custom: "commercial"')
arch=('i686' 'x86_64')

[ "${CARCH}" = "x86_64" ] && depends=('lib32-sqlite3' 'lib32-libidn' 'lib32-libxt' 'lib32-libxxf86vm' 'lib32-gtk2' 'lib32-nss' 'lib32-curl') \
&& optdepends=('lib32-libvdpau: For flash player hardware acceleration')
[ "${CARCH}" = "i686" ] && depends=('sqlite3' 'libidn' 'libxt' 'libxxf86vm' 'gtk2' 'nss' 'curl')\
&& optdepends=('libvdpau: For flash player hardware acceleration') 
options=(!strip)
source=("isaac.desktop" "isaac.png")

_gamepkg="binding-of-isaac_${pkgver}_i386.tar.gz"
md5sums=('bd7ab23bafd88705b42c0c328f8f6717'
         'bbc59b1fabb6036e4db450811bd3ab39')

package(){
  cd "${srcdir}"
  
  msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: $(readlink -f `pwd`/..)"
   if [[ -f "../${_gamepkg}" ]]; then
       msg "Found game package, installing..."
	   ln -fs "../${_gamepkg}" .
   else
	   error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
       read pkgpath
       if [[ -f "${pkgpath}/${_gamepkg}" ]]; then
           msg "Found game package, installing..."
		   ln -fs "${pkgpath}/${_gamepkg}" .
	   else
		   error "Unable to find game package."
		   return 1
       fi
   fi
   tar zxvf ${_gamepkg}
  
  # create Launcher
  install -d "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/isaac" "${pkgdir}/usr/bin/isaac"
  # Install Desktop File and Icon
  install -D -m644 "${srcdir}/isaac.desktop" \
        "${pkgdir}/usr/share/applications/isaac.desktop"
  install -D -m644 "${srcdir}/isaac.png" \
		"${pkgdir}/usr/share/icons/isaac.png"
}
