# Maintainer: jagrat7
pkgname=linux-wallpaper-engine-ux
_pkgname=linux-wallpaper-engine
pkgver=0.4.3
pkgrel=2
pkgdesc="Modern desktop GUI for linux-wallpaperengine"
arch=('x86_64')
url="https://github.com/jagrat7/linux-wallpaper-engine"
license=('MIT')
depends=('electron39' 'linux-wallpaperengine-git')
makedepends=('bun' 'nodejs' 'zip' 'imagemagick')
optdepends=(
  'xorg-xrandr: X11 display detection'
  'wlr-randr: wlroots Wayland display detection'
  'ffmpeg: video wallpaper support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6be75737950a01060566287adc94ad701964988971dd6d129ef980ef65e5a791')
options=('!debug')

prepare() {
  cd "$_pkgname-$pkgver"

  bun install --frozen-lockfile --ignore-scripts
}

build() {
  cd "$_pkgname-$pkgver"

  local electron_version
  local electron_zip_dir
  local electron_unpack_dir
  local forge_tmpdir

  electron_version="$(cat /usr/lib/electron39/version)"
  electron_zip_dir="$srcdir/electron-zip"
  electron_unpack_dir="$srcdir/electron-v$electron_version-linux-x64"
  forge_tmpdir="$srcdir/forge-tmp"

  [[ -d "$electron_unpack_dir" ]] && rm -rf "$electron_unpack_dir"
  [[ -d "$electron_zip_dir" ]] && rm -rf "$electron_zip_dir"

  mkdir -p "$electron_zip_dir"
  cp -a /usr/lib/electron39 "$electron_unpack_dir"
  chmod -R u+w "$electron_unpack_dir"

  (
    cd "$electron_unpack_dir"
    zip -0 -r -y "$electron_zip_dir/electron-v$electron_version-linux-x64.zip" .
  )

  sed -i 's/packagerConfig: {/packagerConfig: { electronZipDir: process.env.ELECTRON_ZIP_DIR,/' forge.config.ts
  sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"$electron_version\"/" package.json

  export ELECTRON_ZIP_DIR="$electron_zip_dir"
  export CI=true
  export TMPDIR="$forge_tmpdir"

  mkdir -p "$TMPDIR"
  bun run package

  if [[ ! -d out ]]; then
    echo "error: electron-forge finished but produced no out/ directory" >&2
    return 1
  fi
}

package() {
  cd "$_pkgname-$pkgver"

  local app_dir
  app_dir="$(find out -maxdepth 1 -mindepth 1 -type d -name '*-linux-x64' | head -n 1)"

  if [[ -z "$app_dir" || ! -d "$app_dir/resources" ]]; then
    echo "error: no packaged app dir found under out/" >&2
    return 1
  fi

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a "$app_dir/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  cp -a "$app_dir/resources/app.asar.unpacked" "$pkgdir/usr/lib/$pkgname"
  cp -a "$app_dir/resources/assets" "$pkgdir/usr/lib/$pkgname"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec electron39 /usr/lib/$pkgname/app.asar "\$@"
EOF

  install -Dm644 assets/transparent-logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Linux Wallpaper Engine
Comment=Manage and apply Steam Wallpaper Engine wallpapers on Linux
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;
EOF
}
