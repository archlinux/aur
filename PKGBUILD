# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=dark-oberon
pkgver=1.0.2rc2
pkgrel=3
pkgdesc="An open source real-time strategy game similar to Warcraft II"
arch=('i686' 'x86_64')
url='http://dark-oberon.sourceforge.net/'
license=('GPL2' 'CCPL')
depends=('glfw2' 'mesa' 'sdl_mixer')
source=("${pkgname}.tar.gz::http://${pkgname}.cvs.sourceforge.net/viewvc/${pkgname}/${pkgname}/?view=tar"
        'glfw2.patch'
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'aec94dc857f1226a4417808a930e55743390755b8e3328399a49ac2fbe1c1832'
            'da7706793697e1fe7f762334bb74d8c947a3afb18528e842edb42adbcf8324cf'
            '8ba3bc1334a7751486ddc9ede4c7ad98801b1a62ddb41a76e4c3c953dc443ea2')

build() {
  cd "${srcdir}/${pkgname}/src"

  # Fix path to data files
  sed -i "s#DATA_DIR=''#DATA_DIR='/usr/share/${pkgname}/'#" create_makefile.sh

  # Create Makefiles
  chmod a+x create_makefile.sh
  ./create_makefile.sh

  # Use glfw2 instead of glfw
  patch -Np1 -i ${srcdir}/glfw2.patch

  # Compile
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install game files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r dat maps races schemes "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation and license
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 ChangeLog README "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 Licence "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
