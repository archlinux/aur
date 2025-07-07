# Maintainer: nopw <aur@n0.pw>

pkgname=stremio-linux-shell-git
pkgver=v1.0.0.beta.11.r0.gd6010ba
pkgrel=1
pkgdesc="A native Linux client for Stremio"
arch=('x86_64')
url="https://github.com/Stremio/stremio-linux-shell"
license=('GPL-3.0-or-later')

depends=('mpv' 'gtk3' 'libappindicator-gtk3' 'nss' 'openssl' 'gcc-libs' 'nodejs'
         'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gdk-pixbuf2'
         'glib2' 'hicolor-icon-theme' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
         'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'pango'
         'systemd-libs')
makedepends=('cargo' 'git' 'clang' 'binutils' 'cmake' 'pkg-config' 'patchelf' 'licenses')

provides=('stremio-linux-shell' 'stremio')
conflicts=('stremio' 'stremio-linux-shell')
options=(!lto)
source=("git+https://github.com/Stremio/stremio-linux-shell.git")
sha256sums=('SKIP')

pkgver() {
  cd "stremio-linux-shell"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "stremio-linux-shell"
  git submodule update --init --recursive
  cargo fetch --locked
}

build() {
  cd "stremio-linux-shell"
  export CC=clang
  export CXX=clang++
  export CEF_PATH="$srcdir/stremio-linux-shell/vendor/cef"
  export RUSTFLAGS="-L native=$CEF_PATH"
  cargo build --release --locked
}

package() {
  cd "stremio-linux-shell"

  install -Dm755 "target/release/stremio-linux-shell" "$pkgdir/usr/share/stremio/stremio"
  cp -r "vendor/cef/"* "$pkgdir/usr/share/stremio/"

  patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/share/stremio/stremio"

  install -d "$pkgdir/usr/bin"
  ln -sf /usr/share/stremio/stremio "$pkgdir/usr/bin/stremio"

  install -Dm644 "data/com.stremio.Stremio.desktop" "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
  install -Dm644 "data/icons/com.stremio.Stremio.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.Stremio.svg"
  install -Dm644 "data/com.stremio.Stremio.metainfo.xml" "$pkgdir/usr/share/metainfo/com.stremio.Stremio.metainfo.xml"

  install -Dm644 /usr/share/licenses/spdx/GPL-3.0-or-later.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  rmdir "$pkgdir/usr/share/stremio/locales/locales"
}