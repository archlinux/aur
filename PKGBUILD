# Maintainer: duanluan <duanluan@outlook.com>

pkgname=keyviz-zh-bin
pkgver=2.1.0
pkgrel=2
_commit=6cf089956a3448583074538de2f89f1a12c2ceae
_srcdir="keyviz-${_commit}"
pkgdesc='Chinese-localized fork of Keyviz with Linux fixes'
arch=('x86_64')
url='https://github.com/duanluan/keyviz'
license=('GPL3')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'npm')
provides=('keyviz')
conflicts=('keyviz' 'keyviz-bin' 'keyviz-cn-bin')
options=('!strip')
source=(
  "${_srcdir}.tar.gz::https://codeload.github.com/duanluan/keyviz/tar.gz/6cf089956a3448583074538de2f89f1a12c2ceae"
)
sha256sums=(
  '32afe74c18096af2f7fbb0534567d995971e0a1b3779ea9da513d3e90e21831e'
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
