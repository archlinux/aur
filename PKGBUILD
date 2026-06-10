# Maintainer: LuoTianyi_arm64 <2153585992@qq.com>
pkgname=astra3dengine-git
_binname=astra-3d-engine
pkgver=v0.0.1.beta.5.r4.g2b93bf7
pkgrel=1
pkgdesc='A joking 3D engine.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Astra3DEngine/Astra3DEngine'
license=('GPL-3.0-only')
makedepends=('nodejs' 'pnpm' 'git' 'python' 'jre-openjdk')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'hicolor-icon-theme' 'at-spi2-core' 'libdrm' 'mesa' 'libxcb' 'libnotify')
provides=('astra3dengine')
conflicts=('astra3dengine' 'astra3dengine-bin')
options=(!strip !debug)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  pnpm install --frozen-lockfile
  pnpm run build --config vite.config.desktop.js
  pnpm run icon:generate
  npx vite build --config vite.config.desktop.js --outDir dist-electron
  pnpm exec electron-builder --linux tar.gz --publish never
}

package() {
  cd "$srcdir/$pkgname"
  local _unpacked_dir="release/linux-unpacked"
  [[ "$CARCH" == "aarch64" ]] && _unpacked_dir="release/linux-arm64-unpacked"
  [[ "$CARCH" == "armv7h" ]] && _unpacked_dir="release/linux-armv7l-unpacked"

  install -d "$pkgdir/opt/Astra 3D Engine"
  cp -r "$_unpacked_dir"/* "$pkgdir/opt/Astra 3D Engine/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Astra 3D Engine/astra-3d-engine" "$pkgdir/usr/bin/$_binname"

  install -d "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/$_binname.desktop" <<EOT
[Desktop Entry]
Name=Astra3DEngine
GenericName=3D engine
Comment=A 3D engine for creative projects.
Exec=$_binname %U
Terminal=false
Type=Application
Icon=astra-3d-engine
StartupWMClass=Astra3DEngine
Categories=Graphics;Development;GameEngine;
Keywords=3Dengine;
EOT
  local _res
  for _res in 16 32 48 64 128 256 512 1024; do
    local _icon_path="electron/icons/${_res}x${_res}.png"
    if [ -f "$_icon_path" ]; then
      install -Dm644 "$_icon_path" "$pkgdir/usr/share/icons/hicolor/${_res}x${_res}/apps/astra-3d-engine.png"
    fi
  done
}
