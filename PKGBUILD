# Maintainer: Nicola Revelant <nicolarevelant44@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=pinfo
pkgver=0.6.13
pkgrel=2
pkgdesc="A hypertext info file viewer"
arch=('x86_64')
url="http://pinfo.sourceforge.net/"
# https://fossies.org/linux/misc/pinfo-0.6.10.tar.gz/
license=('GPL')
depends=('ncurses' 'readline')
#source=("https://alioth.debian.org/frs/download.php/file/3351/$pkgname-$pkgver.tar.bz2")
#source=("https://arch.p5n.pp.ru/~sergej/dl/2014/pinfo-$pkgver.tar.bz2")
#source=("https://fossies.org/linux/misc/old/pinfo-$pkgver.tar.bz2")
source=("pinfo-$pkgver.tgz::https://github.com/baszoetekouw/pinfo/archive/v$pkgver.tar.gz"
        gcc10-stringop.diff
        https://github.com/baszoetekouw/pinfo/commit/ab604fdb.patch)
sha256sums=('9dc5e848a7a86cb665a885bc5f0fdf6d09ad60e814d75e78019ae3accb42c217'
            '876fd9e3fbb6e129abe183dceb4db03cbd152467e7f0b7edd7cb03c5bc201c32'
            '7690ed298a139b82b763979e59998afdac88b4265d867f746811e317a152f57d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # remove on 0.6.14
  patch -Np1 -i ../gcc10-stringop.diff
  # Fix build with -Werror=format
  patch -p1 -i ../ab604fdb.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  unset LDFLAGS
  [ -x configure ] || ./autogen.sh
  sed -i 's|nogroup|nobody|' src/pinforc.in src/utils.c
  [ -f Makefile ] || ./configure --prefix=/usr --sysconfdir=/etc --enable-cursor \
	--mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/info/dir"
}
