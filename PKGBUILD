# Maintainer: Brian Kanya <briankanya@gmail.com>

pkgname=blinko-desktop-git
_pkgname=blinko
pkgver=1.8.8.r2091.gb2586d03
pkgrel=1
pkgdesc='Blinko desktop client (AppImage built from git); connects to a self-hosted Blinko server'
arch=('x86_64')
url='https://github.com/blinkospace/blinko'
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'bun' 'rust' 'webkit2gtk-4.1' 'gtk3' 'librsvg' 'libayatana-appindicator'
             'xdotool' 'patchelf' 'openssl' 'curl' 'wget' 'file')
provides=('blinko-desktop')
conflicts=('blinko-desktop')
options=('!strip' '!debug' '!lto')
source=("$_pkgname::git+${url}.git"
        'blinko-desktop.sh'
        'blinko-desktop.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  local _ver
  _ver=$(grep -m1 '"version"' package.json | sed 's/.*"\([0-9][^"]*\)".*/\1/')
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  export PRISMA_SKIP_POSTINSTALL_GENERATE=true
  # linuxdeploy's bundled strip can't handle Arch's binaries
  export NO_STRIP=true
  export CARGO_HOME="$srcdir/cargo"

  bun install --frozen-lockfile

  cd app
  # createUpdaterArtifacts is disabled: it requires upstream's signing key
  bunx tauri build --bundles appimage \
    --config '{"bundle":{"createUpdaterArtifacts":false}}'
}

package() {
  local _bundle="$srcdir/$_pkgname/app/src-tauri/target/release/bundle/appimage"

  install -Dm755 "$_bundle/Blinko_${pkgver%%.r*}_amd64.AppImage" \
    "$pkgdir/opt/blinko-desktop/Blinko.AppImage"
  install -Dm755 blinko-desktop.sh "$pkgdir/usr/bin/blinko-desktop"
  install -Dm644 blinko-desktop.desktop "$pkgdir/usr/share/applications/blinko-desktop.desktop"
  install -Dm644 "$srcdir/$_pkgname/app/src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/blinko-desktop.png"
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
