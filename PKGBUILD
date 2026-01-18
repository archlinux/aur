# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Thomas Scholtes <geigerzaehler@axiom.fm>

pkgname=radicle-desktop-git
pkgver=0.9.0.r20.gcf40e86a
pkgrel=1
pkgdesc='Radicle desktop app (Git version)'
arch=('x86_64')
url='https://radicle.xyz/desktop'
license=('GPL-3.0-only')
depends=(
  # See https://v2.tauri.app/distribute/aur/#building-from-source
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'jq'
  # See https://v2.tauri.app/distribute/aur/#building-from-source
  'openssl'
  'appmenu-gtk-module'
  'libappindicator-gtk3'
  'librsvg'
  'cargo'
  'cargo-tauri'
  'npm'
  'pnpm'
  'nodejs'
)
source=("radicle-desktop::git+https://seed.radicle.xyz/z4D5UCArafTzTQpDZNQRuqswh3ury.git")
sha256sums=('SKIP')

pkgver() {
	cd radicle-desktop
	git describe --long --tags | sed -r 's#releases/##; s/^v//; s/-rc\./rc/; s/[^-]*-g/r&/; s/-/./g'
}

prepare() {
  cd radicle-desktop

  # use cargo-tauri rather than downloading random blobs off Internet
  sed -r '\|@tauri-apps/cli|d' \
    -i package.json

  pnpm import
  pnpm install \
    --dangerously-allow-all-builds
  cargo fetch --locked --target "$(rustc --print host-tuple)"

  # disable ad-hoc pre-build script (we do it by hand in build(), see below)
  jq -n '{}
    | (.build.beforeBuildCommand |= "")
  ' \
    >tauri.conf.arch.json
}

build() {
  cd radicle-desktop

  pnpm run build -- --mode production
  cargo tauri build \
    --bundles deb \
    --config tauri.conf.arch.json
}

package() {
  depends+=(
    radicle-node
  )

  cd radicle-desktop
  cp -vdR --preserve=mode,timestamps \
    target/release/bundle/deb/*/data \
    -T "$pkgdir"
}
