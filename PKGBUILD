# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir.archlinux.org>

pkgname=lib32-muparser
pkgver=2.2.4
pkgrel=1
pkgdesc="Fast math parser library (32 bit)"
arch=('x86_64')
url="http://muparser.sourceforge.net"
license=('custom')
depends=('gcc-libs-multilib' 'muparser')
makedepends=('gcc-multilib')
source=(muparser_$pkgver.zip::"https://docs.google.com/uc?id=0BzuB-ydOOoduejdwdTQwcF9JLTA&export=download")
sha256sums=('fe4e207b9b5ee0e8ba155c3a7cc22ea6085313e0a17b7568a8a86eaa0d441431')

prepare() {
  chmod +x muparser_v${pkgver//./_}/configure
}

build() {
  cd muparser_v${pkgver//./_}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-samples
  make
}

package() {
  make -C muparser_v${pkgver//./_} DESTDIR="$pkgdir" install
  # remove stuff already present in muparser package
  rm -rf "$pkgdir"/usr/{include,share}
  # license
  install -d "$pkgdir"/usr/share/licenses
  ln -s muparser "$pkgdir"/usr/share/licenses/$pkgname
}
