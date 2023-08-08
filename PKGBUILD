# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Brandon Niemczyk <maccorin@cfl.rr.com>

pkgname=frozen-bubble
pkgver=2.212
pkgrel=1
pkgdesc="A game in which you throw colorful bubbles and build groups to destroy the bubbles"
arch=(x86_64)
url="http://www.frozen-bubble.org"
license=(GPL2)
depends=(perl-sdl perl-ipc-system-simple perl-compress-bzip2 perl-file-which)
makedepends=(perl-file-slurp perl-locale-maketext-lexicon perl-module-build)
options=('!emptydirs')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/f/frozen-bubble/frozen-bubble_${pkgver}.orig.tar.gz
        fix-buffer-size-when-formatting-current-date.patch
        frozen-bubble.desktop)
md5sums=('fe65c8b4742fcad19bd1a5ea243255c7'
         '8b189952734ca0c6e94b0959994e54d1'
         '01b10b77ba6ad856f5c199121c582272')

prepare() {
  cd "$srcdir/Games-FrozenBubble-$pkgver"

  # https://bugzilla.redhat.com/show_bug.cgi?id=1541359
  patch -Np1 -i ../fix-buffer-size-when-formatting-current-date.patch

  sed -e 's|-Werror||' -i inc/My/Builder.pm
}

build() {
  cd "$srcdir/Games-FrozenBubble-$pkgver"
  unset CFLAGS
  # install module in vendor directories
  perl Build.PL installdirs=vendor
  perl Build
}

check() {
  cd "$srcdir/Games-FrozenBubble-$pkgver"
  perl Build test
}

package() {
  cd "$srcdir/Games-FrozenBubble-$pkgver"
  perl Build install destdir="$pkgdir"

  install -D -m644 share/icons/frozen-bubble-icon-64x64.png "$pkgdir/usr/share/pixmaps/frozen-bubble.png"
  install -D -m644 "$srcdir/frozen-bubble.desktop" "$pkgdir/usr/share/applications/frozen-bubble.desktop"
}
