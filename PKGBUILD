# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnx
pkgver=1.0.0
_pkgverexamples=20180218
pkgrel=1
pkgdesc="Library for Nintendo Switch (NX) homebrew development"
arch=('any')
url="http://devkitpro.org"
license=('custom: ISC')
depends=('devkita64')
source=($pkgname-$pkgver.tar.gz::"https://github.com/switchbrew/libnx/archive/v$pkgver.tar.gz"
        "https://github.com/switchbrew/switch-examples/releases/download/v$_pkgverexamples/switch-examples-$_pkgverexamples.tar.bz2")
sha256sums=('14bca9efe9b3c1d46c2f442bf09eaac2bd415ac7d27a1dddcd1af2428574aecf'
            '24b00060974e70be6ebf85addb35feb22146b1fcce28fb16b9c378097462b97b')
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
