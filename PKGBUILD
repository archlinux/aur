# Maintainer: Andres <andresdortiz@gmail.com>
pkgname=mpf-cli-git
pkgver=3.10.0.r20.gbade587
pkgrel=2
pkgdesc='Command-line frontend for Redumper, Aaru, and DiscImageCreator'
arch=('x86_64' 'aarch64')
url='https://github.com/SabreTools/MPF'
license=('MIT')
depends=('dotnet-runtime-10.0')
makedepends=(
  'dotnet-sdk-10.0'
  'git'
)
optdepends=(
  'redumper: default dumping backend'
  'aaru: Aaru dumping backend'
  'discimagecreator: DiscImageCreator dumping backend'
)
provides=('mpf-cli')
conflicts=('mpf-cli' 'mpf-cli-bin')
options=('!strip')
source=('git+https://github.com/SabreTools/MPF.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd MPF
  # Upstream's only branch is master. Exclude the moving rolling tags.
  git describe --long --tags --abbrev=7 --exclude='*rolling*' \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd MPF

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_NOLOGO=1

  local rid
  case "$CARCH" in
    x86_64) rid=linux-x64 ;;
    aarch64) rid=linux-arm64 ;;
    *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  dotnet publish MPF.CLI/MPF.CLI.csproj \
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
  install -dm755 "$pkgdir/usr/lib/mpf-cli"
  cp -a --no-preserve=ownership "$srcdir/publish/." "$pkgdir/usr/lib/mpf-cli/"

  cat > "$srcdir/mpf-cli.sh" << 'EOF'
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
exec /usr/lib/mpf-cli/MPF.CLI "$@"
EOF
  install -Dm755 "$srcdir/mpf-cli.sh" "$pkgdir/usr/bin/MPF.CLI"

  "$pkgdir/usr/lib/mpf-cli/MPF.CLI" man > "$srcdir/MPF.CLI.1"
  install -Dm644 "$srcdir/MPF.CLI.1" "$pkgdir/usr/share/man/man1/MPF.CLI.1"
  install -Dm644 "$srcdir/MPF/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
