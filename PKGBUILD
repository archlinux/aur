# Maintainer: duanluan <duanluan@outlook.com>

pkgname=keyviz-zh
pkgver=2.1.0
pkgrel=3
_commit=abff97c6687e96736c63d4dad1c4bba06a1f8205
_srcdir="keyviz-${_commit}"
pkgdesc='Chinese-localized fork of Keyviz with Linux fixes'
arch=('x86_64')
url='https://github.com/duanluan/keyviz'
license=('GPL-3.0-only')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'npm')
provides=("keyviz-zh-bin=${pkgver}" 'keyviz')
conflicts=('keyviz' 'keyviz-bin' 'keyviz-cn-bin')
options=('!strip')
source=(
  "${_srcdir}.tar.gz::https://codeload.github.com/duanluan/keyviz/tar.gz/${_commit}"
)
sha256sums=(
  '06f4a2b8b8550a3dff8ade226e905d3abcaceaff8a2795faab73f19dfb7fb512'
)

build() {
  cd "${srcdir}/${_srcdir}"

  export npm_config_cache="${srcdir}/npm-cache"
  export CARGO_HOME="${srcdir}/cargo-home"

  npm ci --cache "${npm_config_cache}" --prefer-offline
  npm run tauri build -- --bundles deb
}

package() {
  local _builddir
  _builddir="$(mktemp -d)"
  trap 'rm -rf "${_builddir}"' EXIT

  bsdtar -C "${_builddir}" -xf "${srcdir}/${_srcdir}/src-tauri/target/release/bundle/deb/keyviz_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_builddir}/data.tar.gz"

  sed -i     -e 's/^Name=.*/Name=Keyviz 汉化版/'     -e 's/^Comment=.*/Comment=Keyviz 汉化版/'     -e 's/^Categories=.*/Categories=Utility;/'     "${pkgdir}/usr/share/applications/keyviz.desktop"
}
