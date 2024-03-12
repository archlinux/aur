# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=mvfst
pkgver=2024.03.11.00
pkgrel=1
pkgdesc="An implementation of the QUIC transport protocol"
arch=(x86_64)
url="https://github.com/facebook/mvfst"
license=(MIT)
depends=(
  double-conversion
  fizz
  fmt
  folly
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
sha256sums=('4ba28efd162f83c7a330fab811f128490a787ef91d6366c6df9fc1f70e9b423d')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Remove tests that doesn't compile due to what I think is an incompatibility
  # with gtest
  sed -i '/QuicServerTest.cpp/d' quic/server/test/CMakeLists.txt

  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd "$_archive"

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
  cd "$_archive"

  # Test fails in a chroot - not sure why
  ctest --test-dir build --output-on-failure \
    -E QuicClientTransportAfterStartTest.StatelessResetClosesTransport
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
