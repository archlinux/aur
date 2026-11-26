# Maintainer: Mikko Tuomikoski <me AT snoozyman DOT eu>
# Contributor: MoazSalem <https://github.com/MoazSalem>

pkgname=litefin-git
pkgver=2.10.0.r42.gb8532be
pkgrel=1
pkgdesc="Jellyfin & Emby Client for Smart TVs and Desktop (git version)"
arch=('x86_64')
url="https://github.com/MoazSalem/litefin"
license=('MPL-2.0')
provides=('litefin')
conflicts=('litefin')
options=('!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'glibc')
makedepends=('git' 'nodejs' 'npm' 'rust' 'cargo')
optdepends=('jellyfin-server: Media server to connect to')
source=("litefin::git+https://github.com/MoazSalem/litefin.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/litefin"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/litefin"
  npm ci
}

build() {
  cd "${srcdir}/litefin"

  # Build the Webpack bundle for desktop
  npm run build:desktop

  # Build the native Tauri binary without generating .deb/.rpm/.AppImage
  npx tauri build --no-bundle
}

package() {
  cd "${srcdir}/litefin/src-tauri"

  install -Dm755 target/release/litefin \
    "${pkgdir}/usr/bin/litefin"

  install -Dm644 icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/litefin.png"

  install -d "${pkgdir}/usr/share/applications"

  cat > "${pkgdir}/usr/share/applications/litefin.desktop" <<EOF
[Desktop Entry]
Name=Litefin
Exec=/usr/bin/litefin
Icon=litefin
Type=Application
Categories=AudioVideo;Video;Player;
EOF
}
