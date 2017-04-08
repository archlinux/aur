# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=cbitcoin-git
pkgver=20150416
pkgrel=1
pkgdesc="A low-level bitcoin library written in standard C"
arch=('i686' 'x86_64')
depends=()
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config')
# groups=('libbitcoin')
url="https://github.com/MatthewLM/cbitcoin"
license=('MIT')
source=(git+https://github.com/MatthewLM/cbitcoin)
sha256sums=('SKIP')
provides=('cbitcoin')
conflicts=('cbitcoin')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/cbitcoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/cbitcoin \
    --localstatedir=/var/lib/cbitcoin \
    --with-gnu-ld
  make -j$(nproc)
}

check() {
  cd ${pkgname%-git}

  msg2 'Testing...'
  make -j$(nproc) test
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/cbitcoin"

  msg2 'Installing...'
  for header in include/*; do
      install -Dm 644 $header -t "$pkgdir/usr/include"
  done
  for lib in bin/libcbitcoin*; do
      install -Dm 755 $lib -t "$pkgdir/usr/lib"
  done
}
