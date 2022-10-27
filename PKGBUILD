# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=autopsy
pkgver=4.19.2
pkgrel=1
pkgdesc='Digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensic tools'
arch=(x86_64)
url='http://www.sleuthkit.org/autopsy/'
license=('Apache-2.0')
_skver=4.11.1
depends=(java-runtime=11 testdisk sleuthkit 'sleuthkit-java=4.11.1' java11-openjfx)
makedepends=()
optdepends=('opencv: media files (64-bit)'
			'perl-parse-registry: regripper')
source=(https://github.com/sleuthkit/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.zip Autopsy.desktop)
sha256sums=('b1ca770df47f09512276fee16c184644cdd9a2591edfdb622a3177896f299893'
            'be382bc92f5e98dfebbbf31dc927fc44af0fecee6911f7122ba8e7c55d281262')

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p $pkgdir/usr/share/${pkgname}
  cp -r * $pkgdir/usr/share/${pkgname}/

  # copy sleuthkit jar into autopsy
  rm -f $pkgdir/usr/share/${pkgname}/${pkgname}/modules/ext/sleuthkit-${_skver}.jar
  ln -s /usr/share/java/sleuthkit-${_skver}.jar $pkgdir/usr/share/${pkgname}/${pkgname}/modules/ext/sleuthkit-${_skver}.jar

  # overwrite bin/autopsy with proper permissions
  install -m755 bin/autopsy $pkgdir/usr/share/${pkgname}/bin/autopsy

  # symlink to executable
  mkdir -p $pkgdir/usr/bin
  ln -sr $pkgdir/usr/share/${pkgname}/bin/autopsy $pkgdir/usr/bin/autopsy

  mkdir -p $pkgdir/usr/share/pixmaps
  cp icon.ico $pkgdir/usr/share/pixmaps/autopsy.ico

  mkdir -p $pkgdir/usr/share/applications
  install -Dm644 $srcdir/Autopsy.desktop $pkgdir/usr/share/applications
}
