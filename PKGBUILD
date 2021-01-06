# Maintainer: tsp <patrictroy at gmail dot com>
pkgname=rizin-git
pkgver=0.1.0.r25295.4d5702df4
pkgrel=1
epoch=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
arch=('i686' 'x86_64')
url="https://rizin.re/"
license=('GPL3' 'LGPL3')
makedepends=('git' 'meson' 'ninja')
depends=('capstone' 'lz4' 'file' 'libzip' 'xxhash' 'libuv')
provides=('rizin')
source=("$pkgname"::"git://github.com/rizinorg/rizin.git"
	"sdb"::"git://github.com/rizinorg/sdb.git"
	"tree-sitter"::"git://github.com/tree-sitter/tree-sitter.git")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver () {
  cd ${pkgname}
  sed -nE '/^VERSION\ [0-9.]*(-git|)$/p' configure.acr|grep -o '[0-9.]*'|tr -d '\n'
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd ${pkgname}
  git config 'submodule.src/shlr/sdb.url' "${srcdir}/sdb"
  git config 'submodule.src/shlr/tree-sitter.url' "${srcdir}/tree-sitter"
  git submodule update --init --recursive --remote
}

build() {
  # this is actually needed to prevent linking against old system-wide r2 libs
  # you can comment this out, if you build in a clean environment
  export PKG_CONFIG_PATH="${srcdir}/${pkgname}/pkgcfg:${PKG_CONFIG_PATH}"

  cd ${srcdir}/${pkgname}
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
  cd ${srcdir}/${pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
  install -dm644 "${pkgdir}/usr/share/doc/rizin"
  cp -r doc/* "${pkgdir}/usr/share/doc/rizin"
  rm "${pkgdir}/usr/share/man/man7/esil.7"
}
