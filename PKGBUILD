# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
# Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=parquet-cli
pkgver=1.18.1
pkgrel=1
pkgdesc='Java based command line tools that aid in the inspection of the Parquet files'
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8' 'java-environment<25')
arch=('any')
source=(
  "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=parquet/apache-parquet-${pkgver}/apache-parquet-${pkgver}.tar.gz")
sha256sums=('00749b92878b287134c89f6433ffcb9e5973387467390b5d3fb8bbeb29d8ba01')

url='https://github.com/apache/parquet-mr'
license=('Apache')

build() {
  cd "apache-parquet-${pkgver}/parquet-cli"
  mvn --batch-mode -Dmaven.repo.local="${srcdir}/.m2" clean package -Plocal
  mvn dependency:copy-dependencies
}

package() {
  install -m 755 -d "${pkgdir}/usr/bin/"
  cp ../parquet-cli "${pkgdir}/usr/bin"
  cd "apache-parquet-${pkgver}/parquet-cli"

  install -m 755 -d "${pkgdir}/usr/share/java/parquet-cli"
  install -m 644 -t "${pkgdir}/usr/share/java/parquet-cli" "target/parquet-cli-${pkgver}.jar"
  cp -a target/dependency/*.jar "${pkgdir}/usr/share/java/parquet-cli"
}
