pkgname=xmrig-mo-service
pkgver=6.22.0
pkgrel=1
pkgdesc="MoneroOcean XMRig with zero-impact desktop tuning script"
arch=('x86_64')
url="https://github.com/MoneroOcean/xmrig"
license=('GPL3')
depends=('hwloc' 'libuv' 'openssl' 'pciutils')
makedepends=('cmake' 'git' 'make' 'gcc')
source=("git+https://github.com/MoneroOcean/xmrig.git"
        "xmrig-mo.service"
        "xmrig-mo-tune")
sha256sums=('SKIP'
            '7a12b30926aa0425db6726deecaebb2717dc13eeef33a881b340b2c9055418ef'
            '9476fa893b88563c0236e5d37c19ab9973ce3f8d73943f5cc1ebab6427b05fa3')

build() {
  cd "$srcdir/xmrig"
  mkdir -p build && cd build
  # Compile natively for the host CPU
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DWITH_HWLOC=ON \
           -DCMAKE_C_FLAGS="-march=native -O3" \
           -DCMAKE_CXX_FLAGS="-march=native -O3"
  make -j$(nproc)
}

package() {
  # Install the binary
  install -Dm755 "$srcdir/xmrig/build/xmrig" "$pkgdir/usr/bin/xmrig-mo"
  
  # Install the tuning script
  install -Dm755 "$srcdir/xmrig-mo-tune" "$pkgdir/usr/bin/xmrig-mo-tune"
  
  # Install the base systemd service
  install -Dm644 "$srcdir/xmrig-mo.service" "$pkgdir/usr/lib/systemd/system/xmrig-mo.service"
}
