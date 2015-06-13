# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=asignify-git
pkgver=20150220
pkgrel=1
pkgdesc="Yet another signify tool"
arch=('i686' 'x86_64')
depends=('openssl')
makedepends=('binutils'
             'gcc'
             'git'
             'make'
             'pkg-config')
url="https://github.com/vstakhov/asignify"
license=('BSD')
source=(git+https://github.com/vstakhov/asignify)
sha256sums=('SKIP')
provides=('asignify')
conflicts=('asignify')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 "Building..."
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/asignify \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/asignify \
    --localstatedir=/var/lib/asignify \
    --with-gnu-ld \
    --enable-openssl
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
