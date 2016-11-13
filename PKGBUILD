# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Lieven <echo amFuK2F1ckBkYXMtbGFib3Iub3JnCg== | base64 -d>

pkgname=rp++-git
pkgver=1+11+g5f0841c
pkgrel=1
epoch=1
pkgdesc='Find ROP gadgets in PE/ELF/MACH-O x86/x64 binaries'
url='https://github.com/0vercl0k/rp'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('rp++')
conflicts=('rp++')
source=(${pkgname}::git+https://github.com/0vercl0k/rp)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'|sed -r 's|v?(.+)|\1|g'
}

prepare() {
  cd ${pkgname}
  mkdir build
  sed 's/-static//g' -i CMakeLists.txt
}

build() {
  cd ${pkgname}/build
  cmake ..
  make
}

check() {
  cd ${pkgname}/bin
  ./rp* -f bin_tests/elf-x86-bash-v4.1.5.1 --search-hexa="main"
}

package() {
  cd ${pkgname}
  install -Dm 755 bin/rp-lin-* "${pkgdir}/usr/bin/rp"
}

# vim: ts=2 sw=2 et:
