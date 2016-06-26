# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: DavidK <david_king at softhome dot net>
# Contributor: Olivier Bordes <package@obordes.com>

pkgname=crrcsim
pkgver=0.9.13
pkgrel=1
pkgdesc="Model airplane flight simulation program."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/crrcsim/"
license=('GPL')
depends=('sdl>=1.2.5' 'portaudio' 'libjpeg' 'cgal')
makedepends=('gawk' 'plib>=1.8.4' 'gcc5')
source=("${pkgname}.desktop"
        "${pkgname}.png"
        "http://sourceforge.net/projects/crrcsim/files/latest/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('130b2a0661e96dce8b27dc3531c87474'
         '1cba5f3c8d3439e56866880429694a5c'
         'fbb66c148389e998afe149a34a88abeb')

prepare() {
  mkdir -p "${srcdir}/gcc-bin-override"
  ln -sf "/usr/bin/gcc-5" "${srcdir}/gcc-bin-override/gcc"
  ln -sf "/usr/bin/g++-5" "${srcdir}/gcc-bin-override/g++"
  export PATH="${srcdir}/gcc-bin-override:${PATH}"
}

build() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/-lCGAL/\"-lCGAL -lgmp\"/g" ./configure.ac
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -d -m755 "${pkgdir}/usr/share/pixmaps"
  install -m755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m755 "${pkgname}.png"     "${pkgdir}/usr/share/pixmaps"

  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
