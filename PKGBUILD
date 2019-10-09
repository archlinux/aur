# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=lgi
_luaver=5.1
pkgname=("lua${_luaver//./}-${_pkgname}")
pkgver=0.9.2
pkgrel=2
pkgdesc='Lua 5.1 bindings for GObject using gobject-introspection library'
url='https://github.com/pavouk/lgi'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'glib2' 'libffi' "lua${_luaver//./}" 'gobject-introspection-runtime')
makedepends=('gobject-introspection')
conflicts=('luajit-lgi')
#optdepends=("lua${_luaver//./}-debugger: dump-typelib${_luaver} script")
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/pavouk/lgi/archive/${pkgver}.tar.gz)
sha512sums=('755a96b78530f42da6d4e2664f8e37cb07a356419e7e6448003c3f841c9d98ad18b851715d9eb203ea7eb27b13ec46223fa8a1c90a99fd12960ce85b0a695335')


prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i -e "s/^PKGS = .*/& lua${_luaver//./}/" lgi/Makefile
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make PREFIX=/usr LUA_VERSION=${_luaver}

  # requires non-existant lua51-debugger package
  #sed -i -e "1 s|\$|${_luaver}|" tools/dump-typelib.lua
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" PREFIX=/usr LUA_VERSION=${_luaver} install

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/*.lua -t "${pkgdir}/usr/share/${pkgname}/samples"
  install -Dm 644 samples/gtk-demo/* -t "${pkgdir}/usr/share/${pkgname}/samples/gtk-demo"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # requires non-existant lua51-debugger package
  #install -Dm 755 tools/dump-typelib.lua "${pkgdir}/usr/bin/dump-typelib${_luaver}"
}

# vim: ts=2 sw=2 et:
