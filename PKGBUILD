# Maintainer: Andres <andresdortiz@gmail.com>
pkgname=mpf-ui
pkgver=3.10.0
pkgrel=2
pkgdesc='Graphical frontend for Redumper, Aaru, and DiscImageCreator'
arch=('x86_64' 'aarch64')
url='https://github.com/SabreTools/MPF'
license=('MIT')
depends=(
  'dotnet-runtime-10.0'
  'fontconfig'
  'libgl'
  'libice'
  'libsm'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
)
makedepends=(
  'dotnet-sdk-10.0'
  'imagemagick'
)
optdepends=(
  'redumper: default dumping backend'
  'aaru: Aaru dumping backend'
  'discimagecreator: DiscImageCreator dumping backend'
)
conflicts=('mpf-ui-bin' 'mpf-ui-git')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SabreTools/MPF/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1a61ab41656d5c2237554af3b7393ee33ad3b9be9d5da3024dd20819b1336634')

build() {
  cd "MPF-$pkgver"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  local rid
  case "$CARCH" in
    x86_64) rid=linux-x64 ;;
    aarch64) rid=linux-arm64 ;;
    *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  # MPF.UI is Windows-only. The Linux GUI in this repository is MPF.Avalonia.
  dotnet publish MPF.Avalonia/MPF.Avalonia.csproj \
    --framework net10.0 \
    --runtime "$rid" \
    --configuration Release \
    --self-contained false \
    -p:PublishSingleFile=false \
    -p:DebugType=None \
    -p:DebugSymbols=false \
    -o "$srcdir/publish"
}

package() {
  cd "MPF-$pkgver"

  install -dm755 "$pkgdir/usr/lib/mpf-ui"
  cp -a --no-preserve=ownership "$srcdir/publish/." "$pkgdir/usr/lib/mpf-ui/"

  cat > "$srcdir/mpf.sh" << 'EOF'
#!/bin/sh
config="$HOME/.config/mpf/config.json"
if [ ! -s "$config" ]; then
  mkdir -p "$(dirname "$config")"
  cat > "$config" << 'ENDCFG'
{
  "Version": 2,
  "FirstRun": false,
  "Dumping": {
    "RedumperPath": "redumper",
    "AaruPath": "aaru",
    "DiscImageCreatorPath": "DiscImageCreator"
  }
}
ENDCFG
fi
exec /usr/lib/mpf-ui/MPF "$@"
EOF
  install -Dm755 "$srcdir/mpf.sh" "$pkgdir/usr/bin/MPF"

  local index width
  while read -r index width; do
    magick "MPF.UI/Images/Icon.ico[${index}]" "$srcdir/mpf.png"
    install -Dm644 "$srcdir/mpf.png" "$pkgdir/usr/share/icons/hicolor/${width}x${width}/apps/mpf.png"
  done < <(magick identify -format '%p %w\n' MPF.UI/Images/Icon.ico)

  cat > "$srcdir/mpf.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Media Preservation Frontend
GenericName=Optical disc dumping frontend
Comment=Graphical frontend for Redumper, Aaru, and DiscImageCreator
Exec=MPF
Icon=mpf
Terminal=false
Categories=Utility;Archiving;
EOF
  install -Dm644 "$srcdir/mpf.desktop" "$pkgdir/usr/share/applications/mpf.desktop"
  install -Dm644 MPF.Avalonia/MPF.1 "$pkgdir/usr/share/man/man1/MPF.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
