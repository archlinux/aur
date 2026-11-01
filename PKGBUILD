# Maintainer: Eli Fereira <eli@fereira.net>

pkgname=colibri-social
pkgver=0.5.1
pkgrel=1
pkgdesc="Call, chat, and hang out on a platform built for you!"
url="https://github.com/colibri-social/colibri.social"
arch=('x86_64')
license=('MIT')
options=('!lto')
conflicts=(
  'colibri-social-beta-bin'
  'colibri-social-beta'
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
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/%40colibri-social%2Fclient%40${pkgver}.tar.gz"
)
sha256sums=('daa06552db5f6904c5d265923cf45886355f96d612d00bcbc2ce676004f040f2')

_srcdir="colibri.social--colibri-social-client-${pkgver}"

prepare() {
  cd "${srcdir}/${_srcdir}"

  # Disable creation of updater artifacts
  sed -i -E 's/^([[:space:]]*"createUpdaterArtifacts"[[:space:]]*:[[:space:]]*)true/\1false/' \
    packages/wrapper/src-tauri/tauri.conf.json

  # The updater capability must go away when the `updater` Cargo feature is
  # disabled, otherwise tauri-build rejects the unknown permission.
  rm -f packages/wrapper/src-tauri/capabilities/updater.json
}

build() {
  cd "${srcdir}/${_srcdir}"

  # Use sharp's prebuilt binaries rather than compiling against a system
  # libvips, which may be an incompatible version.
  export SHARP_IGNORE_GLOBAL_LIBVIPS=1

  # Disables the Sentry SDK and, through scripts/tauri.mjs, builds the Rust
  # crate with --no-default-features: no telemetry and no built-in updater
  export DISABLE_SENTRY=1

  pnpm install --frozen-lockfile
  pnpm --filter @colibri-social/wrapper tauri build --bundles deb --no-sign
}

package() {
  cd "${srcdir}/${_srcdir}"

  cp -a -- "packages/wrapper/src-tauri/target/release/bundle/deb/Colibri Social_${pkgver//_/-}_amd64/data/." "${pkgdir}/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
