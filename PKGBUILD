# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: yuki-san <yuki.from.akita _at_ gmail.com>
# Contributor: TheRealOne78 <bajcsielias78 at gmail dot com>

pkgname=cmigemo-git
pkgver=1.2.r49.ge0f6145
pkgrel=1
pkgdesc="An implementation of Migemo in C"
arch=('i686' 'x86_64')
url="https://www.kaoriya.net/software/cmigemo/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'nkf')
provides=('cmigemo' 'libmigemo.so')
conflicts=('cmigemo')
source=(
  "${pkgname%-git}"::'git+https://github.com/koron/cmigemo.git'
  "https://skk-dev.github.io/dict/SKK-JISYO.L.gz")
sha256sums=('SKIP'
            '4236e1ae2ba667520922fc5aa406f77d8e30f3590421d34f41f46af641bb48aa')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/_/-/;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}/compile"
  sed -i "/CFLAGS_MIGEMO/c\CFLAGS_MIGEMO = ${CFLAGS} -fPIC" Make_gcc.mak
  sed -i "/LDFLAGS_MIGEMO/c\LDFLAGS_MIGEMO = ${LDFLAGS}" Make_gcc.mak
  sed -i '30s/$/ $(LDFLAGS_MIGEMO)/' Make_gcc.mak
  mv "$srcdir/SKK-JISYO.L" "$srcdir/${pkgname%-git}/dict"
}

# TODO : fix repeat compiles
# build() {
#   cd "$srcdir/${pkgname%-git}"
# 
#   ./configure --prefix=/usr
#   make gcc-all
# }

package() {
  cd "$srcdir/${pkgname%-git}"

  ./configure --prefix=/usr
  make prefix="$pkgdir"/usr docdir="$pkgdir"/usr/share/doc/cmigemo-git gcc-install
  install -d -m 755 "$pkgdir"/usr/share/licenses/cmigemo-git
  install -c -m 644 doc/LICENSE_j.txt "$pkgdir"/usr/share/licenses/cmigemo-git
}

# vim:set ts=2 sw=2 et:
