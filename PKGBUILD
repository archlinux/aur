# Maintainer: TwoFinger
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>

pkgname=ded
pkgver=20230122
_td_pkgver=20230122
pkgrel=1
pkgdesc="directory editor, file manager similar to Emacs dired"
arch=('i686' 'x86_64')
url="https://invisible-island.net/ded/ded.html"
license=('custom:BSD')
depends=('ncurses')
source=(https://invisible-island.net/archives/ded/$pkgname-$pkgver.tgz
        https://invisible-island.net/archives/ded/td_lib-$_td_pkgver.tgz)
sha256sums=(
            79e05d4befc07a030b22552e75fb78f856e5d8758f9d8172ea697859ef19b1d8
            1a2184958e774f8b3a09b08072974b29906e591278d7c4dc400c482ddc802f13
           )

build() {
  cd "$srcdir/td_lib-$_td_pkgver"
  ./configure --prefix=/usr
  make -j1

  cd "$srcdir/$pkgname-$pkgver"
  # side-by-side build seems broken. This worked for me:
  sed -i 's/if test "$cf_cv_tdlib_devel/if ! test "$cf_cv_tdlib_devel/' configure
  ./configure --prefix=/usr --mandir=/usr/share/man
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
