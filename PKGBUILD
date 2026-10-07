# Maintainer: Andres <andresdortiz@gmail.com>
pkgname=mpf-cli-bin
pkgver=3.10.0
pkgrel=2
pkgdesc='Command-line frontend for Redumper, Aaru, and DiscImageCreator'
arch=('x86_64' 'aarch64')
url='https://github.com/SabreTools/MPF'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
optdepends=(
  'redumper: default dumping backend'
  'aaru: Aaru dumping backend'
  'discimagecreator: DiscImageCreator dumping backend'
)
provides=('mpf-cli')
conflicts=('mpf-cli' 'mpf-cli-git')
options=('!strip')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/SabreTools/MPF/$pkgver/LICENSE")
source_x86_64=("MPF.CLI_${pkgver}_net10.0_linux-x64_release.zip::https://github.com/SabreTools/MPF/releases/download/$pkgver/MPF.CLI_${pkgver}_net10.0_linux-x64_release.zip")
source_aarch64=("MPF.CLI_${pkgver}_net10.0_linux-arm64_release.zip::https://github.com/SabreTools/MPF/releases/download/$pkgver/MPF.CLI_${pkgver}_net10.0_linux-arm64_release.zip")
noextract=(
  "MPF.CLI_${pkgver}_net10.0_linux-x64_release.zip"
  "MPF.CLI_${pkgver}_net10.0_linux-arm64_release.zip"
)
sha256sums=('d3473adb99570967c0cc7196d13ace3781b22b93a7ca3046d5a68bd53c665446')
sha256sums_x86_64=('f55dd84c6b28ac3c600a9f49fa2c2b9e478345aaca85a964c0dd831fecd4aca4')
sha256sums_aarch64=('1430426aea16416d3759abf634275aa360ac213e2b962b26887120bb16460a94')

package() {
  local rid
  case "$CARCH" in
    x86_64) rid=linux-x64 ;;
    aarch64) rid=linux-arm64 ;;
    *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  bsdtar -xf "$srcdir/MPF.CLI_${pkgver}_net10.0_${rid}_release.zip" -C "$srcdir" MPF.CLI
  install -Dm755 "$srcdir/MPF.CLI" "$pkgdir/usr/lib/mpf-cli/MPF.CLI"

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
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
