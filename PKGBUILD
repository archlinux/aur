# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=fsthost
pkgver=1.6.3
pkgrel=1
pkgdesc='A linux VST host using winelib'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/fsthost/'
license=('GPL')
depends=('jack' 'libxml2')

_GTK=3 # Use gtk version 3 as default, 0 means no GUI
[[ $_GTK > 0 ]] && \
depends+=("gtk${_GTK}")

if [[ $CARCH = 'x86_64' ]]; then
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  _arch=32
  depends+=(${depends[@]/#/lib32-})
fi

depends+=('wine' 'perl-xml-libxml')

source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('04ccc778e4202a52ca78b32f7c05686d')

build() {
  cd $pkgname-$pkgver
  make LIBDIR64=/usr/lib \
       LASH_EXISTS='no' \
       GTK=${_GTK} \
       fsthost64

  if [[ $CARCH = 'x86_64' ]]; then
    make LIBDIR32=/usr/lib$_arch \
         LASH_EXISTS='no' \
         GTK=${_GTK} \
         fsthost32
  fi
}

package() {
  cd $pkgname-$pkgver
  make LIBDIR64=/usr/lib \
       MANDIR=/usr/share/man/man1 \
       DESTDIR="$pkgdir" fsthost64_install

  if [[ $CARCH = 'x86_64' ]]; then
    make LIBDIR32=/usr/lib$_arch \
         MANDIR=/usr/share/man/man1 \
         DESTDIR="$pkgdir" fsthost32_install
  fi
}

# vim:set ts=2 sw=2 et:
