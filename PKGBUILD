# Maintainer: David Runge <dvzrv@archlinux.org>

_name=neovim-scnvim
pkgname=neovim-scnvim-git
pkgver=r374.cb8c66b
pkgrel=1
pkgdesc="Neovim frontend for SuperCollider"
arch=('any')
url="https://github.com/dvzrv/scnvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim' 'supercollider')
makedepends=('cmake' 'git')
optdepends=('pandoc: for rendering help files')
conflicts=('neovim-scnvim')
provides=('neovim-scnvim')
source=("${pkgname}::git+https://github.com/dvzrv/scnvim#branch=install_system_wide")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_DOCDIR="/share/doc/${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install -C build
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
