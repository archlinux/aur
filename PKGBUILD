# Maintainer: Christoph Brandau <c.brandau91@googlemail.com>

pkgname=gitty-desktop
pkgver=2026.8.2
pkgrel=1
pkgdesc="A lightweight, modern Git client built with Tauri"
arch=('x86_64')
url="https://git.cbsk-tech.de/Christoph/GitLite"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'git' 'hicolor-icon-theme' 'libappindicator-gtk3' 'librsvg' 'xdotool')
makedepends=('rust' 'nodejs' 'npm')
options=('!lto' '!debug')

_tag=2026.8.2
source=("gitty-desktop-${pkgver}.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('af315fcd570b7b1719464cb75269e8d75859101633be1a094aa6f6813059bcdd')

prepare() {
  cd "$srcdir/gitlite"

  # Keep application metadata aligned even when a release tag contains
  # leading zeroes that npm normalizes (for example 2026.7.01 -> 2026.7.1).
  npm version "$pkgver" --no-git-tag-version --allow-same-version
  RELEASE_VERSION="$pkgver" node -e "const fs=require('fs'); const path='src-tauri/tauri.conf.json'; const config=JSON.parse(fs.readFileSync(path,'utf8')); config.version=process.env.RELEASE_VERSION; fs.writeFileSync(path,JSON.stringify(config,null,2)+'\n');"
}

build() {
  cd "$srcdir/gitlite"

  # Keep the large Rust release build within the Arch runner's memory limit.
  export CARGO_BUILD_JOBS=1
  export CARGO_PROFILE_RELEASE_OPT_LEVEL=2
  export CARGO_PROFILE_RELEASE_LTO=false
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=8
  export CARGO_PROFILE_RELEASE_DEBUG=0

  npm ci
  npm run tauri -- build --no-bundle
}

package() {
  cd "$srcdir/gitlite"

  install -Dm755 "src-tauri/target/release/gitty" "$pkgdir/usr/bin/gitty-desktop"

  install -Dm644 "src-tauri/icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/gitty-desktop.png"
  install -Dm644 "src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/gitty-desktop.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/gitty-desktop.png"
  install -Dm644 "src-tauri/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/gitty-desktop.png"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/gitty-desktop.desktop" <<-EOF
	[Desktop Entry]
	Type=Application
	Name=Gitty
	Comment=$pkgdesc
	Exec=gitty-desktop
	Icon=gitty-desktop
	Terminal=false
	Categories=Development;RevisionControl;
	StartupWMClass=gitty
	EOF

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
