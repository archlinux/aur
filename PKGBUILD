# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Thomas Berryhill (oats) <tb01110100 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=aria2-git
pkgver=1.37.0.r38.gdc89cd3d
pkgrel=1
pkgdesc='Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink'
arch=('i686' 'x86_64')
url='https://aria2.github.io'
license=('GPL-2.0-only')
depends=('gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2')
makedepends=('git')
checkdepends=('cppunit')
conflicts=('aria2')
provides=("aria2=${pkgver%.*}")
source=("$pkgname::git+https://github.com/aria2/aria2.git"
         nettle-4.patch)
sha512sums=('SKIP'
            'b3c2133debdaf986568f5a2e96380a5d898074346d8a4cd9b2236d8c5c93f55a73e3db4545f17a759880e998058ad677d717cd3445ea43e91bd1b4966f7ff092')


pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/release.//'
}

prepare() {
  cd $pkgname
  patch -p1 -i ../nettle-4.patch
  autoreconf -i
}

build() {
  cd $pkgname

  ./configure \
    --prefix=/usr \
    --enable-libaria2 \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

check() {
  cd $pkgname
  # https://github.com/aria2/aria2/issues/1476
  # Upstream states "I don't see any issues with aria2 code."
  make check || echo "Ignoring test failures"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  # add bash completion
  install -d "$pkgdir"/usr/share/bash-completion/completions
  install -m644 "$pkgdir"/usr/share/doc/aria2/bash_completion/aria2c \
    "$pkgdir"/usr/share/bash-completion/completions
  rm -rf "$pkgdir"/usr/share/doc/aria2/bash_completion
}
