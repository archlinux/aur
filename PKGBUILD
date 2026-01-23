
# Maintainer: Bumblebee-3

pkgbase=memoria
pkgname=(memoria-daemon memoria-ui)
pkgver=1.1.0
pkgrel=1
pkgdesc="Clipboard manager with daemon and Qt UI"
arch=('x86_64')
url="https://github.com/Bumblebee-3/memoria"
license=('MIT')

makedepends=(
  cargo
  cmake
  ninja
)

source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('406a6c51902358880e5f215da72d92b2b701dc4a27cc53fcbb0d2ad52847e4bb')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  # Build daemon
  cargo build --release --locked \
    --manifest-path memoria-daemon/Cargo.toml

  # Build UI
  cmake -S memoria-ui -B build-ui \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build-ui
}

package_memoria-daemon() {
  pkgdesc="Memoria clipboard daemon (systemd user service)"
  depends=(
    gcc-libs
    sqlite
  )

  cd "$srcdir/$pkgbase-$pkgver"

  install -Dm755 \
    memoria-daemon/target/release/memoria-daemon \
    "$pkgdir/usr/bin/memoria-daemon"

  install -Dm644 \
    memoria-daemon/memoria-daemon.service \
    "$pkgdir/usr/lib/systemd/user/memoria-daemon.service"
}

package_memoria-ui() {
  pkgdesc="Memoria Qt6 user interface"
  depends=(
    gcc-libs
    qt6-base
    qt6-declarative
    memoria-daemon
  )

  cd "$srcdir/$pkgbase-$pkgver"
  DESTDIR="$pkgdir" cmake --install build-ui
}
