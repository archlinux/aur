# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: josephgbr, Lara Maia

pkgname=lib32-ladspa
pkgver=1.13
pkgrel=5
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA) (32 bit)"
arch=("x86_64")
license=('LGPL')
url="http://www.ladspa.org/"
depends=('lib32-gcc-libs' "${pkgname#*-}=$pkgver")
makedepends=('gcc-multilib')
source=("http://www.ladspa.org/download/${pkgname#*-}_sdk_$pkgver.tgz"
        'hardcode-path.patch'
        'fix-lib32-makefile.patch')
sha256sums=('b5ed3f4f253a0f6c1b7a1f4b8cf62376ca9f51d999650dd822650c43852d306b'
            '48f438b4d688038a3e7216dd48500447b783b4f4c9ba8de5ee401f8b09b4ffd8'
            '998a18030ca3cf2e24a0aae0e7abc53cae1ae2a520c7c92aedc018a60e8251cb')

prepare() {
  cd ${pkgname#*-}_sdk/src

  # Set lib32 needs in search.c and makefile
  patch -Np1 < ../../hardcode-path.patch
  patch -Np1 < ../../fix-lib32-makefile.patch
}

build() {
  make -C ${pkgname#*-}_sdk/src targets
}

package() {
  cd ${pkgname#*-}_sdk/src

  make INSTALL_PLUGINS_DIR="$pkgdir"/usr/lib32/${pkgname#*-}/ \
       INSTALL_INCLUDE_DIR="$pkgdir"/usr/include/ \
       INSTALL_BINARY_DIR="$pkgdir"/usr/bin/ install

  rm -rf "$pkgdir"/usr/{bin,include}
}
