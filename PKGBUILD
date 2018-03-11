# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnx
pkgver=1.1.0
_pkgverexamples=20180302
pkgrel=1
pkgdesc="Library for Nintendo Switch (NX) homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: ISC')
depends=('devkita64')
source=($pkgname-$pkgver.tar.gz::"https://github.com/switchbrew/libnx/archive/v$pkgver.tar.gz"
        "https://github.com/switchbrew/switch-examples/releases/download/v$_pkgverexamples/switch-examples-$_pkgverexamples.tar.bz2")
sha256sums=('b61fa5cb4bed92877cd472731db46afe8e637502abdddbfab06a549541f31655'
            'a2028fe2dcf1217144ca0663b52109ebc5096263df6464a4e68dd5cc197e60cc')
noextract=("switch-examples-$_pkgverexamples.tar.bz2")
options=(!strip staticlibs)

build() {
  # set environment
  source /etc/profile.d/devkita64.sh

  make -C libnx-$pkgver
}

package() {
  cd libnx-$pkgver

  make -C nx dist-bin
  DEVKITPRO="$pkgdir/opt/devkitpro"
  install -d "$DEVKITPRO"/libnx
  bsdtar xf nx/libnx-$pkgver.tar.bz2 -C "$DEVKITPRO"/libnx
  # examples
  install -d "$DEVKITPRO"/examples/switch
  bsdtar xf ../switch-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/switch
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+
  # license
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
