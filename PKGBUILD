# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=rtg-tools
pkgver=3.8.4
pkgrel=2
pkgdesc="Utilities for accurate VCF comparison and manipulation"
arch=('i686' 'x86_64')
url="https://github.com/RealTimeGenomics/rtg-tools"
license=('Simplified BSD')
depends=('java-runtime>=1.8')
makedepends=('apache-ant>1.9')
source=(
  "https://github.com/RealTimeGenomics/${pkgname}/archive/${pkgver}.tar.gz"
  "rtg.cfg"
  "rtg.sh")
md5sums=(
  'c5b558cbe845fcb315e943162b7da38e'
  '1e5e1f5df474ab87b5a28a9d694e4e17'
  '64a6dc8d7c7ed9c3e0ba3d8c42f8194d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ant zip-nojre
  unzip -qn dist/rtg-tools-3.8.4-*-nojre.zip
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ant runalltests
}

package() {
  cd "${srcdir}"
  # Add environment variable to specify custom location of RTG.jar
  install -Dm655 rtg.cfg "${pkgdir}/etc/rtg.cfg"
  echo "RTG_JAR=/usr/share/java/${pkgname}/RTG.jar" >> "${pkgdir}/etc/rtg.cfg"

  # Install completion hook in profile.d to be sourced with each shell
  install -Dm755 rtg.sh "${pkgdir}/etc/profile.d/rtg.sh"

  # Install primary JAR file
  cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}-${pkgver}-"*
  install -Dm655 RTG.jar "${pkgdir}/usr/share/java/${pkgname}/RTG.jar"

  # Remove the need for a local configuration file, respect only system config
  install -Dm755 rtg "${pkgdir}/usr/bin/rtg"
  sed -i "s#\$THIS_DIR/rtg.cfg#${pkgdir}/etc/rtg.cfg#g" "${pkgdir}/usr/bin/rtg"

  # Install demo script, data, and bash completions scripts
  cp -r scripts "${pkgdir}/usr/share/${pkgname}"

  # Licenses and documentation
  install -Dm655 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm655 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -Dm655 ReleaseNotes.txt "${pkgdir}/usr/share/doc/${pkgname}/ReleaseNotes.txt"
  install -Dm655 RTGOperationsManual.pdf "${pkgdir}/usr/share/doc/${pkgname}/RTGOperationsManual.pdf"
  cp -r RTGOperationsManual "${pkgdir}/usr/share/doc/${pkgname}/RTGOperationsManual"
}
