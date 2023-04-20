# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Olivier Ramonat <olivier at ramonat dot fr>

pkgname=gource-git
pkgver=0.54.r1.g5109bb9
pkgrel=1
pkgdesc="software version control visualization"
license=(GPL3)
arch=(i686 x86_64)
url="https://gource.io/"
depends=(sdl2 sdl2_image pcre2 glew boost-libs freetype2)
makedepends=(boost glm mesa git)
provides=(gource)
conflicts=(gource)
source=("${pkgname%-git}::git+https://github.com/acaudwell/Gource.git"
        "git+https://github.com/acaudwell/Core.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/gource.//'
}

prepare(){
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.src/core.url "${srcdir}/Core"
  git -c protocol.file.allow=always submodule update

  autoreconf -f -i
}

build() {
  cd "${pkgname%-git}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

