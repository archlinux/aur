# Maintainer: RetrowaveHyena <retrowavehyena@gmail.com>
pkgname=cyberia-git
_owner=zutyosh
_repo=Cyberia
_host=git.gay
pkgver=0.2.9.r154.g75dcfa6
pkgrel=2
pkgdesc="Desktop companion for Resonite - chat, presence, worlds and status, no backend server required (main branch, built from source)"
arch=('x86_64')
url="https://${_host}/${_owner}/${_repo}"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'libayatana-appindicator' 'librsvg' 'libsecret' 'openssl' 'hicolor-icon-theme' 'org.freedesktop.secrets')
makedepends=('git' 'rust' 'nodejs' 'npm' 'pkgconf')
provides=("cyberia=${pkgver}")
conflicts=('cyberia' 'cyberia-bin')
options=('!lto')
source=("${_repo}::git+https://${_host}/${_owner}/${_repo}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_repo"
  # e.g. 0.2.9.r4.gabc1234; falls back to rN.gHASH if there are no tags
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$_repo"
  export npm_config_cache="$srcdir/npm-cache"
  export CARGO_HOME="$srcdir/cargo-home"
  npm ci
  cd src-tauri
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$_repo"
  export npm_config_cache="$srcdir/npm-cache"
  export CARGO_HOME="$srcdir/cargo-home"
  export CFLAGS="$CFLAGS -O2 -pipe -fno-plt"
  export CXXFLAGS="$CFLAGS"
  unset RUSTFLAGS
  npm run tauri build -- --no-bundle
}

package() {
  cd "$_repo"

  install -Dm755 "src-tauri/target/release/cyberia" "$pkgdir/usr/bin/cyberia"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/cyberia.desktop" <<EOF
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

  local _size
  for _size in 32x32 64x64 128x128; do
    install -Dm644 "src-tauri/icons/${_size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}/apps/cyberia.png"
  done
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/cyberia.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
