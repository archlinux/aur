# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=pc-ble-driver
pkgver=4.1.4
pkgrel=4
pkgdesc="C/C++ libraries for Bluetooth Low Energy nRF5 SoftDevice serialization"
arch=(x86_64)
url="https://github.com/NordicSemiconductor/pc-ble-driver"
license=(custom)
depends=(gcc-libs glibc)
makedepends=(asio catch2 cmake fmt git spdlog systemd)
provides=(
  libnrf-ble-driver-sd_api_v2.so
  libnrf-ble-driver-sd_api_v3.so
  libnrf-ble-driver-sd_api_v5.so
  libnrf-ble-driver-sd_api_v6.so
)
options=(debug staticlibs)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/NordicSemiconductor/$pkgname/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-4.1.4-gcc_11.2.patch::https://github.com/NordicSemiconductor/pc-ble-driver/commit/37258e65bdbcd0b4369ae448faf650dd181816ec.patch
)
sha256sums=('a883c4913510822da938b782362b6ec77b807e46d23ef838765217e05a3090ec'
            '7588865671b302946be3ed4bc9b4e56820214b026dd823c4c650323bff0e246a')
b2sums=('7e31b05aaffaef4936f4794b527016dc3d550c8ce8fa6b1c89b8d73a71388aa38d8e30a4a44c1c6174587bd74de8c9028e4280a528f017c57b6f4e0be36bdd1b'
        '81e82f4257399d303f71595da9b66185a8669387d8fbb85cfc00bc97a2d8c2d9c3132633be29babcae752bd901a30ab2b48f08d200492878f2dbcdad31a7a2c0')

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-4.1.4-gcc_11.2.patch
  # set project version properly, as it is used by all sorts of downstream projects
  sed -e "s/0.0.0/$pkgver/g" -i $pkgname-$pkgver/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  depends+=(libfmt.so libspdlog.so libudev.so)

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
