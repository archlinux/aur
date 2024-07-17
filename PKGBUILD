# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

_debian_version="5.1.25-15"
pkgname=grace
pkgver=5.1.25
pkgrel=11
pkgdesc="2D plotting tool"
arch=(x86_64)
url="http://plasma-gate.weizmann.ac.il/Grace/"
depends=('openmotif' 't1lib' 'netcdf' 'fftw')
license=('GPL')
options=('staticlibs' '!lto')
source=("ftp://ftp.fu-berlin.de/unix/graphics/grace/src/grace5/$pkgname-$pkgver.tar.gz"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/configure-implicit-declarations.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/fftw3.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/font-extension-t1.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/gracerc.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/grconvert-tirpc.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/netbook_small_screen_2.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/netcdf-build-fix.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/non-resizable-dialogs.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/nonlinear_extended.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/source-hardening.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/t1lib-general.diff"
        "https://sources.debian.org/data/main/g/grace/1%3A$_debian_version/debian/patches/tmpnam_to_mkstemp.diff")

CFLAGS="$CFLAGS -Wno-implicit-int"

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '1,1i#include <zlib.h>' src/rstdrv.c
  sed -i 's|png_ptr->jmpbuf|png_jmpbuf(png_ptr)|g' src/rstdrv.c

  # debian patches
  patch -p1 -i ../gracerc.diff
  patch -p1 -i ../tmpnam_to_mkstemp.diff
  patch -p1 -i ../fftw3.diff  # port to fftw3
  patch -p1 -i ../netcdf-build-fix.diff  # update netcdf macro in autotools
  patch -p1 -i ../netbook_small_screen_2.diff  # improve display on small-resolution screens
  patch -p1 -i ../non-resizable-dialogs.diff  # set certain dialog boxes to fixed sizes
  patch -p1 -i ../nonlinear_extended.diff  # add multiple non-linear data fitting functions
  patch -p1 -i ../source-hardening.diff  # permit compilation with hardening flags
  patch -p1 -i ../t1lib-general.diff  # apply several updates and fixes to t1lib
  patch -p1 -i ../font-extension-t1.diff  # search for .t1 as a font file extension, in addition to .pfa/.pfb
  patch -p1 -i ../grconvert-tirpc.diff
  patch -p1 -i ../configure-implicit-declarations.diff
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --exec-prefix=/usr \
    --enable-grace-home=/usr/share/grace \
    --includedir=/usr/include --libdir=/usr/lib \
    -with-helpviewer="firefox %s"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  (cd "$pkgdir"/usr/share/grace && mv bin lib include ../../)
}

sha512sums=('9ea68483af1dfc98d217ae730b7a51b66deae5aaa8dfda29d5a3337ed4b5728b45aa03f561bf7d4173e73d6af8dee03cbabd95c0c8dd36999303c89451a3728a'
            '6fd6165b83aa57596326ff4802d6879bc4c7fe43de3b4cb3418ba9f5a723c7bf96e2dc578235dfcef9502bfb473e79d9797b788d3231adabd17acbcabf6b296a'
            'a2c0d8725289069ca5766b7ab3dfee5a08ee15922e9734bc95d6a9ad008d4264e90c8cb5db8ab5e3c41cb4b29c14fca815d8a5d875dbb35977d810052ed566ea'
            'ffa8cc1a97b26192efbfb3597e9209e4c15455d27988cda30464a0fbd3c53167ce0fcc4f93eda7a14ebd8d6f798de08855f814f8dfbca010a7dcb504dd4b6097'
            '05045afb2b350bcbf6d34f5b572a85443725739236a2cb8d083fc391965db204a1e24e74a13ddfbe873eaa48077e8c0a352f77df82af86ce3d956fa9a2b5d594'
            'd2b38d1f220a7a30f79075d95c1a6e8cb45e9b9c264ec7275db47e8a24e305609421ebc832b3d39815c53b93cddf3e8222254166851c86ed6a0da84e254532e9'
            '70daaf9ca492a42bd11d0dfb3dae02850d517931343ba7674f3062d3f866c9700ce3ab0edbf1ae940e72c7bc291bebd0436953a126742f79d20e821191f050ca'
            '741e694a0f44ade9ab3747fbd17b889c84c82f231cc63c86368963e37ca8df610c1bccd290a1468f2d2dcb5c10243e0868563cf1d75015d19a989d172224ac34'
            'f4897d4c3acd3f4c4898fd3d5a90048442dc9066b6491121e526df39d3c1bfaab9d4c64a8e89d25d8d12015c6ccc31416dcc0e9c1f45d24b7851184cb19ddaed'
            '8835b94ec4ec5d2d87328811c639585916f95784adf29c77306cd28bdb809284238e01549da360cf31bdcfbf3c6bf5f28bfacdefc6696606e9c6f322107edf23'
            'd9bc22f67771061d7f4d5555dc57056eadadfff50169f525d2b87cab36dc1fcc8a7a3d88f685ffe3eb5b5140a25061efa3be08331dd44de2d55bba720a6166e7'
            'e31a77f7a7671216455f32a75234420b6413cccc5a96465a0acde96f25f94d1a8832a47f6c770e76abb24194cb4ff6984f234e74bad249e5b4029b1030e9c1ba'
            '7a1984fabf04c8981ee82c10ab1980fed922a73ea24808bb262d445ed9b37bcab2c8b81ba023005048e9ddb46abb8eda90566ef79e408c608958c47068b4b202')
