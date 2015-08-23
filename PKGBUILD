# Maintainer: saneki <s@neki.me>
pkgname=de4dot-git
_pkgname=de4dot
pkgver=1736.74408ae
pkgrel=1
pkgdesc=".NET deobfuscator and unpacker."
arch=("any")
url="https://github.com/0xd4d/de4dot"
license=("GPL-3.0")
makedepends=(git mono)
depends=(mono)
source=("git://github.com/0xd4d/${_pkgname}.git" "de4dot.sh" "de4dot-x64.sh")
sha256sums=("SKIP" "835243121454a7a525cb0a1a90c6fef84003cf0a52cb73445440b2766b7c2114" "2ce5e81ecf633c3fd4b310b19cfa8250001110fbb23cfc1d6062822abb25b5d7")

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  git submodule update --init --recursive
  xbuild /p:PostBuildEvent=
}

package() {
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -R ${_pkgname}/Debug/* "${pkgdir}/usr/share/${_pkgname}"
  install -Dm0755 "${srcdir}/de4dot.sh" "${pkgdir}/usr/share/${_pkgname}/de4dot.sh"
  install -Dm0755 "${srcdir}/de4dot-x64.sh" "${pkgdir}/usr/share/${_pkgname}/de4dot-x64.sh"
  # For now, symlink both x32 and x64 scripts
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/de4dot.sh" "${pkgdir}/usr/bin/de4dot"
  ln -s "/usr/share/${_pkgname}/de4dot-x64.sh" "${pkgdir}/usr/bin/de4dot-x64"
}
