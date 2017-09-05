#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=parquet-tools
pkgver=1.9.0
pkgrel=1
pkgdesc='Java based command line tools that aid in the inspection of the Parquet files'
depends=('java-runtime>=7')
makedepends=('maven' 'java-environment>=7')
arch=('any')
source=("git+https://github.com/apache/parquet-mr.git#tag=apache-parquet-${pkgver}")
url='https://github.com/apache/parquet-mr'
license=('Apache')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/parquet-mr/parquet-tools"
  mvn --batch-mode clean package -Plocal
}

package() {
  cd "${srcdir}/parquet-mr/parquet-tools"

  install -m 755 -d "${pkgdir}/usr/share/java/parquet-tools"
  install -m 755 -t "${pkgdir}/usr/share/java/parquet-tools" src/main/scripts/*
  
  install -m 755 -d "${pkgdir}/usr/share/java/parquet-tools/lib"
  install -m 644 -t "${pkgdir}/usr/share/java/parquet-tools/lib" "target/parquet-tools-${pkgver}.jar"

  install -m 755 -d "${pkgdir}/usr/bin"
  for tool in cat dump head merge meta schema; do
    sed -i 's/dirname \"\$0\"/dirname \$\(readlink -f \"\$0\"\)/g' "${pkgdir}/usr/share/java/parquet-tools/parquet-${tool}"
    ln -s "/usr/share/java/parquet-tools/parquet-${tool}" "${pkgdir}/usr/bin/parquet-${tool}"
  done
}
