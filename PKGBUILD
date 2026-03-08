# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=pipette-desktop-git
pkgver=0.3.1.r3.gc15f8ee
pkgrel=1
pkgdesc="Pipette — Vial-compatible keyboard configurator (Git version)"
arch=('x86_64')
url="https://github.com/darakuneko/pipette-desktop"
license=('GPL3')
provides=('pipette-desktop')
conflicts=('pipette-desktop-bin')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'mesa')
makedepends=('git' 'pnpm' 'python' 'make' 'gcc')
options=('!strip')

source=("git+https://github.com/darakuneko/pipette-desktop.git")
sha256sums=('SKIP')

pkgver() {
  cd "pipette-desktop"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "pipette-desktop"
  rm -f pnpm-workspace.yaml
  pnpm install --frozen-lockfile
}

build() {
  cd "pipette-desktop"
  pnpm build
  pnpm exec electron-builder --linux dir
}

package() {
  cd "pipette-desktop"
  local _install_path="/opt/pipette-desktop"

  install -dm755 "${pkgdir}${_install_path}"

  local _unpacked_dir=$(find . -type d -name "linux-unpacked" | head -n 1)
  cp -r --no-preserve=mode,ownership "${_unpacked_dir}/"* "${pkgdir}${_install_path}/"

  chmod 4755 "${pkgdir}${_install_path}/chrome-sandbox"
  chmod -R u=rwX,go=rX "${pkgdir}${_install_path}"

  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/pipette-desktop" <<EOF
#!/bin/sh
export APPDIR="${_install_path}"
exec "${_install_path}/pipette-desktop" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/pipette-desktop"

  install -dm755 "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/pipette-desktop.desktop" <<EOF
[Desktop Entry]
Name=Pipette
Exec=pipette-desktop --no-sandbox %U
Terminal=false
Type=Application
Icon=pipette-desktop
StartupWMClass=Pipette
Comment=Vial-compatible keyboard configurator
Categories=Utility;HardwareSettings;
EOF

  if [ -f "build/icon.png" ]; then
    install -Dm644 "build/icon.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/pipette-desktop.png"
    install -Dm644 "build/icon.png" "$pkgdir/usr/share/pixmaps/pipette-desktop.png"
  fi
  chmod +x "$pkgdir/opt/pipette-desktop/pipette-desktop"
}
