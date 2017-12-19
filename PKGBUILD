# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: bobberb

pkgname=czmqpp-git
pkgver=20160505
pkgrel=1
pkgdesc="C++ wrapper for czmq"
arch=('i686' 'x86_64')
depends=('czmq' 'zeromq')
makedepends=('autoconf' 'gcc' 'git' 'make' 'pkg-config')
url="https://github.com/zeromq/czmqpp"
license=('LGPL3')
source=(git+https://github.com/zeromq/czmqpp)
sha256sums=('SKIP')
provides=('czmqpp')
conflicts=('czmqpp')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/czmqpp \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/czmqpp \
    --localstatedir=/var/lib/czmqpp \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
