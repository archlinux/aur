# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_pkg_build=422
_eula_ver=2-20
_guide_ver=15051736_v2

pkgname=bcl2fastq-rpm
pkgver=2.20.0
pkgrel=1
pkgdesc="Demultiplex Illumina sequencer BCL files into FASTQ for downstream bioinformatics analysis"
arch=('x86_64')
url=https://support.illumina.com/downloads/bcl2fastq-conversion-software-v"${pkgver//./-}".html
license=('custom:illumina')
makedepends=('rpmextract')
provides=('bcl2fastq')
conflicts=('bcl2fastq')
source=(
  https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v"${pkgver//./-}"-linux-x86-64.zip
  https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v"${_eula_ver}"-eula.pdf
  https://support.illumina.com/content/dam/illumina-support/documents/documentation/software_documentation/bcl2fastq/bcl2fastq2_guide_"${_guide_ver}".pdf
)
sha256sums=(
  '3744bc1c02fff1dd17d18c8e8b8b2cc2405b37d7d248b8889f4f8a8fc220b434'
  '0a8236fad01c86f72d43247606c7f6c029cebdedf23f4bcb691367602bd061de'
  '72f27e701b9ff4af53d1754ae6d68de7d7bbec6c4e42467c6baeacdf48fb482a'
)

prepare() {
  echo 'Download of this software requires agreement with EULA at:'
  echo 'https://support.illumina.com/content/dam/illumina-support/documents/downloads/software/bcl2fastq/bcl2fastq2-v2-20-eula.pdf'
}

build() {
  mkdir -p "${srcdir}"/"${pkgname}"-"${pkgver}" && cd "$_"
  mv ../bcl2fastq2-v"${pkgver}"."${_pkg_build}"-Linux-x86_64.rpm ./
  rpmextract.sh bcl2fastq2-v"${pkgver}"."${_pkg_build}"-Linux-x86_64.rpm
}

package() {
  install -Dm644 \
    "${srcdir}"/bcl2fastq2-v"${_eula_ver}"-eula.pdf \
    "${pkgdir}"/usr/share/licenses/bcl2fastq/bcl2fastq2-v"${_eula_ver}"-eula.pdf

  install -Dm644 \
    "${srcdir}"/bcl2fastq2_guide_"${_guide_ver}".pdf \
    "${pkgdir}"/usr/share/doc/bcl2fastq/bcl2fastq2_guide_"${_guide_ver}".pdf

  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm644 usr/local/share/COPYRIGHT "${pkgdir}"/usr/share/licenses/bcl2fastq/COPYRIGHT
  install -Dm644 usr/local/share/Changes "${pkgdir}"/usr/share/licenses/bcl2fastq/Changes
  install -Dm755 usr/local/bin/bcl2fastq "${pkgdir}"/usr/bin/bcl2fastq
}
