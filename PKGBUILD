# Maintainer: numbpill3d <deadgirl2133@gmail.com>
pkgname=monad
pkgver=1.0.0
pkgrel=1
_xmrigver=6.26.0
pkgdesc="Minimalist Monero miner (GTK4/libadwaita, XMRig engine; 2% developer fee)"
arch=('x86_64' 'aarch64')
url="https://github.com/numbpill3d/monad"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'libuv' 'hwloc' 'openssl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numbpill3d/monad/archive/refs/tags/v$pkgver.tar.gz"
        "xmrig-$_xmrigver.tar.gz::https://github.com/xmrig/xmrig/archive/refs/tags/v$_xmrigver.tar.gz")
sha256sums=('1094c4d1d8b066ae6161aabad5c71be86a57f7966e28e381cbc0482bff9b5d6e'
            '5005144e78571f26586410c2b2ede2b0c72afe22f97f1708ea24cfb253c3939b')

prepare() {
  cd "xmrig-$_xmrigver"
  # Monad's disclosed 2% fee replaces XMRig's built-in 1% donation.
  patch -Np1 -i "$srcdir/$pkgname-$pkgver/patches/xmrig-disable-donation.patch"
  patch -Np1 -i "$srcdir/$pkgname-$pkgver/patches/xmrig-openssl4.patch"
}

build() {
  CFLAGS+=" -ffile-prefix-map=$srcdir=."
  CXXFLAGS+=" -ffile-prefix-map=$srcdir=."
  cmake -S "xmrig-$_xmrigver" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_HWLOC=ON
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  python -m unittest discover -s tests
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm755 "$srcdir/build/xmrig" "$pkgdir/usr/lib/monad/xmrig"
  install -Dm644 "$srcdir/xmrig-$_xmrigver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/XMRIG-LICENSE"
}
