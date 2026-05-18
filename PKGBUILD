# Maintainer: jagrat7
pkgname=linux-wallpaper-engine-ux
_pkgname=linux-wallpaper-engine
pkgver=0.4.2
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
sha256sums=('6a5f272bf7c257f55d635cea63616a18b8dbc831e90d27dc076e91d9977acafe')
options=('!debug')

prepare() {
  cd "$_pkgname-$pkgver"

  bun install --frozen-lockfile --ignore-scripts
}

build() {
  cd "$_pkgname-$pkgver"

  local electron_version
  local electron_zip_dir
  electron_version="$(cat /usr/lib/electron39/version)"
  electron_zip_dir="$srcdir/electron-zip"

  mkdir -p "$electron_zip_dir"
  cp -a /usr/lib/electron39 "$srcdir/electron-v$electron_version-linux-x64"
  chmod -R u+w "$srcdir/electron-v$electron_version-linux-x64"

  (
    cd "$srcdir/electron-v$electron_version-linux-x64"
    zip -0 -r -y "$electron_zip_dir/electron-v$electron_version-linux-x64.zip" .
  )

  sed -i 's/packagerConfig: {/packagerConfig: { electronZipDir: process.env.ELECTRON_ZIP_DIR,/' forge.config.ts
  sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"$electron_version\"/" package.json

  export ELECTRON_ZIP_DIR="$electron_zip_dir"
  export CI=true

  bun run package
}

package() {
  cd "$_pkgname-$pkgver"

  local app_dir
  app_dir="$(find out -maxdepth 1 -type d -name '*-linux-x64' | head -n 1)"

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
