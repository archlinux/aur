# Contributor: Tom < reztho at archlinux dot us >
#
# ATTENTION!!!!
# The license of this program must be accepted before downloading the original baudline .tar.gz,
# so be sure to accept it before doing anything if you really want to install this
# program. The license is in this URL: http://www.baudline.com/download.html .
#
# And if you see the 'About' screen of the program, you can see than any kind of
# distribution of the program is prohibited, so the first contributor of this PKGBUILD
# (Tom < reztho at archlinux dot us >) contacted with Erik Olson from SigBlips.com (the author
# of the program) and Erik granted the whole Archlinux community to use this PKGBUILD 
# for making a binary Archlinux package so you can install the program system-wide. But the
# distribution of the binary Archlinux package made with this PKGBUILD is prohibited, so it
# isn't possible to upload it to the binary Archlinux repositories or use it as part of Archlinux
# installation or any of its derivatives.
# 

pkgname=baudline-bin
pkgver=1.08
pkgrel=3
pkgdesc="Time-frequency browser designed for scientific visualization of the spectral domain."
arch=('i686' 'x86_64')
url="http://www.baudline.com/"
license=('custom')
depends=('libxp' 'jack' 'libxmu' 'libxxf86vm' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi')
makedepends=('imagemagick')
optdepends=('gzip' 'bzip2' 'flac' 'sox' 'mpg123' 'vorbis-tools')
provides=('baudline')
install=baudline-bin.install
source=("http://www.baudline.com/${pkgname/-bin/}_${pkgver}_linux_${CARCH}.tar.gz"
	"${pkgname/-bin/}.desktop"
	"${pkgname/-bin/}_jack.desktop")

md5sums=('a400669fe11e5189e5d9d9db18dae70d'
         'd334c058230811a402104f75afcfaeed'
         '2c1ff5a60782815167bb43e735305e0e')

[ "${CARCH}" == "x86_64" ] && \
md5sums=('8ca7a48c17d4826f2a634ffe5137811e'
         'd334c058230811a402104f75afcfaeed'
         '2c1ff5a60782815167bb43e735305e0e')

package() {

  _verpkg=${pkgver}
  _arch=${CARCH}

  if [ "${_arch}" == "i686" ]; then
    _arch=x86
  fi

  cd ${srcdir}/${pkgname/-bin/}_${_verpkg}_linux_${_arch}

  # Intallation
  mkdir -p ${pkgdir}/usr/share/baudline ${pkgdir}/usr/bin/
  cp -a ./* ${pkgdir}/usr/share/baudline/
  mv ${pkgdir}/usr/share/baudline/baudline ${pkgdir}/usr/bin/
  mv ${pkgdir}/usr/share/baudline/baudline_jack ${pkgdir}/usr/bin/

  # Fixing permissions
  chmod 755 ${pkgdir}/usr/bin/*

  # .desktop file and icon
  mkdir -p ${pkgdir}/usr/share/pixmaps
  /usr/bin/convert ${srcdir}/${pkgname/-bin/}_${_verpkg}_linux_${_arch}/icons/spectro.gif ${srcdir}/${pkgname/-bin/}_${_verpkg}_linux_${_arch}/icons/baudline.png || return 1
  /usr/bin/convert ${srcdir}/${pkgname/-bin/}_${_verpkg}_linux_${_arch}/icons/piano_keys.gif ${srcdir}/${pkgname/-bin/}_${_verpkg}_linux_${_arch}/icons/baudline_jack.png || return 1
  install -m 644 ${srcdir}/${pkgname/-bin/}_${_verpkg}_linux_${_arch}/icons/baudline.png ${pkgdir}/usr/share/pixmaps/ || return 1
  install -m 644 ${srcdir}/${pkgname/-bin/}_${_verpkg}_linux_${_arch}/icons/baudline_jack.png ${pkgdir}/usr/share/pixmaps/baudline_jack.png || return 1
  mkdir -p ${pkgdir}/usr/share/applications
  install -m 644 ${srcdir}/${pkgname/-bin/}.desktop ${pkgdir}/usr/share/applications || return 1
  install -m 644 ${srcdir}/${pkgname/-bin/}_jack.desktop ${pkgdir}/usr/share/applications || return 1

  # License
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  install -m 644 ${pkgdir}/usr/share/baudline/README_unix.txt ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
}

