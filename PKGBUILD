# Maintainer:
# Contributor: Army
# Contributor: aksr <aksr at t-com dot me>

pkgname=9base-git
pkgver=20190913.117
pkgrel=1
pkgdesc="Port of various original Plan9 tools to unix"
arch=('i686' 'x86_64')
url="https://tools.suckless.org/9base"
license=('custom')
depends=(sh)
makedepends=('git')
provides=('9base' 'plan9')
conflicts=('9base')
source=("$pkgname::git+https://git.suckless.org/9base" 9 plan9.sh)
md5sums=('SKIP'
         'ae7108b9f26bed388e9055f35eef2986'
         '0fa02cbcca0bc4584d7378f13ec1a1de')
sha256sums=('SKIP'
            '1da13555dc798787a73bfdfe44ded76bc007b8a0ab5fd5f8fea88cd4ae870b1e'
            'e81ac6d0ebe2dd0237d570145a6f5a43d409b92a6b334107a4b97a68e00258df')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
  cd "$srcdir/$pkgname"

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  case $CARCH in
    i686) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = 386#' config.mk ;;
    x86_64) sed -i 's#^OBJTYPE\s.*$#OBJTYPE = x86_64#' config.mk ;;
  esac

  sed -i 's#^PREFIX\s.*$#PREFIX = /opt/plan9#' config.mk
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
  install -Dm755 ../9 "$pkgdir/opt/plan9/bin/"
  install -Dm755 ../plan9.sh "$pkgdir/etc/profile.d/plan9.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

