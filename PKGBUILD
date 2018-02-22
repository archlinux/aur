# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libnx-git
pkgver=1.0.0.r15.gff8a95b
pkgrel=1
pkgdesc="Library for Nintendo Switch (NX) homebrew development (development version)"
arch=('any')
url="http://devkitpro.org"
license=('custom: ISC')
depends=('devkita64')
conflicts=('libnx')
provides=('libnx')
source=("git+https://github.com/switchbrew/libnx.git"
        "git+https://github.com/switchbrew/switch-examples.git")
md5sums=('SKIP'
         'SKIP')
options=(!strip staticlibs)

pkgver() {
  cd libnx
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  # set environment
  source /etc/profile.d/devkita64.sh

  make -C libnx
}

package() {
  make -C libnx/nx dist-bin
  DEVKITPRO="$pkgdir/opt/devkitpro"
  install -d "$DEVKITPRO"/libnx
  bsdtar xf libnx/nx/libnx-*.tar.bz2 -C "$DEVKITPRO"/libnx
  # examples
  install -d "$DEVKITPRO"/examples
  cp -rup switch-examples "$DEVKITPRO"/examples/switch
  rm -rf "$DEVKITPRO"/examples/switch/.git
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+
  # license
  install -Dm644 libnx/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
