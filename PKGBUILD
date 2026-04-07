# Maintainer: Cameron Slipp <cdslipp@hey.com>
pkgname=ontime-git
pkgver=4.7.0.r0.g176e53dd7
pkgrel=1
pkgdesc="Time keeping for live events (built from source)"
arch=('x86_64')
url="https://github.com/cpvalente/ontime"
license=('AGPL-3.0-only')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
makedepends=('git' 'nodejs>=22' 'pnpm>=10')
provides=('ontime')
conflicts=('ontime' 'ontime-bin')
options=('!strip')

source=("ontime::git+https://github.com/cpvalente/ontime.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd ontime
  # This generates a version string based on the latest git tag and commit count
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd ontime
  pnpm install
  pnpm build
  pnpm dist-linux
}

package() {
  cd ontime
  # Path to the built AppImage (matches upstream electron-builder output)
  local _appimage="apps/electron/dist/ontime-linux-x86_64.AppImage"
  local _icon="apps/electron/src/assets/icon.png"

  # 1. Install the binary
  install -Dm755 "$_appimage" "${pkgdir}/usr/bin/ontime"

  # 2. Install the icon
  install -Dm644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ontime.png"

  # 3. Create the .desktop file
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/ontime.desktop" << EOF
[Desktop Entry]
Version=1.0
Name=Ontime
Comment=Time keeping for live events
Exec=ontime
Terminal=false
Type=Application
Icon=ontime
StartupNotify=true
StartupWMClass=ontime
Categories=AudioVideo;Productivity;
EOF
}
