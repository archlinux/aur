# Maintainer: markzz <mark dot weiman at markzz dot com>
# Contributer: Philip 'Chais' Abernethy <chais dot z30r at gmail dot com>

# YOU MUST SUPPLY THE ZIP FILE INCLUDED WITH YOUR HUMBLE PURCHASE

pkgname=besiege
pkgver=0.09
pkgrel=1
pkgdesc="A physics based building puzzler (Humble Version)."
arch=('i686' 'x86_64')
url="http://besiegethegame.com/"
license=('custom')
depends=('glu')
makedepends=('unzip')
source=(besiege.desktop besiege)
sha256sums=('c6cef3d0bfef18cf355cbb31843463fbeaad9057d958e055bffaa4a261e5b5dd'
            '9ae91d4d571866d2ac004d7d5b6c3ce4e593ca2cb7ff410be81897dbd4810ae2')
_gamedir=Besiege_Alpha_Linux_v0_09

if [[ $CARCH == 'x86_64' ]]; then
  _arch='x86_64'
elif [[ $CARCH == 'i686' ]]; then
  _arch='x86'
fi

build() {
  msg ""
  msg "You need to download a copy of this game from your Humble library!"
  msg "Searching for the zip file in \"$startdir\"..."
  pkgpath="$startdir"
  
  if [[ ! -f "${pkgpath}/${_gamedir}.zip" ]]; then
    error "Game zip not found! Please type path to ${_gamedir}.zip (/home/user):"
    read pkgpath
    
    if [[ ! -f "${pkgpath}/${_gamedir}.zip" ]]; then
      error "Unable to find game zip!  Aborting!" && return 1
    fi
  fi
  
  msg "Found game zip, unzipping..."
  unzip "${pkgpath}/${_gamedir}.zip" -d "${srcdir}" > /dev/null
}

package() {
  install -d "${pkgdir}/usr/share/besiege"
  install -d "${pkgdir}/usr/share/besiege/Besiege_Data"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  
  cp -r ${srcdir}/${_gamedir}/Besiege_Data/* "${pkgdir}/usr/share/besiege/Besiege_Data"
  install -m755 "${srcdir}/${_gamedir}/Besiege.${_arch}" "${pkgdir}/usr/share/besiege/Besiege"
  
  # Create a couple of symlinks required for the game to save to the user dir
  ln -s /tmp/${pkgname}/CompletedLevels.txt "${pkgdir}/usr/share/besiege/Besiege_Data/CompletedLevels.txt"
  ln -s /tmp/${pkgname}/Config.txt "${pkgdir}/usr/share/besiege/Besiege_Data/Config.txt"
  ln -s /tmp/${pkgname}/SavedMachines "${pkgdir}/usr/share/besiege/Besiege_Data/SavedMachines"
  ln -s /tmp/${pkgname}/Screenshots "${pkgdir}/usr/share/besiege/Besiege_Data/Screenshots"
  
  install -m755 "${srcdir}/besiege" "${pkgdir}/usr/bin/besiege"
  install -m644 "${srcdir}/besiege.desktop" "${pkgdir}/usr/share/applications/besiege.desktop"
}
