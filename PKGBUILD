# Maintainer: Joel Tony <github at jaytau dot com>

pkgname=wealthfolio-git
_pkgname=Wealthfolio
pkgver=3.9.2.r4698.g5a6f99684
pkgrel=1
pkgdesc="A beautiful, private, local-first personal finance tracker (main branch)"
arch=('x86_64')
url="https://wealthfolio.app/"
license=('AGPL-3.0-only')
depends=('bzip2' 'cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'xz')
makedepends=('cargo' 'git' 'mise')
optdepends=('org.freedesktop.secrets: secure storage for credentials and database keys')
provides=('wealthfolio')
conflicts=('wealthfolio' 'wealthfolio-bin')
options=('!lto' '!debug')
source=("wealthfolio::git+https://github.com/wealthfolio/wealthfolio.git#branch=main")
sha256sums=('SKIP')

_appver() {
  sed -n 's/^  "version": "\([^"]*\)".*/\1/p' apps/tauri/tauri.conf.json
}

pkgver() {
  cd wealthfolio
  local ver
  ver=$(_appver)
  [[ $ver ]] || { error "Can't read the app version"; return 1; }
  # pkgver can't hold hyphens; "pre" sorts before the release (3.0.0-beta.1).
  [[ $ver != *-* ]] || ver="${ver%%-*}pre"
  printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

build() {
  cd wealthfolio
  # Use the Node and pnpm versions the repo pins. With rustup, cargo also
  # follows rust-toolchain.toml.
  local node pnpm
  node=$(<.node-version)
  pnpm=$(sed -n 's/.*"packageManager": *"pnpm@\([^"+]*\).*/\1/p' package.json)
  [[ $node && $pnpm ]] || { error "Can't read the Node or pnpm version"; return 1; }
  mise install "node@$node" "pnpm@$pnpm"
  local tool_paths
  tool_paths=$(mise bin-paths "node@$node" "pnpm@$pnpm")
  [[ $tool_paths ]] || { error "Can't find the pinned Node and pnpm"; return 1; }
  PATH="${tool_paths//$'\n'/:}:$PATH"

  # Connect needs the public auth settings upstream documents for source builds.
  export CONNECT_AUTH_URL CONNECT_AUTH_PUBLISHABLE_KEY
  CONNECT_AUTH_URL=$(sed -n 's/^CONNECT_AUTH_URL=//p' docs/connect-source-builds.md)
  CONNECT_AUTH_PUBLISHABLE_KEY=$(sed -n 's/^CONNECT_AUTH_PUBLISHABLE_KEY=//p' docs/connect-source-builds.md)
  [[ $CONNECT_AUTH_URL && $CONNECT_AUTH_PUBLISHABLE_KEY ]] ||
    { error "Can't read the Connect settings"; return 1; }

  pnpm install --frozen-lockfile
  pnpm build:types
  # pacman manages updates: the in-app updater would install a .deb with dpkg,
  # so give it no update feed. Its artifacts also need a signing key.
  pnpm tauri build --bundles deb \
    --config '{"bundle":{"createUpdaterArtifacts":false},"plugins":{"updater":{"endpoints":[]}}}' \
    -- --locked
}

package() {
  cd wealthfolio
  # Bundle names carry only the app version, so pick this build's by name.
  local deb="target/release/bundle/deb/${_pkgname}_$(_appver)_amd64.deb"
  rm -rf "${srcdir}/deb"
  mkdir "${srcdir}/deb"
  cd "${srcdir}/deb"
  bsdtar -xf "${srcdir}/wealthfolio/${deb}" 'data.tar.*'
  bsdtar -xf data.tar.*

  # Lowercase names match wealthfolio-bin, so desktop shortcuts keep working.
  install -Dm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/wealthfolio"

  sed -e "s/^Exec=${_pkgname}/Exec=wealthfolio/" -e "s/^Icon=${_pkgname}/Icon=wealthfolio/" \
    "usr/share/applications/${_pkgname}.desktop" > wealthfolio.desktop
  install -Dm644 wealthfolio.desktop "${pkgdir}/usr/share/applications/wealthfolio.desktop"

  local icon
  for icon in usr/share/icons/hicolor/*/apps/"${_pkgname}".png; do
    install -Dm644 "$icon" "${pkgdir}/${icon%/*}/wealthfolio.png"
  done
}
