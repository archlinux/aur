# Maintainer: Viachaslau Khalikin <viachaslavic at outlook dot com>
# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-opera-git
pkgver=r552.340f9e9
pkgrel=1
pkgdesc="libretro implementation of 4DO/libfreedo (3DO)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/opera-libretro"
license=('LicenseRef-Modified-LGPL-Non-Commercial')
groups=('libretro')
depends=(
  glibc
  libretro-core-info
)
makedepends=(
  git
)
source=("${url##*/}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${url##*/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${url##*/}"
}

package() {
  install -Dm 644 "${url##*/}"/opera_libretro.so -t "${pkgdir}"/usr/lib/libretro/

  # Extract the first multi-line C-style comment block which contains
  # the original FreeDO/4DO license terms
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '/\/\*/,/\*\//{p; /\*\//q}' "${url##*/}/libopera/opera_3do.c" | \
    sed '1d; $d; s/^  //' > "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}

# vim:set ft=sh ts=2 sw=2 et:
