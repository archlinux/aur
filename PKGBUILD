# Maintainer: envolution
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: jsteel <jsteel at vorx dot com>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fdclone
pkgver=3.01j
pkgrel=3
pkgdesc="Ncurses file and directory management tool"
arch=('i686' 'x86_64')
url="https://musashien.sourceforge.net/userdoc/fd.shtml"
license=('LicenseRef-custom')
depends=('ncurses')
makedepends=('sed')
optdepends=(unzip lha p7zip tar)
conflicts=('fd')
backup=("etc/$pkgname/fd2rc")
options=(!emptydirs)
source=(http://www.unixusers.net/src/fdclone/FD-$pkgver.tar.gz
  01_previous_changes.patch
  10_bts436823_remove_strip_makefile.patch
  30_makefilein_setting.patch
)
sha256sums=('fe5bb67eb670dcdb1f7368698641c928523e2269b9bee3d13b3b77565d22a121'
            'f26a79673d2b2d5c861c097cf64af588c8e1a6e52a8ed8b71f62a7ae44a9fa88'
            '7229d17d244afeb9a6eaff5fa3016c2e5814d6c90f59d126ecfe483b81b0369c'
            'e2094de049233b85fd419ba3989025fbed9b58869f4ea6dbe25fbd32c6de1f1b')
_pkgname=$(echo ${pkgname^^} | sed 's/CLONE//g')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 -i ../01_previous_changes.patch
  patch -Np1 -i ../10_bts436823_remove_strip_makefile.patch
  patch -Np1 -i ../30_makefilein_setting.patch
}

build() {
  export CFLAGS="${CFLAGS} -fstack-protector-strong -D_FORTIFY_SOURCE=2"
  export LDFLAGS="${LDFLAGS} -Wl,-z,relro,-z,now"
  cd $srcdir/$_pkgname-$pkgver
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" PREFIX=${pkgdir}/usr CONFDIR=/etc/$pkgname everything
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/share/man/man1
  make install PREFIX="$pkgdir"/usr DESTDIR="$pkgdir/" MANTOP=$pkgdir/usr/share/man JMANDIR=$pkgdir/usr/share/man/ja/man1
  install -m755 ./fd{,b,n}sh "$pkgdir"/usr/bin
  install -DTm644 ./LICENSES.eng "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -d "$pkgdir/etc/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r FAQ* README* TECHKNOW* ToAdmin* $pkgdir/usr/share/doc/$pkgname/

  # Update the config file
  sed -e '/^#DISPLAYMODE=/{s/^#//;s/0/6/;}' \
    -e '/^#ANSICOLOR=/{s/^#//;s/0/1/}' \
    -e '/^#LANGUAGE=/{s/^#//;s/""/en/}' \
    -e '/^#SORTTYPE=/{s/^#//;s/0/1/}' \
    _fdrc >"$pkgdir/etc/$pkgname/fd2rc"
}
# vim:set ts=2 sw=2 et:
