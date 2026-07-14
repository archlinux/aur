# Maintainer: RetrowaveHyena <retrowavehyena@gmail.com>
pkgname=cyberia-git
_owner=zutyosh
_repo=Cyberia
_host=git.gay
pkgver=0.2.8.r2.gdb64056
pkgrel=1
pkgdesc="Desktop companion for Resonite - chat, presence, worlds and status, no backend server required (main branch, built from source)"
arch=('x86_64')
url="https://${_host}/${_owner}/${_repo}"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'libsecret' 'openssl' 'hicolor-icon-theme')
makedepends=('git' 'rust' 'cargo' 'nodejs' 'npm' 'patchelf' 'pkgconf' 'file' 'desktop-file-utils')
provides=('cyberia')
conflicts=('cyberia' 'cyberia-bin')
source=("${_repo}::git+https://${_host}/${_owner}/${_repo}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_repo"
  # Newest reachable tag + commits since + short hash, e.g. 0.2.8.r4.gabc1234.
  # Falls back to a plain rN.gHASH form if the repo has no tags at all.
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-g/.g/' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_repo"
  npm ci
  cd src-tauri
  cargo fetch --locked
}

build() {
  cd "$_repo"
  export CFLAGS="-O2 -pipe -fno-plt"
  export CXXFLAGS="$CFLAGS"
  unset RUSTFLAGS
  npm run tauri build -- --no-bundle
}

package() {
  cd "$_repo"

  install -Dm755 "src-tauri/target/release/cyberia" "$pkgdir/usr/bin/cyberia"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/cyberia.desktop" <<-EOF
	[Desktop Entry]
	Type=Application
	Name=Cyberia
	Comment=Desktop companion for Resonite (main branch build)
	Exec=cyberia
	Icon=cyberia
	Categories=Network;InstantMessaging;Chat;
	Terminal=false
	StartupWMClass=cyberia
	EOF

  install -Dm644 RSN-logo-cyberia.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/cyberia.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
