# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Jiří Procházka <ojirio@gmail.com>

_pkgname=ir-lv2
pkgname="${_pkgname}-git"
pkgver=1.3.2.r17.af1f8ab
pkgrel=3
pkgdesc="Real-time signal convolver esp. suited for impulse response reverb effects"
arch=('i686' 'x86_64')
url="https://github.com/Anchakor/ir.lv2"
license=('GPL')
depends=('gtk2>=2.16' 'libsamplerate' 'zita-convolver')
provides=('ir.lv2' "${_pkgname}" 'lv2-ir-git')
conflicts=('ir.lv2' "${_pkgname}" 'lv2-ir' 'lv2-ir-git')
groups=('lv2-plugins')
makedepends=('git' 'lv2')
source=("${_pkgname}::git+https://github.com/Anchakor/ir.lv2.git")
md5sums=('SKIP')
changelog=ChangeLog

pkgver() {
  cd "${srcdir}/${_pkgname}"

  version="$(awk -F'"' '/S1 "version/ {print $2}' ir_gui.cc)"
  echo ${version#version}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  cd "${srcdir}/${_pkgname}"

  make $MAKEFLAGS
  make convert4chan $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX="$pkgdir/usr" install
  install -Dm755 convert4chan "$pkgdir/usr/bin/convert4chan"
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
