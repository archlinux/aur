# Maintainer: Junyi Xu <junyixu0@gmail.com>

pkgname=inkycap-git
_pkgname=inkycap
_appname=InkyCap
pkgver=26.9.14.r0.g1d18307
pkgrel=1
pkgdesc='Typst-based personal knowledge management app with linked notes for writing and academic research'
arch=('x86_64' 'aarch64')
url='https://inkycap.org'
license=('LiLiQ-P-1.1')
depends=(
  'bzip2'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'tinymist'
  'webkit2gtk-4.1'
  'xz'
  'zlib'
)
makedepends=(
  'cargo'
  'git'
  'nodejs'
  'npm'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=('git+https://codefloe.com/InkyCap/app.git')
sha256sums=('SKIP')

pkgver() {
  cd app
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd app

  export npm_config_cache="$srcdir/npm-cache"
  npm ci --no-audit --no-fund

  export RUSTUP_TOOLCHAIN=stable
  cd src-tauri
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Tauri requires the externalBin sidecar at build time; use Arch's tinymist
  # instead of the prebuilt binary upstream downloads from GitHub.
  mkdir -p binaries
  ln -sf /usr/bin/tinymist "binaries/inkycap-tinymist-$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd app

  export npm_config_cache="$srcdir/npm-cache"
  export RUSTUP_TOOLCHAIN=stable
  # --no-bundle builds only the binary; without a bundle type the app also
  # disables its self-upgrade feature, leaving updates to pacman.
  npm exec -- tauri build --no-bundle -- --frozen
}

package() {
  cd app

  install -Dm755 src-tauri/target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  # Command.sidecar() resolves the sidecar next to the main executable.
  ln -s tinymist "$pkgdir/usr/bin/$_pkgname-tinymist"

  # Tauri's resource_dir() on Linux is /usr/lib/<productName>.
  install -Dm644 -t "$pkgdir/usr/lib/$_appname/licenses" src-tauri/licenses/*

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Categories=Office;
Comment=Typst-based PKM with linked-notes for writing and academic research
Comment[fr]=PKM basé sur Typst, avec notes liées, pour l'écriture et la recherche académiques
Exec=$_pkgname
StartupWMClass=$_pkgname
Icon=$_pkgname
Name=$_appname
Terminal=false
Type=Application
EOF

  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  install -Dm644 src-tauri/icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 src-tauri/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE LICENSE.fr
}
