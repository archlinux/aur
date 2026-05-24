# Maintainer: Rodericuss <minetalebr@gmail.com>
pkgname=yanvim-git
pkgver=0.12.2.r36107.g0c6c40ca07
pkgrel=1
pkgdesc="Neovim fork with built-in Helix-style selection-first editing paradigm"
arch=('x86_64' 'aarch64')
url="https://github.com/Rodericuss/Yet-another-neovim"
license=('Apache-2.0' 'Vim')
depends=(
  'neovim'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'lua51-lpeg'
  'lua51-mpack'
)
provides=('yanvim')
conflicts=('yanvim')
source=("${pkgname}::git+${url}.git#branch=stable")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local _tag
  _tag=$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./g')
  if [[ -n "$_tag" ]]; then
    echo "$_tag"
  else
    printf "0.12.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${pkgname}"
  cmake -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
  # Remove everything shared with neovim — only keep the yanvim binary
  rm -rf "${pkgdir}/usr/share" "${pkgdir}/usr/lib"
  rm -f "${pkgdir}/usr/bin/nvim"
}
