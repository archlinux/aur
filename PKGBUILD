# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=vilauncher
pkgver=1.1.0
pkgrel=1
pkgdesc="Community launcher that installs, updates and starts VIctory-based game projects, with your own game files"
arch=('x86_64')
url="https://github.com/dazacode/vilauncher"
license=('GPL-3.0-or-later')
# what the binary links (readelf -d)
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libgcc' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'pnpm')
# the launcher downloads and builds the projects with these
optdepends=('git: install and update projects'
            'cargo: build projects')
# !lto: makepkg's -flto=auto turns the C and assembly in ring into bitcode
# that links to nothing. !debug: the release profile strips symbols.
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ed01f670b8184b2332af4cd828d77376f9f81ffac15507ed1223cc53fb1b8b0')

prepare() {
  cd "${pkgname}-${pkgver}"

  pnpm install --frozen-lockfile

  export RUSTUP_TOOLCHAIN=stable
  cd src-tauri
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"

  # the web front end first, cargo builds it into the binary
  pnpm build

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd src-tauri
  # custom-protocol: serve the built front end, not the dev server (what
  # `tauri build` turns on)
  cargo build --release --frozen --features tauri/custom-protocol
}

package() {
  cd "${pkgname}-${pkgver}/src-tauri"
  local size

  # the same files, under the same names, as upstream's .deb
  install -Dm755 target/release/VILauncher -t "$pkgdir/usr/bin/"

  for size in 32x32:32x32 64x64:64x64 128x128:128x128 256x256:128x128@2x \
              512x512:icon; do
    install -Dm644 "icons/${size#*:}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size%%:*}/apps/VILauncher.png"
  done

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/VILauncher.desktop" << EOF
[Desktop Entry]
Categories=Game;
Comment=A community launcher for VIctory-based projects
Exec=VILauncher
StartupWMClass=VILauncher
Icon=VILauncher
Name=VILauncher
Terminal=false
Type=Application
EOF
}
