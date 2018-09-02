# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jiří Procházka <ojirio@gmail.com>

_pkgname=ir-lv2
pkgname="${_pkgname}-git"
pkgver=1.3.2.r20.a523bba
pkgrel=1
pkgdesc="Real-time signal convolver esp. suited for impulse response reverb effects"
arch=('i686' 'x86_64')
url="http://tomszilagyi.github.io/plugins/ir.lv2/"
license=('GPL2')
depends=('gtk2>=2.16' 'libsamplerate' 'zita-convolver')
provides=('ir.lv2' "${_pkgname}" 'lv2-ir-git')
conflicts=('ir.lv2' "${_pkgname}" 'lv2-ir' 'lv2-ir-git')
groups=('lv2-plugins')
makedepends=('git' 'lv2')
source=("${_pkgname}::git+https://github.com/tomszilagyi/ir.lv2")
md5sums=('SKIP')
changelog=ChangeLog

pkgver() {
  cd "${srcdir}/${_pkgname}"

  version="$(awk -F'"' '/S1 "version/ {print $2}' ir_gui.cc)"
  echo ${version#version}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CPPFLAGS="$CXXFLAGS -Wno-parentheses"
  make
  make convert4chan
}

package() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX="$pkgdir/usr" install
  install -Dm755 convert4chan "$pkgdir/usr/bin/convert4chan"
  install -Dm644 README.md sshot.png -t "${pkgdir}"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
