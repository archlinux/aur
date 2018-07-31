# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=gatk
pkgver=4.0.7.0
pkgrel=1
epoch=2  # New licensing and versioning scheme as produced by the Broad
pkgdesc="Variant discovery in high-throughput bioinformatics sequencing data"
arch=('any')
url=https://software.broadinstitute.org/"${pkgname}"
license=('BSD')
makedepends=('gradle')
depends=('java-runtime>=8' 'python')
source=(gatk.sh)
sha256sums=('279d9fa4f9711b31a312a372216fbc0a61901db5a8e1b6c714bd96bafd0714f2')

prepare() {
  cd "${srcdir}"

  if [[ ! -d "${pkgname}"-"${pkgver}" ]]; then
    git clone https://github.com/broadinstitute/gatk.git "${pkgname}"-"${pkgver}";
  fi

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  git checkout "${pkgver}"
  ./gradlew clean
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  ./gradlew localJar
}

package() {
  install -Dm755 gatk.sh "${pkgdir}"/usr/bin/gatk

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.TXT
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 AUTHORS "${pkgdir}"/usr/share/doc/"${pkgname}"/AUTHORS
  install -Dm644 build/libs/gatk-package-"${pkgver}"-SNAPSHOT-local.jar "${pkgdir}"/usr/share/java/"${pkgname}"/GenomeAnalysisTK.jar
}
