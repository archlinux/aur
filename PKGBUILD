pkgname=libva-xvba-driver
pkgver=0.8.0
pkgrel=5
pkgdesc='XvBA backend for VA-API'
arch=(i686 x86_64)
url=http://freedesktop.org/wiki/Software/vaapi/
license=(GPL)
makedepends=(catalyst-libgl libva nvidia-cg-toolkit python2 xvba-sdk)
conflicts=(xvba-video)
source=(
http://cgit.freedesktop.org/vaapi/xvba-driver/snapshot/xvba-driver-$pkgver.tar.xz
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-libs/xvba-video/files/xvba-video-$pkgver-assert-hw_image_hooks_glx.patch
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/x11-libs/xvba-video/files/xvba-video-fix-out-of-source-builds.patch
https://build.opensuse.org/source/home:maxge73/xvba-video/xvba-video-h264-level51.patch
https://build.opensuse.org/source/home:maxge73/xvba-video/xvba-video-remove-installation.patch
https://raw.githubusercontent.com/frugalware/frugalware-stable/2.0/source/x11-extra/$pkgname/fixes.patch
)
sha256sums=(202cabed9e256abcc24d475e04677b21b6676bfd92f7fa92c889d78b03e7366a
            66625bcd61e5c295a04ad8dc00e57aa95f984da5eb1e7e4a5e7e072eaf472b4a
            5acd2f0c1ee1a575bdfe9c0323627e74c15d75af0a88ab4e514f145a419ddc15
            20397f668ae6a27be36ca21665fa3a744d1bccd989bb3250bef01ed5cb566436
            5e3521f6ff00b416cfcf81cf3073dcc5eb84a91712e75d42fe969524a4b32cd0
            f942b9eb5e216a0b6fca5cbb1e5bc09a5b8084c9fb7ed161fae4cde0ed1605f7)


prepare() {
  cd xvba-driver-$pkgver

  patch -Np1 < $srcdir/xvba-video-h264-level51.patch
  patch -Np1 < $srcdir/xvba-video-$pkgver-assert-hw_image_hooks_glx.patch
  patch -Np1 < $srcdir/xvba-video-remove-installation.patch
  patch -Np1 < $srcdir/fixes.patch
  patch -Np0 < $srcdir/xvba-video-fix-out-of-source-builds.patch
}

build() {
  cd xvba-driver-$pkgver

  local confopts=(
    --disable-debug
    --disable-tracer
    --disable-valgrind
  )

  ./autogen.sh ${confopts[@]}

  make PYTHON=python2
}

package() {
  cd xvba-driver-$pkgver

  make DESTDIR=$pkgdir install

  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 AUTHORS COPYING NEWS README $pkgdir/usr/share/doc/$pkgname
}
