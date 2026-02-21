# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=binaryobjectscanner-git
_pkgname=ProtectionScan
pkgver=3.5.0.r2517.9be63e9e
pkgrel=1
pkgdesc="A scanner for identifying protection mechanisms in binary files (CLI: ProtectionScan)"
arch=('x86_64')
url="https://github.com/SabreTools/BinaryObjectScanner"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk')
provides=('binaryobjectscanner' 'protectionscan')
conflicts=('binaryobjectscanner' 'protectionscan')
options=('!strip' '!debug')
source=("git+https://github.com/SabreTools/BinaryObjectScanner.git")
sha256sums=('SKIP')

pkgver() {
  cd "BinaryObjectScanner"
  printf "%s.r%s.%s" "$(grep -Po '(?<=<Version>)[^<]*' ProtectionScan/ProtectionScan.csproj)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "BinaryObjectScanner"
  
  # Ensure we use the system's .NET runtime version if possible, or pick latest stable
  # net10.0 is available in Arch but is very new. If build fails, we might retry with net9.0
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  
  dotnet publish ProtectionScan/ProtectionScan.csproj \
    -c Release \
    -f net10.0 \
    -r linux-x64 \
    --self-contained false \
    -o "publish" \
    /p:DebugType=None \
    /p:DebugSymbols=false
}

package() {
  cd "BinaryObjectScanner"

  # Install the published files
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r publish/* "$pkgdir/usr/lib/$pkgname/"

  # Create a wrapper script in /usr/bin because linking the single-file executable directly
  # sometimes has issues finding dependencies if they aren't completely bundled (though PublishSingleFile usually handles it).
  # However, since we used --self-contained false, the "single file" is actually a thin wrapper around the DLLs or sometimes just the DLL itself.
  # Let's check what 'publish' produced. If it created 'ProtectionScan', we can symlink it.
  
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/ProtectionScan" "$pkgdir/usr/bin/ProtectionScan"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install readme
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
