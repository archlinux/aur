# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=freedroid
pkgver=1.2.1
pkgrel=2
pkgdesc="a clone of the classic game 'Paradroid' on Commodore 64"
arch=('x86_64')
url="http://freedroid.sourceforge.net/"
license=('GPL')
depends=('glibc' 'sdl_image' 'sdl_mixer' 'sdl_gfx')
source=( #https://downloads.sourceforge.net/sourceforge/freedroid/$pkgname-$pkgver.tar.gz
        "$pkgname-$pkgver.tgz::https://github.com/ReinhardPrix/FreedroidClassic/archive/refs/tags/release-$pkgver.tar.gz"
	freedroid.desktop
	paraicon.png)
sha256sums=('33f4c3da941798b7dbdc41c831bb65c3925288e6737a7f1e3275965f83b4151c'
            'b76e84adc15e8d83722e91843db80bbb664b3e330e03561977de90a06d4d8baf'
            '29e9d5bc1a5833c10fc8b26fac1f4a64338d3a624e18d280abe1d29837202239')

prepare() {
  cd "$srcdir/FreedroidClassic-release-$pkgver"
  touch NEWS
}

build() {
  cd "$srcdir/FreedroidClassic-release-$pkgver"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/FreedroidClassic-release-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir"/paraicon.png "$pkgdir"/usr/share/icons/paraicon.png
  install -Dm0644 "$srcdir"/freedroid.desktop "$pkgdir"/usr/share/applications/freedroid.desktop

  rm -rf "$pkgdir"/usr/share/freedroid/mac-osx
  rm -rf "$pkgdir"/usr/share/freedroid/freedroid.6
  find "$pkgdir"/usr/share/freedroid -type f -name Makefile -exec rm -f {} \;
  find "$pkgdir"/usr/share/freedroid -type f -name Makefile.in -exec rm -f {} \;
  find "$pkgdir"/usr/share/freedroid -type f -name Makefile.am -exec rm -f {} \;
}
