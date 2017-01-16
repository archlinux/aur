# $Id$
# Maintainer: Evgeny Pokhilko <software@evpo.net>

pkgname=botan-stable
pkgver=1.10.13
pkgrel=1
pkgdesc='Crypto library written in C++'
license=('BSD')
arch=('x86_64' 'i686')
url='http://botan.randombit.net/'
depends=('gcc-libs' 'sh' 'asio')
makedepends=('python2' 'asio' 'git')
provides=('botan-stable')
validpgpkeys=('621DAF6411E1851C4CF9A2E16211EBF1EFBADFBC')
source=("https://botan.randombit.net/releases/Botan-${pkgver}.tgz"{,.asc})
sha256sums+=('23ec973d4b4a4fe04f490d409e08ac5638afe3aa09acd7f520daaff38ba19b90'
           '957e690cc1d17538c5315ea793723714a1b64b2f2563d4df5aaa9e161fa4190e')

prepare() {
  # Use python2 for the installation scripts
  find . -name '*.py' -exec sed -i -e '1s,python$,python2,' {} +
}

build() {
  cd Botan-${pkgver}
  python2 configure.py --prefix=/usr --enable-modules=cvc --with-openssl --with-gnump --with-bzip2 --with-zlib
  make
}

package() {
  cd Botan-${pkgver}
  make DESTDIR="$pkgdir/usr" install
  find "$pkgdir/usr/share/doc" -type f -exec chmod 0644 {} \;
  install -Dm644 doc/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
