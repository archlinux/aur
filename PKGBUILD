# Maintainer: Sam S. <smls75@gmail.com>

pkgname=intrusion2-hib
pkgver=0_20130604
_hibver=1370288626
pkgrel=2
pkgdesc='A 2D action platformer / sidescrolling shooter (Humble Bundle version)'
url='http://intrusion2.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
if [ $CARCH == i686 ]; then
  depends=('flashplugin' 'gtk2' 'gstreamer0.10' 'gstreamer0.10-base'
           'nss' 'libxtst')
else
  depends=('lib32-flashplugin' 'lib32-gtk2' 'lib32-gstreamer0.10'
           'lib32-gstreamer0.10-base' 'lib32-nss' 'lib32-libxtst')
fi
makedepends=('unrar')

_game_binary="intrusion2-${_hibver}-bin"
source=("hib://${_game_binary}"
        "http://intrusion2.com/files/graphics/intrusion2_graphics.rar"
        "intrusion2-hib.desktop")
md5sums=('de6a30d7fb3d117065f11743b4f0a13a'
         '18b0ebc86da94049b4fc9c3efa781080'
         '5228fd61295650f4588ac62b8e139310')
noextract=("intrusion2_graphics.rar")

options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

build() {
  # Extract icon
  cd $srcdir; unrar e -y "intrusion2_graphics.rar"
}

package() {
  cd $srcdir
  _target="/opt/Intrusion2"

  # Install game binary
  install -Dm755 "${_game_binary}" "${pkgdir}${_target}/${_game_binary}"

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "intrusion2_icon1.png" "${pkgdir}/usr/share/pixmaps/intrusion2.png"
  
  # Install launch script
  [ $CARCH == "i686" ] && _arch='x86' || _arch='x86_64'
  echo -e "#!/bin/sh\ncd ${_target} && ./${_game_binary}" > "launcher.sh"
  install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/intrusion2"
}
