# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor dorphell <dorphell@archlinux.org>
# Contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=cdcd
pkgver=0.6.6
pkgrel=9
pkgdesc="A commandline cd-player"
arch=('x86_64')
depends=('libcdaudio' 'readline')
url="http://libcdaudio.sourceforge.net/"
license=('GPL2')
source=("http://downloads.sourceforge.net/libcdaudio/$pkgname-$pkgver.tar.gz"
        "cdcd-0.6.6-x86_64.patch")
md5sums=('dc17f2e275c7214cb693f6abb50f29fb'
         '7c39f01408fc084e2c62da4da324370e')

build() {
  cd "$srcdir/$pkgname-$pkgver" 

  if [[ "$CARCH" == "x86_64" ]]; then
    patch -Np1 -i "$srcdir/cdcd-0.6.6-$CARCH.patch"
  fi


  sed -i 's/(CPPFunction \*)/(rl_completion_func_t \*)/' cmd_cdcd.c

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  mv "$pkgdir/usr/info" "$pkgdir/usr/share/"
  mv "$pkgdir/usr/man/" "$pkgdir/usr/share/"
  rm "$pkgdir/usr/share/dir"

  install -dm755 "$pkgdir/usr/bin" "$pkgdir/usr/share"
}
