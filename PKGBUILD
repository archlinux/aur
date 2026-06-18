# Maintainer: Ascend Liu <ascendliu@qq.com>

pkgname=litedbstudio
pkgver=1.0.1
pkgrel=1
pkgdesc="Cross-platform GUI tool for LiteDB v5"
arch=('x86_64')
url="https://github.com/AscendLiu/LiteDBStudio"
license=('MIT')
depends=(
  'dotnet-runtime>=10.0'
  'gtk3'
  'hicolor-icon-theme'
)
makedepends=(
  'dotnet-sdk>=10.0'
  'git'
)
options=('!lto' '!debug')

# Git source with submodule
source=("${pkgname}::git+https://github.com/AscendLiu/LiteDBStudio.git#tag=v${pkgver}")
b2sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"

  dotnet publish src/LiteDBStudio/LiteDBStudio.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --self-contained false \
    --output "$srcdir/publish" \
    /p:DebugType=embedded \
    /p:DebugSymbols=false \
    /p:NoWarn=NETSDK1215
}

check() {
  # Smoke test: verify the binary exists and is executable
  [[ -x "$srcdir/publish/LiteDBStudio" ]]
}

package() {
  # Binary and libraries
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r "$srcdir/publish"/* "$pkgdir/usr/lib/$pkgname/"

  # Executable symlink
  install -d "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$pkgname/LiteDBStudio" "$pkgdir/usr/bin/$pkgname"

  # Desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<'DESKTOP_EOF'
[Desktop Entry]
Type=Application
Name=LiteDB Studio
GenericName=LiteDB Database Manager
Comment=Cross-platform GUI tool for LiteDB v5
Exec=litedbstudio %f
Icon=litedbstudio
Terminal=false
Categories=Development;Database;Utility;
StartupNotify=true
MimeType=application/x-litedb;
DESKTOP_EOF

  # App icon (SVG for scalable, PNG for fixed-size)
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  cp "$srcdir/$pkgname/src/LiteDBStudio/Assets/litedbstudio.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  cp "$srcdir/$pkgname/src/LiteDBStudio/Assets/litedbstudio_256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  cp "$srcdir/$pkgname/src/LiteDBStudio/Assets/litedbstudio_48.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"

  install -d "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  cp "$srcdir/$pkgname/src/LiteDBStudio/Assets/litedbstudio_32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"

  # MIME type registration
  install -d "$pkgdir/usr/share/mime/packages"
  cat > "$pkgdir/usr/share/mime/packages/$pkgname.xml" <<'MIME_EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-litedb">
    <comment>LiteDB database file</comment>
    <glob pattern="*.db"/>
    <glob pattern="*.litedb"/>
  </mime-type>
</mime-info>
MIME_EOF

  # License
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
