# meson/ninja build() & package() taken from community/radare2
# Contributor: 0xAA <0xaa at dmg dot sx>
# Contributor: bratus <szczepaniak.bartek plus github at gmail dot com>
# Contributor: jjguti
pkgname=radare2-git
pkgver=5.6.7.r27627.7821ddb04b
pkgrel=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
arch=('i686' 'x86_64')
url="http://radare.org"
license=('GPL3' 'LGPL3')
makedepends=('git' 'meson')
depends=('capstone' 'lz4' 'file' 'libzip' 'xxhash' 'libuv')
provides=("radare2=${pkgver%.r*}")
conflicts=('radare2')

source=("$pkgname"::"git+https://github.com/radare/radare2.git")
md5sums=('SKIP')

pkgver () {
  cd ${pkgname}
  sed -nE '/^VERSION\ [0-9.]*(-git|)$/p' configure.acr|grep -o '[0-9.]*'|tr -d '\n'
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # this is actually needed to prevent linking against old system-wide r2 libs
  # you can comment this out, if you build in a clean environment
  export PKG_CONFIG_PATH="${srcdir}/${pkgname}/pkgcfg:${PKG_CONFIG_PATH}"

  CFLAGS="${CFLAGS//-fPIE -pie}"

  cd ${srcdir}/${pkgname}
  touch libr/config.mk
  arch-meson build \
    -D use_sys_capstone=true \
    -D use_sys_magic=true \
    -D use_sys_zip=true \
    -D use_sys_zlib=true \
    -D use_sys_lz4=true \
    -D use_sys_xxhash=true \
    -D use_sys_openssl=true \
    -D use_libuv=true \
    -D use_webui=true
  ninja -C build
}

package() {
  cd ${srcdir}/${pkgname}
  DESTDIR="${pkgdir}" ninja -C build install
  cp -r doc/* "${pkgdir}/usr/share/doc/radare2"
  ln -s /usr/share/man/man1/radare2.1.gz "${pkgdir}/usr/share/man/man1/r2.1.gz"
}
