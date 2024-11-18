# Maintainer: su226 <thesu226 at outlook dot com>

pkgname=dev-sidecar-git
pkgver=1.8.9.r31.g77dcf77
pkgrel=1
epoch=
pkgdesc="开发者边车，github打不开，github加速，git clone加速，git release下载加速，stackoverflow加速"
arch=(any)
url="https://github.com/docmirror/dev-sidecar"
license=("MPL-2.0")
groups=()
_electron=electron17
depends=("$_electron")
makedepends=(git pnpm python-setuptools libxcrypt-compat)
checkdepends=()
optdepends=()
provides=(dev-sidecar)
conflicts=(dev-sidecar)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/docmirror/dev-sidecar.git"
        "dev-sidecar.desktop")
noextract=()
sha256sums=("SKIP"
            "4fbb8418638f73fb845e187c599b099377c340dc9a2121844ec08944378011f9")
validpgpkeys=()

pkgver() {
  cd dev-sidecar
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd dev-sidecar
  local _electronDist="/usr/lib/$_electron"
  local _electronVersion="$(<$_electronDist/version)"
  sed -i "/^\s*builderOptions: {$/a electronDist: \"$_electronDist\", electronVersion: \"$_electronVersion\"," packages/gui/vue.config.js
  pnpm install
}

build() {
  cd dev-sidecar/packages/gui
  pnpm run electron:build --dir
}

package() {
  install -d "$pkgdir/usr/bin"
  printf '#!/bin/bash\nexec %s "/usr/share/dev-sidecar/app" "$@"\n' "$_electron" > "$pkgdir/usr/bin/dev-sidecar"
  chmod 755 "$pkgdir/usr/bin/dev-sidecar"

  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/app-update.yml" "$pkgdir/usr/share/dev-sidecar/app/dev-app-update.yml"
  cp -rT "$srcdir/dev-sidecar/packages/gui/dist_electron/bundled" "$pkgdir/usr/share/dev-sidecar/app"
  cp -rT "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra" "$pkgdir/usr/share/dev-sidecar/extra"

  install -Dm644 "$srcdir/dev-sidecar.desktop" "$pkgdir/usr/share/applications/dev-sidecar.desktop"
  for _size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/$_size.png" "$pkgdir/usr/share/icons/hicolor/$_size/apps/dev-sidecar.png"
  done
}
