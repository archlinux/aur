# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=bbmap
pkgver=37.90
pkgrel=1
pkgdesc="A short read aligner2 and other bioinformatic tools"
arch=('x86_64')
url=https://jgi.doe.gov/data-and-tools/bbtools/
license=('BSD')
depends=('env-modules' 'jre8-openjdk>=7')
optdepends=('samtools: for BAM output')
source=(https://downloads.sourceforge.net/project/"${pkgname}"/BBMap_"${pkgver}".tar.gz)
sha256sums=('f2df007b581aec1b4278e2c115f52afef2bb3e4117c1cd5bd11bbf4993d10bbe')

build() {
  cd "${srcdir}"/"${pkgname}"/jni
  #make -f makefile.linux  # No jni.h found?
}

package() {
  cd "${srcdir}"/"${pkgname}"

  mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
  cp -r docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

  mkdir -p "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r config "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r current "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r jni "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r pipelines "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r resources "${pkgdir}"/usr/share/java/"${pkgname}"/

  for script in *.sh; do
    sed -i s#'CP=.*'#CP=/usr/share/java/"${pkgname}"/current/# "${script}"
    sed -i s#'DIR=.*'#DIR=/usr/share/java/"${pkgname}"/# "${script}"

    install -Dm775 "${script}" "${pkgdir}"/usr/bin/"${script}"
  done
}
