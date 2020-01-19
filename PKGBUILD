#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=parquet-tools
pkgver=1.11.0
pkgrel=1
pkgdesc='Java based command line tools that aid in the inspection of the Parquet files'
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8')
arch=('any')
source=(
  "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=parquet/apache-parquet-${pkgver}/apache-parquet-${pkgver}.tar.gz"
  "hdfs-packaging.patch"
  "shaded-fasterxml-jackson.patch")
url='https://github.com/apache/parquet-mr'
license=('Apache')
sha256sums=('bf33f08595a908ec865e664f66bb9f9ee8a0b5fd424d6a7dda52893f92545b1a'
            '6a3bf99c1b556257bb224a654e5d8bc93f10929b907d92874e97b68de49e04ea'
            '29e395981eff9b3530a9f381bbc6e0dc5480ead174cbc06f973578540ec6b452')

prepare() {
  cd "apache-parquet-${pkgver}/parquet-tools"
  # Properly package HDFS service descriptors to work with files on remote filesystems
  patch -Np1 -i "${srcdir}/hdfs-packaging.patch"
  patch -Np1 -i "${srcdir}/shaded-fasterxml-jackson.patch"
}

build() {
  cd "apache-parquet-${pkgver}/parquet-tools"
  mvn --batch-mode -Dmaven.repo.local="${srcdir}/.m2" clean package -Plocal
}

package() {
  cd "apache-parquet-${pkgver}/parquet-tools"

  install -m 755 -d "${pkgdir}/usr/share/java/parquet-tools"
  install -m 755 -t "${pkgdir}/usr/share/java/parquet-tools" src/main/scripts/*
  
  install -m 755 -d "${pkgdir}/usr/share/java/parquet-tools/lib"
  install -m 644 -t "${pkgdir}/usr/share/java/parquet-tools/lib" "target/parquet-tools-${pkgver}.jar"

  install -m 755 -d "${pkgdir}/usr/bin"
  for tool in cat dump head merge meta rowcount schema size; do
    sed -i 's/dirname \"\$0\"/dirname \$\(readlink -f \"\$0\"\)/g' "${pkgdir}/usr/share/java/parquet-tools/parquet-${tool}"
    ln -s "/usr/share/java/parquet-tools/parquet-${tool}" "${pkgdir}/usr/bin/parquet-${tool}"
  done
}
