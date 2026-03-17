# Maintainer: LuoTianyi_arm64 <2153585992@qq.com>
pkgname=astraeditor-git
_binname=astraeditor-desktop
pkgver=1.1.4
pkgrel=1
pkgdesc='AstraEditor is a TurboWarp mod used to add more practical features to make your writing lightning fast.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/AstraEditor/'
license=('GPL3')
makedepends=('nodejs' 'npm' 'git' 'python')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'hicolor-icon-theme' 'at-spi2-core' 'libdrm' 'mesa' 'libxcb' 'libnotify')
provides=('astraeditor')
conflicts=('astraeditor')
options=(!strip !debug)
source=("${pkgname}::git+${url}Desktop.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  rm -f package-lock.json
  npm install --loglevel=info
  npm run fetch
  npm run webpack:prod

  local _target_arch="x64"
  [[ "$CARCH" == "aarch64" ]] && _target_arch="arm64"
  [[ "$CARCH" == "armv7h" ]] && _target_arch="armv7l"

  npx electron-builder --linux --dir --$_target_arch
}
package() {
  cd "$pkgname"
  local _unpacked_dir="dist/linux-unpacked"
  [[ "$CARCH" == "aarch64" ]] && _unpacked_dir="dist/linux-arm64-unpacked"
  [[ "$CARCH" == "armv7h" ]] && _unpacked_dir="dist/linux-armv7l-unpacked"

  install -d "$pkgdir/opt/astraeditor"
  cp -r "$_unpacked_dir"/* "$pkgdir/opt/astraeditor/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/astraeditor/$_binname" "$pkgdir/usr/bin/$_binname"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$_binname.desktop" <<EOT
[Desktop Entry]
Name=AstraEditor
GenericName=Scratch Mod
Comment=Mod of Scratch with a compiler and more features.
Exec=$_binname %U
Terminal=false
Type=Application
Icon=astraeditor
StartupWMClass=$_binname
Categories=Development;Education;
Keywords=scratch;
EOT

  local _res
  for _res in 48 64 128 256 512; do
    local _icon_path="build/icons/${_res}x${_res}.png"
    if [ -f "$_icon_path" ]; then
      install -Dm644 "$_icon_path" "$pkgdir/usr/share/icons/hicolor/${_res}x${_res}/apps/astraeditor.png"
    fi
  done
}
