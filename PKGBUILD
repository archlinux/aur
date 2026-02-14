# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=vortex-git
pkgver=1.16.2.r10.g123abc
pkgrel=1
pkgdesc="Nexus Mods' mod manager - native Linux build (Git Master)"
arch=('x86_64')
url="https://github.com/Nexus-Mods/Vortex"
license=('GPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss'
  'minizip' 'snappy' 're2' 'libnotify' 'libappindicator-gtk3' 'nss' 'libsecret')
makedepends=('git' 'yarn' 'nodejs' 'python' 'cmake')
provides=('vortex')
conflicts=('vortex')
install=vortex.install
# Pulls directly from the master branch
source=("git+https://github.com/Nexus-Mods/Vortex.git#branch=master"
  "vortex.desktop")
sha256sums=('SKIP' 'SKIP')

options=('!strip' '!debug')

pkgver() {
  cd "$srcdir/Vortex"
  # Generates a version like 1.16.2.r15.g8a2b3c automatically
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/Vortex"
  _node_ver=$(node -v | sed 's/v//')
  sed -i "s/\"node\": \"[0-9.]*\"/\"node\": \">=$_node_ver\"/" package.json
  yarn install
}

build() {
  cd "$srcdir/Vortex"

  msg2 "Running pre-distribution setup..."
  yarn run predist

  msg2 "Compiling Webpack bundles..."
  yarn run build_dist

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

  # Note: In the master branch, the icon location might shift,
  # but currently it resides here:
  install -Dm644 "$srcdir/Vortex/assets/images/vortex.png" "$pkgdir/usr/share/pixmaps/vortex.png"
}
