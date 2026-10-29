# Maintainer: qubeck <qubeck (AT) disroot (DOT) org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jna
pkgver=5.19.1
pkgrel=1
pkgdesc='Java Native Access library'
arch=(x86_64)
url='https://github.com/java-native-access/jna'
license=('Apache-2.0 OR LGPL-2.1-or-later')
depends=(
  'glibc'
  'java-runtime>=8'
  'libffi.so'
)
makedepends=(
  'ant'
  'git'
  'java-environment>=8'
  'libx11'
  'libxt'
  'pkgconf'
)
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
        'jna-disable-full-jar.patch'
        'jna-disable-native-jar.patch'
        'jna-native-ldflags.patch'
        'jna-use-system-library.patch')
sha256sums=('fb672b61c1af3acd40b9906bb4cbf9a762a921045a4e71a8f1ff784b5948857a'
            'e2dc08dd85e5e7a328def500f2f73783cb4169389158d868c7f34bfe0868abbc'
            '39ba650dd7ae5c62a21752187a92c17e87f0aeed5d59c3d2d38e5b153077a822'
            'ada01ef35a301b4dde0076e49ab5cbc92eeb7ff201da1bd4418a2d1dc00ef3af'
            'a9aec274a697c1dc0e8b1a5fde9db514e23074731e3517d6d78553c93eee863a')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ../jna-disable-full-jar.patch

  patch -Np1 -i ../jna-disable-native-jar.patch

  patch -Np1 -i ../jna-native-ldflags.patch

  patch -Np1 -i ../jna-use-system-library.patch

  # Use the system Ant library
  sed -i 's@lib/ant\.jar@/usr/share/java/ant/ant.jar@g' build-ant-tools.xml
}

build() {
  cd "${pkgname}-${pkgver}"

  ant \
    -Drelease=true \
    -Ddynlink.native=true \
    -Domit-jnilib=true \
    "-Dcflags_extra.native=${CPPFLAGS} ${CFLAGS}" \
    native jar
}

check() {
  cd "${pkgname}-${pkgver}"

  ant \
    -Drelease=true \
    -Ddynlink.native=true \
    -Domit-jnilib=true \
    "-Dcflags_extra.native=${CPPFLAGS} ${CFLAGS}" \
    test
}

package() {
  cd "${pkgname}-${pkgver}/build"

  install -Dm644 jna.jar \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 jna-jpms.jar \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 headers/*.h \
    -t "${pkgdir}/usr/include/${pkgname}"
  install -Dm644 native-linux-x86-64/libjnidispatch.so \
    -t "${pkgdir}/usr/lib/${pkgname}"
}
