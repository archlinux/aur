# Maintainer: Eli Fereira <eli@fereira.net>

pkgname=colibri-social-beta
pkgver=0.6.0_spaces.38
pkgrel=1
pkgdesc="Call, chat, and hang out on a platform built for you! (spaces version)"
url="https://github.com/colibri-social/colibri.social"
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v${pkgver//_/-}"
arch=('x86_64')
license=('MIT')
options=('!lto')
conflicts=(
  'colibri-social'
  'colibri-social-beta-bin'
)
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'cairo'
  'glib2'
  'gdk-pixbuf2'
  'hicolor-icon-theme'
  'nspr'
  'nss'
  'alsa-lib'
)
makedepends=(
  'nodejs'
  'pnpm'
  'rust'
  'cargo'
)
source=(
  "${pkgname}-${pkgver//_/-}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
  "LICENSE_$pkgver::$_rawurl/LICENSE"
)
sha256sums=(
  'baedcb10aafce6c6c71445f75f512e73284716f5c6ee4ed70dae5020b7ce463a'
  'SKIP'
)

prepare() {
  cd "${srcdir}/colibri.social-${pkgver//_/-}"

  # Make sure version in tauri.conf.json matches the git tag version so artifact
  # outputs into a predictable place
  sed -i -E "s/^([[:space:]]*\"version\"[[:space:]]*:[[:space:]]*)\"[^\"]*\"/\1\"${pkgver//_/-}\"/" \
    packages/wrapper/src-tauri/tauri.conf.json
}

build() {
  cd "${srcdir}/colibri.social-${pkgver//_/-}"

  # Use sharp's prebuilt binaries instead of compiling against a globally
  # installed libvips (which would require node-addon-api and libvips headers)
  SHARP_IGNORE_GLOBAL_LIBVIPS=1 pnpm install --frozen-lockfile
  pnpm --filter @colibri-social/wrapper tauri build --bundles deb --no-sign
}

package() {
  cp -a -- "${srcdir}/colibri.social-${pkgver//_/-}/packages/wrapper/src-tauri/target/release/bundle/deb/Colibri Social_${pkgver//_/-}_amd64/data/." "${pkgdir}/"

  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  # Disable autoupdates
  sed -i 's/Exec=colibri-social/Exec=colibri-social --no-update-check/' "${pkgdir}/usr/share/applications/Colibri Social.desktop"
}
