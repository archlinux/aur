#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=parquet-tools
pkgver=1.10.0
pkgrel=1
pkgdesc='Java based command line tools that aid in the inspection of the Parquet files'
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment>=8')
arch=('any')
source=(
  "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=parquet/apache-parquet-${pkgver}/apache-parquet-${pkgver}.tar.gz"
  "hdfs-packaging.patch")
url='https://github.com/apache/parquet-mr'
license=('Apache')
sha256sums=('2971e6847874a5b1f45ed1413be15117595649e30895df9650645999a2032790'
            'e6250e855909e5437d8ea8d9230aad6e1b9ad7ea5519dc17f4a94d2b7460aac8')

prepare() {
  cd "apache-parquet-${pkgver}/parquet-tools"
  # Properly package HDFS service descriptors to work with files on remote filesystems
  patch -Np1 -i "${srcdir}/hdfs-packaging.patch"
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
