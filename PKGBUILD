# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=or-tools-java
pkgver=7.5
pkgrel=1
pkgdesc='Google`s Operations Research tools. With Java bindings.'
arch=('x86_64')
url='https://github.com/google/or-tools'
license=('Apache')
depends=('java-runtime>=7.0')
makedepends=('swig' 'python' 'cmake' 'git')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha512sums=('993745b19fffeeaf6d58675a2e7113e5a49e35f105ec5e9ca6cfa108e184ebbfccc9f61081189c4e4a850a861fee2bbcf68209eca57b8ad098a7e76c20a517e4')

prepare() {
  cd ${pkgname%-java}-${pkgver}
  echo "JAVA_HOME = /usr/lib/jvm/default" >> Makefile.local
}

build() {
  cd ${pkgname%-java}-${pkgver}
  make third_party
  make java
}

check() {
  cd ${pkgname%-java}-${pkgver}
  make test_java
}

package() {
cd ${pkgname%-java}-${pkgver}
install -dm755 "${pkgdir}"/usr/share/${pkgname}
install -dm755 "${pkgdir}"/etc/ld.so.conf.d/
# We need to package all dependencies of which some may conflict with exisiting libs
# So we use a separate dir
install -Dm755 -t "${pkgdir}"/usr/lib/${pkgname} \
  lib/libjniortools.so \
  lib/libortools.so \
  dependencies/install/lib/libprotobuf-lite.so.3.9.0.0 \
  dependencies/install/lib/libgflags_nothreads.so.2.2.2 \
  dependencies/install/lib/libprotoc.so.3.9.0.0 \
  dependencies/install/lib/libgflags.so.2.2.2 \
  dependencies/install/lib/libglog.so.0.4.0 \
  dependencies/install/lib/libprotobuf.so.3.9.0.0
for i in ${pkgdir}/usr/lib/${pkgname}/*.so.*; do ln -rs ${i} ${i%so.*}so; done
install -Dm755 -t "${pkgdir}/usr/share/java/${pkgname}" lib/com.google.ortools.jar
echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf
cp -ar examples/java/* "${pkgdir}"/usr/share/${pkgname}
}
