# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: GSI <2017 at groovy-skills dot com>
# Contributor: Saren Arterius <saren at wtako dot net>
# Contributor: Hui Yiqun <huiyiqun at gmail dot com>

pkgname=xmr-stak-nvidia-git
pkgver=2.10.8.r0.g67cf951
pkgrel=1
pkgdesc="Free Monero RandomX Miner and unified CryptoNight miner (CUDA)"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake' 'opencl-headers')
depends=('libmicrohttpd' 'openssl' 'hwloc' 'ocl-icd' 'cuda')
source=("git+https://github.com/fireice-uk/xmr-stak.git"
	'xmr-stak.service')
sha256sums=('SKIP'
            'e0cbee0dab1c730e5deff31eddef84a635b4c9f33ba2368a446e62acc084649a')

pkgver() {
  cd "$srcdir/xmr-stak"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/xmr-stak"

  # create build dir
  [ -d build ] || mkdir build
}

build() {
  cd "$srcdir/xmr-stak/build"

    # https://github.com/fireice-uk/xmr-stak/blob/master/doc/compile/compile_Linux.md
    cmake \
        .. \
	-DCMAKE_C_COMPILER=/usr/bin/gcc-8 \
	-DCMAKE_CXX_COMPILER=/usr/bin/g++-8 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCPU_ENABLE=ON \
        -DCUDA_ENABLE=ON
    make
}

package() {
    cd "$srcdir/xmr-stak/build"
    make DESTDIR="$pkgdir/" install

    install -m755 -d $pkgdir/usr/lib/systemd/system
    install -m644  $srcdir/xmr-stak.service $pkgdir/usr/lib/systemd/system
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -m755 -d $pkgdir/etc/xmr-stak
}
