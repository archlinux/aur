# Maintainer: Lionel Miller <delonorm@gmail.com>

pkgname=gatk-bin
pkgver=4.5.0.0
pkgrel=1
pkgdesc="Variant discovery in high-throughput bioinformatics sequencing data"
arch=('any')
url=https://software.broadinstitute.org/"${pkgname}"
license=('BSD')
depends=('java-environment=8' 'python')
optdepends=('r: plot generation for some tools')
conflicts=('gatk')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/broadinstitute/gatk/releases/download/${pkgver}/gatk-${pkgver}.zip"
  gatk.sh
  "${pkgname}-license.txt::https://raw.githubusercontent.com/broadinstitute/gatk/d6a7fcd895677424b491df8c4ee6227e34b52251/LICENSE.TXT"
)
sha512sums=('c98b95bec0c67113daa46911e176588180b463514ed8270961207cadf3d7329a99752d819eaff74ca95d3ef89c0592f2c92c3ac3b98cfd3e3e56dec7d3b6c634'
            'a9984153bc489bf5814adc8f8bffd92782e7dd031f2b9a0798d2dc005438445f5eefed6ce3b64b776197c49fb8579e4c968e7cdc4398c5df0145e5105cc20271'
            '9753eef4b1f3aa96b790eaeacbe92ecb9d8fee6de9b918244a519a53b5285d57d2128e62f6a86c5d931d217a72f08e806ff81e95ad8d271c1df737384c81e30e')

package() {
  # I am using the launcher script from the source-based gatk package
  # instead of the official Python launcher because Python launcher is
  # far more complex than this script, and I have not investigated in
  # detail what it does.
  install -Dm755 gatk.sh "${pkgdir}"/usr/bin/gatk

  # Downloading the license separately because it is not included
  # in the distribution, and namcap complains if it is not installed.
  install -Dm644 "${pkgname}-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"

  # Resing much of the installation procedure from the source-based package.
  cd "${srcdir}/gatk-${pkgver}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 "gatk-package-${pkgver}-local.jar" "${pkgdir}/usr/share/java/${pkgname}/GenomeAnalysisTK.jar"
  install -Dm644 "gatk-completion.sh" "${pkgdir}/usr/share/bash-completion/completions/gatk"

  # Things that are missing:
  # 1. spark executable (maybe it should go in a separate package)
  # 2. gatkdoc
  # 3. scripts
  # 4. Python launcher (not sure whether it is superior to the current one)
}
