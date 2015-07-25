# Maintainer: Liu DongMiao <liudongmiao@gmail.com>

pkgname=zhcon
pkgver=0.2.6
pkgrel=9
pkgdesc="A Fast CJK Virtual Console"
arch=(i686 x86_64)
url="http://zhcon.sourceforge.net"
license=(GPL)
depends=(gpm glibc gcc-libs ncurses libcap)
backup=('etc/zhcon.conf')
install=zhcon.install
source=(http://downloads.sourceforge.net/zhcon/zhcon-0.2.5.tar.gz
        http://downloads.sourceforge.net/zhcon/zhcon-0.2.5-to-$pkgver.diff.gz
        ascii.kbmode.patch
        gcc4.3.patch
        inputserver.fullcomma.patch
        kernel-headers.2.6.26.patch
        makefile.destdir.patch
        sysconfigdir.patch
        winime.amd64.patch
        winime.autoselect.patch
        winime.support.gbk.patch)
md5sums=('79e1c68aab8341e32129f61c1670baeb'
         '971f68507f9c48a6b5cbee4ba0c1e2a6'
         'e051479e26c98f860852ad11aa826be4'
         'b32d495256637f2ba99d9587097158f2'
         '9f23e130bd99d1dece51c9b4fb89ba7b'
         'a94810b078d9000a6a81bc22b8b053c9'
         'ec022eb5ad99b26de38ceb14face9b0c'
         '771173bd1bc3ac1aba103846431777e2'
         '86e25942c9c4b2468342a0e3f8401553'
         'c00f39666861b7d18a60212d2fcebf6c'
         '411b157c49a5c50cde24839ed32db4d9')

build() {
  cd $srcdir/zhcon-0.2.5
  patch -p1 < $srcdir/zhcon-0.2.5-to-0.2.6.diff

  # stolen from gentoo, and a little change
  patch -p1 < $srcdir/makefile.destdir.patch
  patch -p1 < $srcdir/gcc4.3.patch
  patch -p1 < $srcdir/kernel-headers.2.6.26.patch
  patch -p1 < $srcdir/sysconfigdir.patch
  patch -p1 < $srcdir/winime.amd64.patch

  # set keyboard mode to ascii, and restore it
  patch -p1 < $srcdir/ascii.kbmode.patch

  # support gbk in winime/native input method
  patch -p1 < $srcdir/winime.support.gbk.patch

  # autoselect when reached `mMaxCodes'
  patch -p1 < $srcdir/winime.autoselect.patch

  # er, er...
  patch -p1 < $srcdir/inputserver.fullcomma.patch

  ./configure --prefix=/usr --mandir=/usr/share/man

  make
}

package() {
  cd $srcdir/zhcon-0.2.5
  make -j1 DESTDIR=$pkgdir install
  sed -i -e '/unicon/ d' $pkgdir/etc/zhcon.conf
  install -D -m 755 tools/win2mb $pkgdir/usr/bin/win2mb
}

# vim: ft=sh ts=2 sw=2 et:
