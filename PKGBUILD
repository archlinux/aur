# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Christoph Zeiler <moonblade.dot.org: arch>
# Contributor:  Jesse Jaara      <gmail.com: jesse.jaara>

pkgname=gnurobbo
pkgver=0.68
pkgrel=2
pkgdesc="A reimplementation of Janusz Pelc's Robbo, originally for the Atari XE/XL"
arch=('i686' 'x86_64')
url="http://gnurobbo.sourceforge.net/"
license=('GPL2', 'Custom')
depends=('sdl_ttf' 'sdl_mixer' 'sdl_image')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-source.tar.gz"
        "${pkgname}.desktop")
md5sums=('7d1f194a67dcc66c6c88ae1037db4a50'
         'e520a3c136854383627d1d960a41f8b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

  sed -e 's|#MUSIC=-DHAVE_MUSIC|MUSIC=-DHAVE_MUSIC|g' \
      -e 's|=-O3 -pipe -Wall -fomit-frame-pointer|+=|g' \
      -e 's|-lSDL_image|-lm -lSDL_image|g' \
	    -i Makefile

  sed '/#define DEBUG_DUMP_VM_USAGE/d' -i game.c

  make PACKAGE_DATA_DIR="/usr/share/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

  make PACKAGE_DATA_DIR="${pkgdir}/usr/share/${pkgname}" BINDIR="${pkgdir}/usr/bin" DOCDIR="${pkgdir}/usr/share/doc/${pkgname}" install

  mkdir "${pkgdir}/usr/share/gnurobbo/music"
  
  install -m644 ChangeLog COPYING README "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 icon32.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/doc/${pkgname}"
  mv LICENSE-* "${pkgdir}/usr/share/licenses/${pkgname}/"
}

