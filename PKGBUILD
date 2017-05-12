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
        "http://sourceforge.net/projects/crrcsim/files/crrcsim/crrcsim-${pkgver}/crrcsim-${pkgver}.tar.gz")
sha256sums=('2af239b7dc1d74967b1ec86665c7a7c28c9564306d7d299533235eacb8bf02de'
            '37d71a1be23afea19ad41179223eda997a3af103e2b2879784fd352de70a5696'
            'abe59b35ebb4322f3c48e6aca57dbf27074282d4928d66c0caa40d7a97391698')

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
