# Maintainer: Martin Chang <marty188586@gmail.com>
_pkgname=tt-kmd-git
pkgname=$_pkgname-dkms
pkgver=1.31.r33.ge17d460
pkgrel=1
pkgdesc="Tenstorrent Kernel Module"
arch=('x86_64')
url="https://github.com/tenstorrent/tt-kmd"
license=('GPL-2.0-only')
source=("$pkgname::git+https://github.com/tenstorrent/tt-kmd.git")
sha256sums=('SKIP')
makedepends=('git' 'make' 'gcc' 'base-devel')
depends=('dkms')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/[^.]*.//'
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -i 's/TENSTORRENT_MAX_DMA_BUFS/(std::uint8_t)TENSTORRENT_MAX_DMA_BUFS/g' test/dma_buf.cpp
}

package() {
  cd "$srcdir/$pkgname"

  # Install dkms.conf
  install -Dm644 dkms.conf "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  # hack DKMS conf to load correctly build stuff
  cat << EOF >> "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
CLEAN="make clean"
MAKE="make all"
EOF

  # Copy source and Makefile
  find . -type f | grep -vE '(\.git|\.gitignore|\.gitmodules|dkms.conf|.*\.ko|.*\.mod|.*\.cmd|.*\.o)' | xargs -n1 -I@ install -Dm644 @ "$pkgdir/usr/src/$_pkgname-$pkgver/@"
  chmod +x "$pkgdir/usr/src/$_pkgname-$pkgver/dkms-post-install"

  install -Dm644 udev-50-tenstorrent.rules "$pkgdir/usr/lib/udev/rules.d/50-tenstorrent.rules"
}
