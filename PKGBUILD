# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=lunarml-git
_pkgname=${pkgname%-git}
pkgver=v0.2.1.r4.g9e5351f
pkgrel=1
pkgdesc="A Standard ML compiler that produces Lua/JavaScript "
arch=(x86_64)
url="https://github.com/minoki/LunarML.git"
license=('MIT')
depends=('gmp' 'glibc')
makedepends=('git' 'make' 'mlton' 'lua')
provides=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/minoki/LunarML.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  make
}

# check is toooo long
# check() {
# 	cd ${pkgname}
#   make test-lua
#   make test-lua-continuations
#   make test-luajit
#   make test-nodejs
#   make test-nodejs-cps
# }

package() {
  cd ${pkgname}
  make install PREFIX=${pkgdir}/usr
  sed -e "s;__LIBDIR__;/usr/lib/lunarml;" < bin/lunarml-wrapper > ${pkgdir}/usr/bin/lunarml

  mkdir -p ${pkgdir}/usr/share/${_pkgname}/
  cp -r example ${pkgdir}/usr/share/${_pkgname}/

  install -Dm644 --target-directory=${pkgdir}/usr/share/licenses/${_pkgname} LICENSE
}

