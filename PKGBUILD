# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=autopsy
pkgver=4.22.1
pkgrel=1
pkgdesc='Digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensic tools'
arch=(x86_64)
url='http://www.sleuthkit.org/autopsy/'
license=('Apache-2.0')
_skver=4.14.0
depends=(java-runtime=17 testdisk sleuthkit "sleuthkit-java=$_skver" java-openjfx=17)
makedepends=()
optdepends=('opencv: media files (64-bit)'
			'perl-parse-registry: regripper')
# WARNING: "_v2.zip" in source file temporary fix for 4.22.1 (see upstream release) 
source=(https://github.com/sleuthkit/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}_v2.zip Autopsy.desktop)
sha256sums=('31e9c6df3111feeef1a734dad4c140eec81abb8788b5e3c988c0bf36b04f20a2'
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
