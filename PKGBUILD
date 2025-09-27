# Maintainer: Jørgen Stråbø <aur@jorgen-10.no>
pkgname='freeshow-git'
pkgver='1.5.0.r0.gc8595b0'
pkgrel='1'
pkgdesc="A software with a friendly interface and powerful features for making slideshows"
arch=('x86_64')
provides=('freeshow')
conflicts=('freeshow-lts' 'freeshow-bin' 'freeshow')
url="https://github.com/ChurchApps/FreeShow"
options=('!debug' '!strip')
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
makedepends=('npm' 'fakeroot' 'git' 'python')
source=("$pkgname::git+https://github.com/ChurchApps/FreeShow.git" "freeshow.desktop" "freeshow")
sha256sums=('SKIP' '5f141e1d28ec7b2ddfed43855a7d3cceca6b710887fbecc0fbfea1e56f9f05f5' '622f64c95c31f467fc7fcd63c13f1afe149506a14c9a9a810a52b758a9f04968' )

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Build Process
prepare() {
  cd "$pkgname"

# Install node packages
  npm install --cache "${srcdir}/npm-cache" 
}

build() {
  cd "$pkgname"

  # runs build
  npm run build
  # Ensures that Appimage and .deb package isnt built (also avoids github releases)
  npx electron-builder --config config/building/electron-builder.yaml --publish never --linux dir
}

package() {
  cd "$pkgname"
  # Installation directory
  install -dm755 "$pkgdir/opt/freeshow"
  # Copy the contents of dist (from build) into /opt/freeshow
  mv "$srcdir/$pkgname/dist/linux-unpacked/"* "$pkgdir/opt/freeshow/"
  # Empties out the node_modules directory due to errors from /build/freeshow-git/src/freeshow-git/node_modules/@napi-rs/canvas-android-arm64 during rebuilds
  rm -rf "$srcdir/$pkgname/node_modules"

  # Install the freeshow executable to /usr/bin
  install -Dm755 "../freeshow" "$pkgdir/usr/bin/freeshow"

  # Install the license
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/freeshow/LICENSE"

  # Install the .desktop file for launcher integration (if you have one)
  install -Dm644 "../freeshow.desktop" "$pkgdir/usr/share/applications/freeshow.desktop"

  # Install application icon
  install -Dm644 "$srcdir/$pkgname/src/server/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/freeshow.png"
}
