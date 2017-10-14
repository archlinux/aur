# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libctru
pkgver=1.4.0
_pkgverexamples=20170714
pkgrel=1
pkgdesc="Library for Nintendo 3DS (CTR) homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: zlib')
depends=('devkitarm')
source=($pkgname-$pkgver.tar.gz::"https://github.com/smealum/ctrulib/archive/v$pkgver.tar.gz"
        "https://github.com/devkitPro/3ds-examples/releases/download/v$_pkgverexamples/3ds-examples-$_pkgverexamples.tar.bz2")
sha256sums=('2deeca1f4d9a2050b848958faec46617b854fdcf36c509fe8e3323f242e95141'
            '533dcf4ee6e7c0117e04ad30fe8436d19df786915ff6f3ade27bc9cad6924bde')
noextract=("3ds-examples-$_pkgverexamples.tar.bz2")
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkitarm.sh

  make -C ctrulib-$pkgver/libctru
}

package() {
  cd ctrulib-$pkgver

  export DEVKITPRO="$pkgdir/opt/devkitpro"
  make -C libctru install

  # examples
  install -d "$DEVKITPRO"/examples/3ds
  bsdtar xf ../3ds-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/3ds
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  sed '/# License/,$!d' README.md > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
