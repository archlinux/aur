# Contributor: Army
# Maintainer: aksr <aksr at t-com dot me>
pkgname=9base-git
pkgver=20160912.113
pkgrel=1
pkgdesc="A port of various original Plan 9 tools for Unix, based on plan9port."
arch=('i686' 'x86_64')
url="http://tools.suckless.org/9base"
license=('custom')
depends=(sh)
makedepends=('git')
provides=('9base')
source=("$pkgname::git+http://git.suckless.org/9base" 9 9base.sh)
md5sums=('SKIP'
         '5615d299503a7e6e69314a876f920b0e'
         'fb17bab0503b05f830cf75cd456e4ed3')
sha1sums=('SKIP'
          '2b4983bdcb41bbf6ad6d0a206373e1fdcdfc3810'
          'ce33613fb2b5e984d01ecc4fd4c4ac75c4563a5f')
sha256sums=('SKIP'
            'e64eb7dabc2ffc1118495b755ca528c2657101cf78617fd612b2d859755ef482'
            '98bb1419c74703c9a269476eb01415627896fe2d2af2adb97e22b5e1ae15677c')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
  cd "$srcdir/$pkgname"

  case $CARCH in
    i686) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = 386#' config.mk ;;
    x86_64) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = x86_64#' config.mk ;;
  esac

  sed -i 's#^PREFIX\s.*$#PREFIX = /opt/9base#' config.mk
  sed -i 's#^CFLAGS\s*+=#CFLAGS += -DPLAN9PORT #' config.mk

  # Force dynamic linking.  Several of the programs in 9base won't work
  # when statically linked against the latest glibc.
  sed -i '/-static/d' config.mk
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -m755 ../9 "$pkgdir/opt/9base/bin/"
  install -Dm755 ../9base.sh "$pkgdir/etc/profile.d/9base.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/9base/LICENSE"
}

