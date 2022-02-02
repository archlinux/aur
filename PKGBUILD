# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im-git
pkgver=latest
pkgrel=3
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/andmarti1424/sc-im'
depends=(libxml2 libzip)
makedepends=(git)
optdepends=('libxlsxwriter: export to xlsx. Requires rebuild of sc-im'
            'gnuplot: create graphs')
license=('BSD')
conflicts=('scim-spreadsheet' 'sc-im')
source=('git+https://github.com/andmarti1424/sc-im'
        'arch.patch')
md5sums=('SKIP'
         '1fbfee20dfb2f3150bd9b20748a9cca1')

prepare() {
  cd "$srcdir/sc-im/src"
  # install things in the correct place for package managers
  patch < "$srcdir/arch.patch"
}

pkgver() {
  cd "$srcdir/sc-im/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/sc-im/src"
  CFLAGS+=' -fcommon '
  make
}

package() {
  cd "sc-im/src"
  make DESTDIR="$pkgdir" install

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
