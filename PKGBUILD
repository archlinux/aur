# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=fgbio-git
pkgver=0.4.0.r19.g4ba4127
pkgrel=1
pkgdesc="Tools for working with genomic and high throughput sequencing data."
arch=('any')
url="https://github.com/fulcrumgenomics/fgbio"
license=('MIT')
depends=('git-lfs' 'java-runtime>=8' 'sbt' 'scala>=2.12')
checkdepends=('r' 'r-cran-ggplot2')
provides=('fgbio')
conflicts=('fgbio')
source=("fgbio.sh")
md5sums=("8f3581b03a37ecaf0824f5c38b2c4f19")

prepare() {
  # Git LFS fails when used as a 'source'
  if [[ -d fgbio ]]; then cd fgbio && git pull; else git clone https://github.com/fulcrumgenomics/fgbio.git; fi
}

pkgver() {
  cd "fgbio"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/fgbio"
  sbt assembly
}

check() {
  cd "${srcdir}/fgbio"
  sbt test
}

package() {
  cd "${srcdir}/fgbio"
  install -Dm644 target/scala-2.12/fgbio*.jar "${pkgdir}/usr/share/java/fgbio/fgbio.jar"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/fgbio/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/fgbio/README.md"

  cd "${srcdir}"
  install -Dm755 "fgbio.sh" "${pkgdir}/usr/bin/fgbio"
}
