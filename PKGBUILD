# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Florian Maunier <mail@fmauneko.eu>

pkgname=libogc-git
pkgver=1.8.15.r0.g81ab510
pkgrel=1
pkgdesc="Library for Nintendo Gamecube/Wii homebrew development (development version)"
arch=('any')
url="http://www.devkitpro.org"
license=('custom')
depends=('devkitppc')
makedepends=('git')
conflicts=('libogc')
provides=('libogc')
optdepends=('libfat-ogc-git: fat filesystem access from homebrew'
            'devkitppc-portlibs: various ported libraries for homebrew use')
source=("git+https://github.com/devkitPro/libogc.git"
        "git+https://github.com/devkitPro/wii-examples.git"
        "git+https://github.com/devkitPro/gamecube-examples.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP')
options=(!strip staticlibs)

pkgver() {
  cd libogc
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  # set environment
  source /etc/profile.d/devkitppc.sh

  make -C libogc
}

package() {
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  make -C libogc install
  # examples
  install -d "$DEVKITPRO"/examples
  cp -rup wii-examples "$DEVKITPRO"/examples/wii
  cp -rup gamecube-examples "$DEVKITPRO"/examples/gamecube
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+ 
  # license
  install -Dm644 libogc/libogc_license.txt "$pkgdir"/usr/share/licenses/$pkgname/libogc_license.txt
}
