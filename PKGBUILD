# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Felix Kauselmann <licorn at gmail dot com>

pkgname=yacreader-poppler-git
pkgver=r3426.a425aef4
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection, using poppler for PDF"
arch=(x86_64)
url="https://www.yacreader.com/"
license=(GPL-3.0-only)
depends=(libunarr poppler-qt6 qt6-base qt6-multimedia qt6-declarative qt6-5compat
         glibc gcc-libs libglvnd hicolor-icon-theme)
makedepends=(git qt6-tools qt6-svg)
optdepends=('qt6-imageformats: Support for extra image formats'
            'qrencode: YACReaderLibrary server info qr codes')
provides=(yacreader)
conflicts=(yacreader)
source=("git+https://github.com/YACReader/yacreader.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "yacreader"
  #git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "yacreader"
  qmake6 CONFIG+="poppler unarr server_standalone"
  make
}

package() {
  cd "yacreader"
  make INSTALL_ROOT="$pkgdir" sub-YACReader-install_subtargets sub-YACReaderLibrary-install_subtargets
}
