# Maintainer: envolution
# Contributor: hwesselmann <hauke@h-dawg.de>
# Contributor: Amish <contact at via dot aur>
# Contributor: ArthurBorsboom <arthurborsboom@gmail.com>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: markelos <axilleas@archlinux.gr>
# Contributor: helios <aur@wiresphere.de>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=spark
pkgver=3.0.2
pkgrel=3
pkgdesc="Cross-platform real-time collaboration client optimized for business and organizations."
arch=('any')
url="http://www.igniterealtime.org/projects/spark/"
license=('Apache-2.0')
depends=('java-runtime' 'unixodbc' 'libxtst')
makedepends=(maven)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/igniterealtime/Spark/archive/refs/tags/v${pkgver}.tar.gz" spark.desktop)
sha512sums=('8c0356276652c69d8922a9c05ceb432007b22741c57f32f5aba1d27389775bd7de99cd05f5def54d179bc6b40d1d1e1e3b2f3f2ae6903c556471b976c0b3a9b5'
            '46b22743f95336daf3b61b857b7f93687d47499949afb21371797a4d9c22fef18f13b7df6ea74d68e6179c09293b696bab58a3e50a97d37e513bfd6d9cad6614')

prepare() {
  sed -i '/<\/plugins>/i \
    <plugin>\
      <groupId>org.apache.maven.plugins</groupId>\
      <artifactId>maven-resources-plugin</artifactId>\
      <version>3.3.1</version>\
      <configuration>\
        <nonFilteredFileExtensions>\
          <nonFilteredFileExtension>icns</nonFilteredFileExtension>\
          <nonFilteredFileExtension>wav</nonFilteredFileExtension>\
          <nonFilteredFileExtension>png</nonFilteredFileExtension>\
          <nonFilteredFileExtension>gif</nonFilteredFileExtension>\
          <nonFilteredFileExtension>jpg</nonFilteredFileExtension>\
          <nonFilteredFileExtension>jpeg</nonFilteredFileExtension>\
          <nonFilteredFileExtension>db</nonFilteredFileExtension>\
          <nonFilteredFileExtension>zip</nonFilteredFileExtension>\
          <nonFilteredFileExtension>dll</nonFilteredFileExtension>\
        </nonFilteredFileExtensions>\
        <encoding>UTF-8</encoding>\
      </configuration>\
    </plugin>' ${pkgname^}-${pkgver}/core/pom.xml

  sed -i -e 's/scriptdir=.*/scriptdir="$(dirname "$(readlink -f "\$0")")"/' \
    -e 's/cd "\${scriptdir}\/\.\.";/cd "\$scriptdir\/\.." || exit/' \
    -e 's/wd="\`pwd\`"/wd="\$PWD"/' \
    "${pkgname^}-${pkgver}/core/src/main/resources/startup.sh"
}
build() {
  cd "${pkgname^}-${pkgver}"
  mvn clean package -Dproject.build.sourceEncoding=UTF-8 -Dproject.reporting.outputEncoding=UTF-8 -Dresources.encoding=UTF-8
}

package() {
  install -Dm644 spark.desktop "${pkgdir}/usr/share/applications/spark.desktop"
  cd "${pkgname^}-${pkgver}"
  install -Dm755 -d "${pkgdir}/usr/share/spark/resources"
  cp -a distribution/target/distribution-base/* "${pkgdir}/usr/share/spark/"
  cp -a core/src/main/resources/* "${pkgdir}/usr/share/spark/resources/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf /usr/share/spark/bin/startup.sh "${pkgdir}/usr/bin/spark"
}
# vim:set ts=2 sw=2 et:
