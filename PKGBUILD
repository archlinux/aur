# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=or-tools-java
pkgver=7.4
pkgrel=1
pkgdesc='Google`s Operations Research tools. With Java bindings.'
arch=('x86_64')
url='https://github.com/google/or-tools'
license=('Apache')
depends=('java-runtime>=7.0')
makedepends=('swig' 'python' 'cmake' 'git')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha512sums=('a6bd6f199b6c51dbbe0b594704bc90f5a6774d23da3e76ca4bc5bdf9fe3b5b354931b4726c2f2d0b51907570e63ec377efcdea5f35619515815718e60c289ec2')

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
