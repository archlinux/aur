# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=fsthost
pkgver=1.6.2
pkgrel=2
pkgdesc='A linux VST host using winelib'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/fsthost/'
license=('GPL')
depends=('jack' 'libxml2')

_GTK=3 # Use gtk version 3 as default, 0 mean
[[ $_GTK > 0 ]] && \
depends+=("gtk${_GTK}")

if [[ $CARCH = 'x86_64' ]]; then
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  _arch=32
  depends+=(${depends[@]/#/lib32-})
fi

depends+=('wine' 'perl-xml-libxml')

source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('0769970ea13f3e6b860944db3803d339')

build() {
  cd $pkgname-$pkgver
  make LIB32_INST_PATH=/usr/lib$_arch \
       LIB64_INST_PATH=/usr/lib \
       LASH_EXISTS='no' \
       GTK=${_GTK}
}

package() {
  cd $pkgname-$pkgver
  make LIB32_INST_PATH=/usr/lib$_arch \
       LIB64_INST_PATH=/usr/lib \
       MANDIR=/usr/share/man/man1 \
       DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
