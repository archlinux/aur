# Maintainer: Tokit Auhid <tokitauhidmim12@gmail.com>

pkgname=synkromium-git
pkgver=0.1.5.r0.g493988e
pkgrel=1
pkgdesc="Keep your Chromium browser settings and extensions in sync across all your devices, privately and automatically."
arch=('x86_64')
url="https://github.com/tokitauhid/Synkromium"
license=('MIT')
depends=('nss' 'libxss' 'libsecret' 'gtk3' 'alsa-lib')
makedepends=('git' 'npm' 'nodejs')
provides=('synkromium')
conflicts=('synkromium' 'synkromium-bin')
source=("git+https://github.com/tokitauhid/Synkromium.git"
        "synkromium.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "Synkromium"
  # Attempt to use git tags, fallback to rev-list if no tags exist
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "Synkromium"
  npm ci
}

build() {
  cd "Synkromium"
  npm run build
  npx electron-builder --linux dir -p never
}

package() {
  cd "Synkromium"
  
  install -d "$pkgdir/opt/Synkromium"
  cp -r release/linux-unpacked/* "$pkgdir/opt/Synkromium/"
  chmod -R u-s,g-s,o-w,a+rX "$pkgdir"
  
  install -d "$pkgdir/usr/bin"
  ln -sf "/opt/Synkromium/synkromium" "$pkgdir/usr/bin/synkromium"
  
  install -Dm644 "../synkromium.desktop" "$pkgdir/usr/share/applications/synkromium.desktop"
  install -Dm644 "build/icons/icon.png" "$pkgdir/usr/share/pixmaps/synkromium.png"
}
