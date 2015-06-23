#!/usr/bin/bashs
# Maintainer: Alex Talker <alextalker at openmailbox dot org>
pkgname=xonotic-autobuild
pkgver=22022014
pkgrel=1
pkgdesc="A free, fast-paced crossplatform first-person shooter (autobuild version)"
arch=('i686' 'x86_64')
url="http://xonotic.org"

license=('GPL')
# autobuild not supported  'libjpeg>=8'
depends=('alsa-lib' 'curl' 'libmodplug' 'libvorbis' 'libxpm' 'libxxf86dga' 'libxxf86vm' 'sdl' 'libpng>=1.4.0' 'libjpeg6')
makedepends=('unzip' 'mesa' 'rsync')
provides=('xonotic' 'xonotic-git' 'xonotic-data')
conflicts=('xonotic' 'xonotic-git' 'xonotic-data')
source=("xonotic-glx.desktop"
        "xonotic-sdl.desktop"
)
_link="rsync://beta.xonotic.org/autobuild-Xonotic/"
md5sums=('914c7b9163e92b35f0ab57fdb1653ac5'
         'da7d812ff231c9332cd694b39757adda')

package() {
  # downloaded linux sources and cross-platform content
  rsync "${_link}*" "${srcdir}/" -c -r -P --links --exclude "*.exe" --exclude "*.dll" --exclude "Xonotic.app/" || return 1
  
  # detected computer architecture
  _arch=`uname -m`
  _xondir="${pkgdir}/opt/xonotic-autobuild"
  
  if [[ "$_arch"=='x86_64' ]]; then
      _arch="linux64"
  else
      _arch="linux32"
  fi
  # installing...
  cd "${srcdir}/"
  mkdir -p "${_xondir}/"
  cp -R "${srcdir}"/* "${_xondir}/"
  mkdir -p "${pkgdir}/usr/share/applications"
  install -Dm644 "${_xondir}"/*.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${_xondir}/misc/logos/icons_png/xonotic_512.png" "${pkgdir}/usr/share/pixmaps/xonotic.png"
  mkdir -p "${pkgdir}/usr/bin/"
  chmod 755 "${_xondir}"/xonotic-${_arch}-dedicated
  chmod 755 "${_xondir}"/xonotic-${_arch}-glx
  chmod 755 "${_xondir}"/xonotic-${_arch}-sdl
  ln -s "${_xondir}/xonotic-linux-dedicated.sh" "${pkgdir}/usr/bin/xonotic-dedicated" || return 1
#  install -Dm755 $srcdir/xonotic-${_arch}-dedicated ${pkgdir}/usr/bin/xonotic-dedicated 
  ln -s "${_xondir}/xonotic-linux-glx.sh" "${pkgdir}/usr/bin/xonotic-glx" || return 1
  ln -s "${_xondir}/xonotic-linux-sdl.sh" "${pkgdir}/usr/bin/xonotic-sdl" ||return 1

  # data
#  mkdir -p ${pkgdir}/usr/share/xonotic/
#  mv $srcdir/data ${pkgdir}/usr/share/xonotic/ || return 1

  # server stuff
#  cp -r $srcdir/server ${pkgdir}/usr/share/xonotic/ || return 1

  # key
#  install -Dm644 ${srcdir}/key_0.d0pk ${pkgdir}/usr/share/xonotic/key_0.d0pk || return 1
}
