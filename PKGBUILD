# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=pe-bear-git
pkgver=0.6.0.r4.g8fb024d
pkgrel=1
pkgdesc="Portable Executable reversing tool with a friendly GUI"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hshrzd.wordpress.com/pe-bear/"
license=(GPL2)
depends=(qt5-base)
makedepends=(git cmake)
provides=(pe-bear)
conflicts=(pe-bear)
source=("git+https://github.com/hasherezade/pe-bear.git"
        "git+https://github.com/capstone-engine/capstone.git"
        "git+https://github.com/hasherezade/bearparser.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd pe-bear
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd pe-bear
  git submodule init
  git config submodule.capstone.url "${srcdir}/capstone"
  git config submodule.bearparser.url "${srcdir}/bearparser"
  git submodule update

  [[ -d build ]] || mkdir build
}

build() {
  cd pe-bear/build
  cmake .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd pe-bear/build
  make DESTDIR="${pkgdir}" install
}