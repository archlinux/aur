# Maintainer: <asamk@gmx.de>

pkgname=libzkgroup
_pkgname=zkgroup
pkgver=0.8.2
pkgrel=1
pkgdesc="Library for the Signal Private Group System."
url="https://github.com/signalapp/${_pkgname}"
makedepends=('cargo' 'gradle')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('c2f758cb96c4e49b18439c8c0ae06d129a8f46549b63a9498cf54d7d64489dcc')

prepare() {
  tar xf ${pkgname}-$pkgver.tar.gz
  cd "${_pkgname}-$pkgver"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  sed -i '/ffi:android/d' settings.gradle
  sed -i '/:makeServer/d' ffi/java/build.gradle
  sed -i "/apply from: '..\/..\/deploy.gradle'/d" ffi/java/build.gradle
  sed -i "/archives testableJar/d" ffi/java/build.gradle
}

build() {
  cd "${_pkgname}-$pkgver"
  cargo build --release --locked
  gradle :ffi:java:assemble
}

package() {
  cd "${_pkgname}-$pkgver"

  install -m755 -d "${pkgdir}"/usr/share/java/${pkgname} "${pkgdir}"/usr/lib

  install -Dm644 "ffi/java/build/libs/zkgroup-java.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "target/release/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"
}
