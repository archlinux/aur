# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=dark-oberon
pkgver=1.0.2rc2
pkgrel=2
pkgdesc="An open source real-time strategy game similar to Warcraft II"
arch=('i686' 'x86_64')
url="http://dark-oberon.sourceforge.net/"
license=('GPL2' 'CCPL')
depends=('glfw' 'mesa' 'sdl_mixer')
source=("${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('c5943968757bcfe5a15d532fc2e61caa'
         '073062bada4cde2cb1f0ba67dcc16955')

build() {
  cd "${srcdir}"

  _cvstar="http://dark-oberon.cvs.sourceforge.net/viewvc/dark-oberon/dark-oberon/?view=tar"

  # Download source code from CVS (it always has a different md5 sum)
  if [[ ! -f ${pkgname}.tar.gz ]]; then
    curl ${_cvstar} -o ${pkgname}.tar.gz
  fi

  rm -rf ${pkgname}
  bsdtar -xf ${pkgname}.tar.gz
  cd ${pkgname}/src

  # Fix path to data files
  sed -i "s#DATA_DIR=''#DATA_DIR='/usr/share/${pkgname}/'#" create_makefile.sh

  # Compile
  chmod a+x create_makefile.sh
  ./create_makefile.sh
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
