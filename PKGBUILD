# Maintainer: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>
_pkgname=autopsy
pkgname=${_pkgname}-bin
pkgver=4.19.1
pkgrel=1
pkgdesc='Digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensic tools'
arch=(x86_64)
url='http://www.sleuthkit.org/autopsy/'
license=('Apache-2.0')
_skver=4.11.0
depends=(java-runtime=8 testdisk sleuthkit "sleuthkit-java=${_skver}" java8-openjfx)
makedepends=()
optdepends=('opencv: media files (64-bit)'
			'perl-parse-registry: regripper')
source=(
	https://github.com/sleuthkit/${_pkgname}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.zip
	Autopsy.desktop)
sha512sums=('9e3f917a55b362ca7835e58454ca5048e59e51b653831b32002a260db90dbdd47449164511d3f8968aafa0b36173ab03de12a5efb7ea8b9feb3fb45b3fa6cf29'
            'd209bc1947eccaee7520243e8f8ce81daa71404e547a671eec7ca9e95572e305ae75db8058784631ac721c7612de405347be2b4d3124f324c06af9efb6dd82a7')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Delete unused Windows binaries
  find . -name '*.exe' -delete
  find . -name '*.dll' -delete
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -r * "$pkgdir/opt/${_pkgname}/"

  # copy sleuthkit jar into autopsy
  rm -f $pkgdir/opt/${_pkgname}/${_pkgname}/modules/ext/sleuthkit-${_skver}.jar
  ln -s /usr/share/java/sleuthkit-${_skver}.jar $pkgdir/opt/${_pkgname}/${_pkgname}/modules/ext/sleuthkit-${_skver}.jar

  # overwrite bin/autopsy with proper permissions
  install -m755 bin/autopsy "$pkgdir/opt/${_pkgname}/bin/autopsy"

  # symlink to executable
  install -d "$pkgdir/usr/bin"
  ln -sr $pkgdir/opt/${_pkgname}/bin/autopsy $pkgdir/usr/bin/autopsy

  install -d "$pkgdir/usr/share/pixmaps"
  install -Dm0644 icon.ico $pkgdir/usr/share/pixmaps/autopsy.ico

  install -d "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/Autopsy.desktop" "$pkgdir/usr/share/applications"

  install -Dm644 'LICENSE-2.0.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
