# Maintainer: Kevin McCormack <HarlemSquirrel@gmail.com>

pkgname=xmr-stak-opencl-amd
pkgver=2.4.2
pkgrel=1
pkgdesc="Unified All-in-one Monero miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('cmake')
depends=('hwloc' 'libmicrohttpd' 'opencl-amd' 'openssl')
source=("git+https://github.com/fireice-uk/xmr-stak.git#tag=${pkgver}"
        'no-donate.patch')
sha256sums=('SKIP'
            '30ef1099d196a4ead4338c89ff8608258fe4e1a6f5eed99f3c96c41d9e77fdcd')

prepare() {
  cd "$srcdir/xmr-stak"
  patch -p1 -i ../no-donate.patch
}

build() {
  cd "$srcdir/xmr-stak"
  cmake . -DCUDA_ENABLE=OFF
  make
}

package() {
  install -D -m755 "$srcdir/xmr-stak/bin/xmr-stak" -t "$pkgdir/usr/bin/"
  # install -D -m644 "$srcdir/xmr-stak/bin/libxmrstak_cuda_backend.so" -t "$pkgdir/usr/lib"
  install -D -m644 "$srcdir/xmr-stak/bin/libxmrstak_opencl_backend.so" -t "$pkgdir/usr/lib"
}


# source=("https://github.com/fireice-uk/xmr-stak/archive/${pkgver}.tar.gz"
#         'disable_donation.diff')
# sha256sums=('3a85ecb9a844443cc60fdf22d087fbc98cb2ec782d7f0e38a776420ae22d4f28'
#             '53062ef6b0a104164ac95f006201ca00d8c5c80b5cd2629ae0315a1ccefae856')

# prepare() {
#   cd "$srcdir/xmr-stak-$pkgver"
#   patch -p0 -i ../../disable_donation.diff
# }
#
# build() {
#   cd "xmr-stak-$pkgver"
#
#   mkdir build
#   cd build
#
#   # https://github.com/fireice-uk/xmr-stak/blob/master/doc/compile.md
#   cmake \
#     .. \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DCMAKE_LINK_STATIC=OFF \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DMICROHTTPD_ENABLE=ON \
#     -DOpenSSL_ENABLE=ON \
#     -DXMR-STAK_COMPILE=native \
#     -DCPU_ENABLE=ON \
#     -DHWLOC_ENABLE=ON \
#     -DOpenCL_ENABLE=ON \
#     -DCUDA_ENABLE=OFF
#
#   make
# }
#
# package() {
#   cd "xmr-stak-$pkgver/build"
#   make DESTDIR="$pkgdir/" install
# }
