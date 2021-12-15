# Maintainer: 0b100100 <0b100100 at protonmail dot ch>

pkgname=msieve-svn
pkgver=1.54.r1043
pkgrel=1
pkgdesc='Library for factoring large integers'
url='https://sourceforge.net/projects/msieve/'
license=('custom')
arch=('x86_64')
depends=('zlib' 'gmp-ecm')
makedepends=('subversion')
conflicts=('msieve')
source=("${pkgname%-svn}::svn+svn://svn.code.sf.net/p/msieve/code/trunk/")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-svn}"
  local ver="$(egrep -m 1 -o "[0-9]+.[0-9]+:" Changes)"
  local rev="$(svnversion)"
  printf "%s.r%s" "${ver%:}" "${rev//[[:alpha:]]}"
}

prepare() {
  cd "${pkgname%-svn}"
  sed \
    -e 's/^CFLAGS =/CFLAGS +=/' \
    -i Makefile
}

build() {
  cd "${pkgname%-svn}"
  CFLAGS+=' -fopenmp'
  make all ECM=1
}

package() {
  cd "${pkgname%-svn}"
  install -Dm755 msieve -t "$pkgdir/usr/bin/"
  install -Dm644 Readme -t "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/doc/$pkgname/Readme "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
