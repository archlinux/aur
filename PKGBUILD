# Maintainer: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>
pkgname=autopsy
pkgver=4.13.0
pkgrel=0
pkgdesc='Digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensic tools'
arch=(x86_64)
url='http://www.sleuthkit.org/autopsy/'
license=('Apache-2.0')
_skver=4.7.0
depends=(java-runtime=8 testdisk sleuthkit 'sleuthkit-java=4.7.0' java8-openjfx)
makedepends=()
optdepends=('opencv: media files (64-bit)')
source=(https://github.com/sleuthkit/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.zip Autopsy.desktop)
md5sums=('5efffb8655b9651307668c8e64f6a64b'
         'ab18f5bf01a624774a6e4eccd21dd398')

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p $pkgdir/usr/share/${pkgname}
  cp -r * $pkgdir/usr/share/${pkgname}/

  # copy sleuthkit jar into autopsy
  rm -f $pkgdir/usr/share/${pkgname}/${pkgname}/modules/ext/sleuthkit-postgresql-${_skver}.jar
  ln -s /usr/share/java/sleuthkit-${_skver}.jar $pkgdir/usr/share/${pkgname}/${pkgname}/modules/ext/sleuthkit-postgresql-${_skver}.jar

  # overwrite bin/autopsy with proper permissions
  install -m755 bin/autopsy $pkgdir/usr/share/${pkgname}/bin/autopsy

  # symlink to executable
  mkdir -p $pkgdir/usr/bin
  ln -sr $pkgdir/usr/share/${pkgname}/bin/autopsy $pkgdir/usr/bin/autopsy

  mkdir -p $pkgdir/usr/share/pixmaps
  cp icon.ico $pkgdir/usr/share/pixmaps/autopsy.ico

  mkdir -p $pkgdir/usr/share/applications
  install -Dm644 ../../Autopsy.desktop $pkgdir/usr/share/applications
}
