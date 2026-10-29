# Maintainer: Your Name <you@example.com>

pkgname=retroed-git
pkgver=2.0.2.r49.g2b78ca0
pkgrel=1
pkgdesc='General purpose tool suite for the Retro Engine (versions 1-5)'
arch=('x86_64')
url='https://github.com/RSDKModding/RetroED'
license=('GPL-3.0-or-later')
depends=('qt5-base' 'qt5-svg' 'zlib')
makedepends=('git' 'python' 'python-pytz')
provides=('retroed')
conflicts=('retroed')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd RetroED
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cat > retroed.desktop <<'EOF'
[Desktop Entry]
Type=Application
Name=RetroED
GenericName=Retro Engine Editor
Comment=A general purpose tool suite for the Retro Engine (versions 1-5)
Exec=RetroED
Icon=retroed
Terminal=false
Categories=Development;
Keywords=retro;engine;rsdk;editor;modding;
StartupNotify=true
StartupWMClass=RetroED
EOF


  sed -i 's/qWarning(GifErrorString(error));/qWarning("%s", GifErrorString(error));/' \
    "RetroED/RetroEDv2/dependencies/QtGifImage/src/gifimage/qgifimage.cpp"
}

build() {
  cd "$srcdir/RetroED/RetroEDv2"
  python3 versiongen.py "$(git -C "$srcdir/RetroED" rev-parse --short HEAD)"
  mkdir -p build
  qmake -o build RetroEDv2.pro
  make -C build
}

package() {
  install -Dm755 "$srcdir/RetroED/RetroEDv2/build/RetroED" "$pkgdir/usr/bin/RetroED"
  install -Dm644 "$srcdir/RetroED/RetroEDv2/icons/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/retroed.svg"
  install -Dm644 retroed.desktop "$pkgdir/usr/share/applications/retroed.desktop"
  install -Dm644 "$srcdir/RetroED/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
