# Maintainer: Luís Ferreira <contact at lsferreira dot net>
# Contributor: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>

_pkgname=autopsy
pkgname=${_pkgname}-bin
pkgver=4.19.2
pkgrel=3
pkgdesc='Digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensic tools'
arch=(x86_64)
url='http://www.sleuthkit.org/autopsy/'
license=('Apache-2.0')
_skver=4.11.1
depends=(java-runtime=8 testdisk sleuthkit "sleuthkit-java=${_skver}" java8-openjfx)
makedepends=()
optdepends=('opencv: media files (64-bit)'
			'perl-parse-registry: regripper')
source=(
	"https://github.com/sleuthkit/${_pkgname}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.zip"
	Autopsy.desktop
	autopsy)
sha512sums=('3e63cd25559e445627207171b084c51e06192ec5808f32e8ed4881f116652c806e75c1c4339ac6fd61631ec98f6fdbd75e8d279b2f52c856baed3fe53356c4fe'
            'a7f27dfa0bdd01f216f84c032851025c047f1e0fe1b8d3aff7da7c64ad60b529fd6202a2bc21a7f834961ede2ef084c4937af53e14b77418ed9f1b06f410a54f'
            'd734b45fb66789337cf348b544b62afaa913300109a5d68e66c8bead11da03bb1bfd52df3488004cb494552abe374e307f01de3c22c427fb218a0dfd9b398d23')

package() {
  cd "${_pkgname}-${pkgver}"

  # Delete unused Windows binaries
  # https://github.com/sleuthkit/autopsy/issues/6806
  find . -name '*.exe' -delete
  find . -name '*.dll' -delete

  # Add permissions to solr
  # https://github.com/sleuthkit/autopsy/issues/7547
  chmod 755 autopsy/solr/bin/autopsy-solr

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -r * "$pkgdir/opt/${_pkgname}/"

  # copy sleuthkit jar into autopsy
  rm -f $pkgdir/opt/${_pkgname}/${_pkgname}/modules/ext/sleuthkit-${_skver}.jar
  ln -s /usr/share/java/sleuthkit-${_skver}.jar $pkgdir/opt/${_pkgname}/${_pkgname}/modules/ext/sleuthkit-${_skver}.jar

  # overwrite bin/autopsy with proper permissions
  # https://github.com/sleuthkit/autopsy/issues/7547
  install -m755 bin/autopsy "$pkgdir/opt/${_pkgname}/bin/autopsy"

  # add executable
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/autopsy" "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/pixmaps"
  install -Dm0644 icon.ico $pkgdir/usr/share/pixmaps/autopsy.ico

  install -d "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/Autopsy.desktop" "$pkgdir/usr/share/applications"

  install -Dm644 'LICENSE-2.0.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
