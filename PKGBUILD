pkgname=lamina
pkgver=1.1.1_Beta
pkgver_tag=${pkgver//_/-}
pkgrel=1
pkgdesc="A procedural programming language focusing on precise mathematical computation."
arch=('x86_64' 'aarch64')
url="https://github.com/Lamina-dev/Lamina"
license=('LGPL-2.1')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'gcc' 'make')

source=(
  "${pkgname}-${pkgver_tag}.tar.gz::https://github.com/Lamina-dev/Lamina/archive/refs/tags/v${pkgver_tag}.tar.gz"
  "exprtk.tar.gz::https://github.com/ArashPartow/exprtk/archive/refs/heads/master.tar.gz"
  "libuv.tar.gz::https://github.com/libuv/libuv/archive/refs/heads/v1.x.tar.gz"
)

sha256sums=(
  '05b4e12f2cb3504f30e980ec0f355f157e4de1472c002e7d3478842440e71afd'
  '5436a41a9e0f4e8a3c0401bd9c8bbc943fed68ca6a666506d90f7aadf933622c'
  '71d0279e94b1c36ba9602fc62bbadb80aaa8571826d203904b0dcb1af8e06f3b'
)

prepare() {
  cd "${srcdir}/Lamina-${pkgver_tag}"   
  mkdir -p "external/exprtk"
  cp -r "${srcdir}/exprtk-master/"* "external/exprtk/"
    
  mkdir -p "external/libuv"
  cp -r "${srcdir}/libuv-1.x/"* "external/libuv/"
}

build() {
  cd "${srcdir}/Lamina-${pkgver_tag}"
  mkdir -p build
  cd build
  cmake ..
  make -j$(nproc)
}

package() {
  cd "${srcdir}/Lamina-${pkgver_tag}/build"
  install -Dm755 "Lamina" "$pkgdir/usr/bin/Lamina"
  install -Dm644 "lamina_core.so.1.0.0" "$pkgdir/usr/lib/lamina_core.so.1.0.0"

  ln -s lamina_core.so.1.0.0 "$pkgdir/usr/lib/lamina_core.so.1"
  ln -s lamina_core.so.1 "$pkgdir/usr/lib/lamina_core.so"
}

