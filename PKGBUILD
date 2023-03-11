# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=pe-bear
pkgver=0.6.5.2
pkgrel=1
pkgdesc="Portable Executable reversing tool with a friendly GUI"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hshrzd.wordpress.com/pe-bear/"
license=(GPL2)
depends=(qt5-base)
makedepends=(git cmake)
source=("git+https://github.com/hasherezade/pe-bear.git#tag=v${pkgver}"
        "git+https://github.com/capstone-engine/capstone.git"
        "git+https://github.com/hasherezade/bearparser.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd pe-bear
  git submodule init
  git config submodule.capstone.url "${srcdir}/capstone"
  git config submodule.bearparser.url "${srcdir}/bearparser"
  git -c protocol.file.allow=always submodule update

  [[ -d build ]] || mkdir build
}

build() {
  cd pe-bear/build
  cmake .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=None

  make
}

package() {
  cd pe-bear
  #make DESTDIR="${pkgdir}" install
  install -D build/pe-bear/PE-bear -t "${pkgdir}/usr/lib/pe-bear/"
  install -D SIG.txt               -t "${pkgdir}/usr/lib/pe-bear/"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/pe-bear/PE-bear "$pkgdir/usr/bin/pe-bear"

  install -D logo/main_ico.png "${pkgdir}/usr/share/pixmaps/pe-bear.png"
}