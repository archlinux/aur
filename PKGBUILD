# Maintainer: Mateusz Paluszkiewicz <aifam96@gmail.com>

pkgname=neovim-gtk3-git
pkgver=r7.12b2ccc
pkgrel=1
pkgdesc="GTK GUI for NeoVIM - In Development!!"
arch=('i686' 'x86_64')
url="https://github.com/TheAifam5/NeoVIM-GTK3"
license=('MIT')
depends=('neovim' 'gtk3' 'vte3')
makedepends=('git' 'cmake' 'vte3')
conflicts=('neovim-gtk3')

_version=6276dcb0ae497766056b4c09ea75be1d76a8b679
source=("${pkgname}::git+${url}.git"
"neovim-gtk3.desktop"
"neovim.png")
md5sums=('SKIP' 'b248bdd29a34ce67a50f441bf50ee08a' 'caa63738dfe5ff52146c3b1893cc155c')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  mkdir -p "${pkgname}/build"
  cd "${pkgname}/build"

  cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..

  make ${MAKEFLAGS}
}

package() {
  cd "${pkgname}/build"

  # Install binary
  install -D -m755 ./neovim-gtk3 "${pkgdir}/usr/bin/nvim-gtk3"

  # Install MIT license
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install desktop files
  install -D -m644 ../../neovim-gtk3.desktop "${pkgdir}"/usr/share/applications/nvim-gtk3.desktop
  install -D -m644 ../../neovim.png "${pkgdir}"/usr/share/pixmaps/nvim-gtk3.png
}
