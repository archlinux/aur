# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Maintainer : tsp <patrictroy at gmail dot com>

pkgname=rizin
pkgver=0.1.2
pkgrel=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
arch=('i686' 'x86_64')
url="https://rizin.re/"
license=('GPL3' 'LGPL3')
makedepends=('git' 'meson' 'ninja')
depends=('capstone' 'lz4' 'file' 'libzip' 'xxhash' 'libuv' 'tree-sitter')
provides=("rizin=${pkgver}")
conflicts=("rizin-git")
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/rizinorg/rizin/releases/download/v${pkgver}/rizin-src-${pkgver}.tar.xz")
sha256sums=('9e9529f302622806902928a05ed9dd8492d3278fa9c85a9ad05c032c1a91fec1')

build() {
  # this is actually needed to prevent linking against old system-wide r2 libs
  # you can comment this out, if you build in a clean environment
  export PKG_CONFIG_PATH="${srcdir}/${pkgname}/pkgcfg:${PKG_CONFIG_PATH}"

  cd ${srcdir}/${pkgname}-${pkgver}
  arch-meson build              \
    -D use_sys_capstone=true    \
    -D use_sys_magic=true       \
    -D use_sys_zip=true         \
    -D use_sys_zlib=true        \
    -D use_sys_lz4=true         \
    -D use_sys_xxhash=true      \
    -D use_sys_openssl=true     \
    -D use_sys_tree_sitter=true \
    -D use_libuv=true
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
  install -dm644 "${pkgdir}/usr/share/doc/rizin"
  cp -r doc/* "${pkgdir}/usr/share/doc/rizin"
  ln -s /usr/bin/rizin "${pkgdir}/usr/bin/rz"
}
