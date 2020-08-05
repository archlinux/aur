# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=or-tools-java
pkgver=7.8
pkgrel=1
pkgdesc='Google`s Operations Research tools. With Java bindings'
arch=('x86_64')
url='https://github.com/google/or-tools'
license=('Apache')
depends=('java-runtime>=7.0')
makedepends=('swig' 'python' 'cmake' 'git')
source=("https://github.com/google/or-tools/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'git+https://github.com/gflags/gflags.git'
        'git+https://github.com/google/glog.git'
        'git+https://github.com/google/protobuf.git'
        'git+https://github.com/abseil/abseil-cpp.git'
        'git+https://github.com/NixOS/patchelf.git'
        'git+https://github.com/coin-or/Cbc.git'
        'git+https://github.com/coin-or/Cgl.git'
        'git+https://github.com/coin-or/Clp.git'
        'git+https://github.com/coin-or/Osi.git'
        'git+https://github.com/coin-or/CoinUtils.git')
b2sums=('6a36b100381cb8c8b28c7aa3d0942eac337ae5a9c0f608ab81d9ae2cec8d55abff8c0de8c88df061bf5984161e472973d8b9d4fc61b82e8b74d67eb14cc596ae'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd ${pkgname%-java}-${pkgver}
  echo "JAVA_HOME = /usr/lib/jvm/default" >> Makefile.local

  for src in "${source[@]}"; do
    [[ $src = *.git ]] || continue
    srcfolder=${src##*/}
    srcfolder=${srcfolder%.git}
    echo "s#${src#git+}#${srcdir}/${srcfolder}#"
    sed -i "s#${src#git+}#${srcdir}/${srcfolder}#" "${srcdir}"/${pkgname%-java}-${pkgver}/makefiles/Makefile.third_party.unix.mk
  done
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
    dependencies/install/lib/libprotobuf-lite.so.3.12.2.0 \
    dependencies/install/lib/libgflags_nothreads.so.2.2.2 \
    dependencies/install/lib/libprotoc.so.3.12.2.0 \
    dependencies/install/lib/libgflags.so.2.2.2 \
    dependencies/install/lib/libglog.so.0.4.0 \
    dependencies/install/lib/libprotobuf.so.3.12.2.0
  for i in "${pkgdir}"/usr/lib/${pkgname}/*.so.*; do ln -rs ${i} ${i%so.*}so; done
  install -Dm755 -t "${pkgdir}/usr/share/java/${pkgname}" lib/com.google.ortools.jar
  echo "/usr/lib/${pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${pkgname}.conf
  cp -ar examples/java/* "${pkgdir}"/usr/share/${pkgname}
}
