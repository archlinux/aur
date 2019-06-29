# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=redasm
pkgver=2.1.1
pkgrel=1
url="https://redasm.io/"
arch=(i686 x86_64)
pkgdesc="The OpenSource Disassembler"
license=(GPL3)
depends=(qt5-base)
makedepends=(git cmake)
source=("git+https://github.com/REDasmOrg/REDasm.git#tag=v$pkgver"
        "git+https://github.com/Dax89/QHexView.git"
        "git+https://github.com/aquynh/capstone.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd REDasm
  git submodule init
  git config submodule.widgets/QHexView.url "$srcdir/QHexView"
  git submodule update
  mkdir -p build

  cd LibREDasm
  git config submodule.depends/capstone.url "$srcdir/capstone"
  git submodule update
}

build() {
  cd REDasm/build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd REDasm/build
  install -D -m755 REDasm ${pkgdir}/usr/bin/REDasm
  install -D -m755 LibREDasm.so ${pkgdir}/usr/lib/LibREDasm.so
  install -D -m644 ../README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -D -m644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
