# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=vortex
pkgver=1.16.2
pkgrel=1
pkgdesc="Nexus Mods' mod manager - native Linux build (Stable)"
arch=('x86_64')
url="https://github.com/Nexus-Mods/Vortex"
license=('GPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss'
  'minizip' 'snappy' 're2' 'libnotify' 'libappindicator-gtk3' 'nss' 'libsecret')
makedepends=('git' 'yarn' 'nodejs' 'python' 'cmake')
provides=('vortex')
conflicts=('vortex-git')
install=vortex.install
# Uses the specific stable tag
source=("git+https://github.com/Nexus-Mods/Vortex.git#tag=v${pkgver}"
  "vortex.desktop")
sha256sums=('SKIP' 'SKIP')

# !strip and !debug are CRITICAL to prevent crash_dump errors
options=('!strip' '!debug')

prepare() {
  cd "$srcdir/Vortex"
  _node_ver=$(node -v | sed 's/v//')
  sed -i "s/\"node\": \"[0-9.]*\"/\"node\": \">=$_node_ver\"/" package.json
  yarn install
}

build() {
  cd "$srcdir/Vortex"

  # 1. Prepare the 'app' folder structure (assets, subprojects)
  msg2 "Running pre-distribution setup..."
  yarn run predist

  # 2. Compile the JS bundles (Webpack)
  msg2 "Compiling Webpack bundles..."
  yarn run build_dist

  # 3. Package
  msg2 "Packaging Electron application..."
  ./node_modules/.bin/electron-builder --linux dir --x64 --config electron-builder-config.json
}

package() {
  cd "$srcdir/Vortex/dist/linux-unpacked"

  install -dm755 "$pkgdir/opt/Vortex"
  cp -a . "$pkgdir/opt/Vortex/"
  chmod 4755 "$pkgdir/opt/Vortex/chrome-sandbox"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/Vortex/vortex "$pkgdir/usr/bin/vortex"

  install -Dm644 "$srcdir/vortex.desktop" "$pkgdir/usr/share/applications/vortex.desktop"
  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png"
}
