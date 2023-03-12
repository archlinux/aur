# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.9.4
pkgrel=4
pkgdesc='Efficient implementation of the Scheme programming language'
arch=(x86_64)
url='https://github.com/gambit/gambit'
license=(Apache LGPL)
options=(staticlibs !lto)
makedepends=(git setconf)
source=("${pkgname/-c}-$pkgver.tar.gz::https://gambitscheme.org/latest/gambit-v${pkgver//./_}.tgz")
b2sums=('f2d638a8ab901fb9d14d2f91291dd732e66913f18dc4e6c9c50af7aa1aafa49e97bdd7a704dfd1f14fa71aa16a859fe9b7a7bcbc5ee5953a1dac56966071148b')

prepare() {
  setconf -d ${pkgname/-c}-$pkgver/include/stamp-release.h \
    ___STAMP_RELEASE_VERSION=\"v$pkgver\"
}

build() {
  cd ${pkgname/-c}-$pkgver
  ./configure \
    --docdir=/usr/share/doc/gambit-c \
    --enable-gcc-opts \
    --enable-single-host \
    --infodir=/usr/share/info \
    --libdir=/usr/lib/gambit-c \
    --prefix=/usr
  make
}

package() {
  make -C ${pkgname/-c}-$pkgver install DESTDIR="$pkgdir"
  # /usr/bin/gsc conflicts with ghostscript
  mv "$pkgdir/usr/bin/gsc" "$pkgdir/usr/bin/gambitc"
  ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}

# getver: github.com/gambit/gambit/releases/latest
