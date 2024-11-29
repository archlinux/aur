# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Alexander Scharinger
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
pkgname=gecode
pkgver=6.2.0
pkgrel=3
pkgdesc="The Generic Constraint Development Environment"
arch=('i686' 'x86_64')
url="http://www.gecode.org"
license=('MIT')
# As of 2024-11-12, the dependencies are added by default. Comment them out if undesired.
depends=()
# If QT5 is installed, gecode will compile with Gecode Interactive Search
# Tool Support (GIST).
# If you want GIST support or if you want pacman to maintain a dependency,
# cause you have qt4 already installed, then you will have to add qt4 in the
# depends array.
depends+=('qt5-base')
# For support for trigonometric and transcendental float constraints you will
# need to use the following dependencies and additionaly add the directories to
# the arguments of the configure call in the build() function.
# For further inormation see section 2.6.2 of the Gecode documentation
# "Modeling and Programming with Gecode".
depends+=('mpfr' 'gmp')
source=("https://github.com/$pkgname/$pkgname/archive/release-$pkgver.tar.gz"
        "gcc-14-build-fix.patch::https://github.com/Gecode/gecode/commit/c810c96b1ce5d3692e93439f76c4fa7d3daf9fbb.patch"
        "fix-flatzinc-generation.patch::https://github.com/Gecode/gecode/pull/85.patch")
# MD5 sum can not be found anywhere on the webpage.
# Use the following shell command to generate and update the md5 sum.
# $ makepkg -g >> PKGBUILD
sha512sums=('a763127ba786df86b33f4be1b25226f51bd5d059ea336912e7bd3ec5c54c2fed93f2e5a662793688723495193a42204c0db440b19de8614414ebbe5d2d2d51ed'
            'dd42fb2a75a55c42e4c5a6d0fc70a2ba41d4a7e61d0a59e4d29a1a96ec3fdfb6680a66f239b6df4a3b418e051c8dd5e749009e4d5b61596b87df746d6d0fd7e7'
            '0c154d0a8c68f4072c7b9f210f8d2c5f707e35f97d9aab3edb972f5c5e770c6775b2558d39dcfaae87e8d355ff573b314d2eb78e22a3d54d8013ce1741dd8252')

prepare() {
  cd "gecode-release-$pkgver"
  patch -Np1 -i "$srcdir/gcc-14-build-fix.patch"
  rm -f gecode/flatzinc/parser.tab.hpp
  patch -Np1 -i "$srcdir/fix-flatzinc-generation.patch"
}

build() {
  mkdir -p build
  cd build
  ../"gecode-release-$pkgver"/configure --prefix=/usr --disable-examples
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include/examples/"
  install -m 644 -D ../"gecode-release-$pkgver"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
