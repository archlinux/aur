# Maintainer: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>
pkgname=autopsy
pkgver=4.11.0
pkgrel=2
pkgdesc='Digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensic tools'
arch=(x86_64)
url='http://www.sleuthkit.org/autopsy/'
license=('Apache-2.0')
skver=4.6.5
depends=(java-runtime testdisk sleuthkit 'sleuthkit-java=4.6.5-1' java-openjfx)
makedepends=()
source=(https://github.com/sleuthkit/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.zip Autopsy.desktop)
sha256sums=('73cd26fcd2073abc1d1b84b18b1cc941fa10e00f264aa37f189d3580940cda2f'
            'be382bc92f5e98dfebbbf31dc927fc44af0fecee6911f7122ba8e7c55d281262')

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p $pkgdir/usr/share/${pkgname}
  cp -r * $pkgdir/usr/share/${pkgname}/

  # copy sleuthkit jar into autopsy
  rm -f $pkgdir/usr/share/${pkgname}/${pkgname}/modules/ext/sleuthkit-postgresql-4.6.6.jar
  ln -s /usr/share/java/sleuthkit-$skver.jar $pkgdir/usr/share/${pkgname}/${pkgname}/modules/ext/sleuthkit-postgresql-4.6.6.jar

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
