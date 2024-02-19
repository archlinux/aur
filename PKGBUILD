# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=pc-ble-driver
pkgver=4.1.4
pkgrel=9
pkgdesc="C/C++ libraries for Bluetooth Low Energy nRF5 SoftDevice serialization"
arch=(x86_64)
url="https://github.com/NordicSemiconductor/pc-ble-driver"
license=(LicenseRef-Five-Clause-Nordic-License)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  asio
  catch2
  cmake
  fmt
  git
  spdlog
  systemd
)
provides=(
  libnrf-ble-driver-sd_api_v2.so
  libnrf-ble-driver-sd_api_v3.so
  libnrf-ble-driver-sd_api_v5.so
  libnrf-ble-driver-sd_api_v6.so
)
options=(staticlibs)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/NordicSemiconductor/$pkgname/archive/refs/tags/v$pkgver.tar.gz
  $pkgname-4.1.4-gcc_11.2.patch::https://github.com/NordicSemiconductor/pc-ble-driver/commit/37258e65bdbcd0b4369ae448faf650dd181816ec.patch
  $pkgname-4.1.4-catch2_3.patch
)
sha256sums=('a883c4913510822da938b782362b6ec77b807e46d23ef838765217e05a3090ec'
            '7588865671b302946be3ed4bc9b4e56820214b026dd823c4c650323bff0e246a'
            '130253335691f239927bc7881f3d3b6eacc2003023a57ed6b49dff4aba717472')
b2sums=('7e31b05aaffaef4936f4794b527016dc3d550c8ce8fa6b1c89b8d73a71388aa38d8e30a4a44c1c6174587bd74de8c9028e4280a528f017c57b6f4e0be36bdd1b'
        '81e82f4257399d303f71595da9b66185a8669387d8fbb85cfc00bc97a2d8c2d9c3132633be29babcae752bd901a30ab2b48f08d200492878f2dbcdad31a7a2c0'
        '8e0b9f96b5d6ca2b4b8e907e05622a367e08d33a3a6e4ef0a0f928003529cbe318da85fe10c72eef845eb83491d948aa2ef85cc8f3d1940e08240e1f2b4be996')

prepare() {
  # add missing include for thread
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-4.1.4-gcc_11.2.patch
  # fix build against catch2 >= 3
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-4.1.4-catch2_3.patch
  # set project version properly, as it is used by all sorts of downstream projects
  sed -e "s/0.0.0/$pkgver/g" -i $pkgname-$pkgver/CMakeLists.txt
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects"
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  depends+=(
    fmt libfmt.so
    spdlog libspdlog.so
    systemd-libs libudev.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
