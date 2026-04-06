# Maintainer: Steve Holvoet <linux@steho.be>
pkgname=binaryobjectscanner
_pkgname=ProtectionScan
pkgver=3.6.0
pkgrel=1
pkgdesc="A scanner for identifying protection mechanisms in binary files (CLI: ProtectionScan)"
arch=('x86_64')
url="https://github.com/SabreTools/BinaryObjectScanner"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('dotnet-sdk')
provides=('protectionscan')
conflicts=('binaryobjectscanner-git' 'protectionscan')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SabreTools/BinaryObjectScanner/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a64ce69349385d44bcfb62431957b2ffdca8bb301644feb711681d6b3ffd4296')

build() {
  cd "BinaryObjectScanner-$pkgver"
  
  # Ensure we use the system's .NET runtime version if possible, or pick latest stable
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
  cd "BinaryObjectScanner-$pkgver"

  # Install the published files
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r publish/* "$pkgdir/usr/lib/$pkgname/"

  # Create a wrapper script
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/ProtectionScan" "$pkgdir/usr/bin/ProtectionScan"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install readme
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
sha256sums=('e389408ec2ba3f33221c43a33305421ae6d00129567456935ab02b8d7d5a0269')
