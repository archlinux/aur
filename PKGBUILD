# Maintainer: hypevhs <hackgammavision at gmail dot com>

pkgname=de4dot-git
_pkgname=de4dot
pkgver=2090.b7d5728f
pkgrel=1
pkgdesc=".NET deobfuscator and unpacker."
arch=("any")
url="https://github.com/0xd4d/de4dot"
license=("GPL-3.0")
makedepends=(git mono-msbuild)
depends=(mono)
source=("git+https://github.com/0xd4d/${_pkgname}" "de4dot.sh" "de4dot-x64.sh")
sha256sums=("SKIP" "835243121454a7a525cb0a1a90c6fef84003cf0a52cb73445440b2766b7c2114" "2ce5e81ecf633c3fd4b310b19cfa8250001110fbb23cfc1d6062822abb25b5d7")

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  msbuild -v:m -restore -t:Build -p:Configuration=Release -p:TargetFramework=net45 de4dot.netframework.sln
  find Release/net45 -iname '*.pdb' -or -iname '*.xml' -or -iname 'Test.Rename.*' -delete
}

package() {
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -R ${_pkgname}/Release/net45/* "${pkgdir}/usr/share/${_pkgname}"
  install -Dm0755 "${srcdir}/de4dot.sh" "${pkgdir}/usr/share/${_pkgname}/de4dot.sh"
  install -Dm0755 "${srcdir}/de4dot-x64.sh" "${pkgdir}/usr/share/${_pkgname}/de4dot-x64.sh"
  # For now, symlink both x32 and x64 scripts
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/${_pkgname}/de4dot.sh" "${pkgdir}/usr/bin/de4dot"
  ln -s "/usr/share/${_pkgname}/de4dot-x64.sh" "${pkgdir}/usr/bin/de4dot-x64"
}
