# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=lib32-gtk-engine-murrine-git
pkgver=0.98.2.r406.2032a9b
pkgrel=1
pkgdesc="The marvelous gtk2 cairo engine (development version, 32 bit)"
arch=('x86_64')
url="http://cimitan.com/murrine/"
license=('LGPL')
depends=('lib32-gtk2' "${pkgname:6:-4}")
makedepends=('git' 'intltool' 'gcc-multilib')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("${pkgname%-*}"::"git+https://git.gnome.org/browse/murrine"
        "newer-automakes.patch")
sha256sums=('SKIP'
            'f36037693603ca450a8bc7e2c0ba7269af18640123b87fc6dd2eb11b3e423be3')

pkgver() {
  cd "${pkgname%-*}"

  _ver=$(grep AC_INIT configure.ac | sed 's/[^0-9.]//g')
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "$_ver.r%s.%s" "$_rev" "$_hash"
}

prepare() {
  cd "${pkgname%-*}"

  patch -Nup1 < ../newer-automakes.patch
}

build() {
  cd "${pkgname%-*}"

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./autogen.sh --prefix=/usr --libdir=/usr/lib32 --enable-animation --enable-animationrtl
  make
}

package() {
  make -C "${pkgname%-*}" DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/share
}
