# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=mvfst
pkgver=2025.11.03.00
pkgrel=1
pkgdesc="An implementation of the QUIC transport protocol"
arch=(x86_64)
url="https://github.com/facebook/mvfst"
license=(MIT)
depends=(
  double-conversion
  fizz=$pkgver
  fmt
  folly=$pkgver
  gcc-libs
  gflags
  glibc
  google-glog
  gtest
  libsodium
  openssl
)
makedepends=(
  boost
  cmake
)
checkdepends=(expat)
provides=(
  libmvfst_async_udp_socket.so
  libmvfst_batch_writer.so
  libmvfst_buf_accessor.so
  libmvfst_bufutil.so
  libmvfst_cc_algo.so
  libmvfst_client.so
  libmvfst_codec.so
  libmvfst_codec_decode.so
  libmvfst_codec_packet_number_cipher.so
  libmvfst_codec_pktbuilder.so
  libmvfst_codec_pktrebuilder.so
  libmvfst_codec_types.so
  libmvfst_constants.so
  libmvfst_dsr_frontend.so
  libmvfst_dsr_types.so
  libmvfst_events.so
  libmvfst_exception.so
  libmvfst_fizz_client.so
  libmvfst_fizz_handshake.so
  libmvfst_flowcontrol.so
  libmvfst_handshake.so
  libmvfst_happyeyeballs.so
  libmvfst_looper.so
  libmvfst_loss.so
  libmvfst_observer.so
  libmvfst_qlogger.so
  libmvfst_server.so
  libmvfst_server_async_tran.so
  libmvfst_server_state.so
  libmvfst_state_ack_handler.so
  libmvfst_state_datagram_handler.so
  libmvfst_state_functions.so
  libmvfst_state_machine.so
  libmvfst_state_pacing_functions.so
  libmvfst_state_simple_frame_functions.so
  libmvfst_state_stream.so
  libmvfst_state_stream_functions.so
  libmvfst_transport.so
  libmvfst_transport_knobs.so
  libmvfst_transport_settings_functions.so
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ff83cb4aa0cf06395470e83b954acd9a92be9aed1908072a95b105a5ae88fe74')

prepare() {
  cd $pkgname-$pkgver
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPACKAGE_VERSION="$pkgver"
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  ctest --test-dir build --output-on-failure
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
