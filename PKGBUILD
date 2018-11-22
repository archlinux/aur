# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=gtk-engine-murrine-git
pkgver=0.98.2.r408.f96e446
pkgrel=1
pkgdesc="The marvelous gtk2 cairo engine (development version)"
arch=('i686' 'x86_64')
url="http://cimitan.com/murrine/"
license=('LGPL3')
depends=('gtk2')
makedepends=('git' 'intltool')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("${pkgname%-*}"::"git+https://github.com/GNOME/murrine.git"
        "fix-crasher.patch")
sha256sums=('SKIP'
            'e33f76ea23e38eecd2921300c7c01ff06ca33f63b9c7810d83d95e47681fe7da')

pkgver() {
  cd "${pkgname%-*}"

  _ver=$(grep AC_INIT configure.ac | sed 's/[^0-9.]//g')
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "$_ver.r%s.%s" "$_rev" "$_hash"
}

prepare() {
  patch -d "${pkgname%-*}" -Nup1 < fix-crasher.patch
}

build() {
  cd "${pkgname%-*}"

  intltoolize -c
  autoreconf -i
  ./configure --prefix=/usr --enable-animation --enable-animationrtl
  make
}

package() {
  make -C "${pkgname%-*}" DESTDIR="$pkgdir" install
}
