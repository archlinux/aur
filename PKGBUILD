# Maintainer: Zynix <crossmacro@zynix.net>
pkgname=crossmacro
pkgver=1.0.0
pkgrel=1
pkgdesc="Mouse Macro Automation Tool for Linux Wayland"
arch=('x86_64')
url="https://github.com/alper-han/CrossMacro"
license=('MIT')
depends=('dotnet-runtime>=10.0' 'zlib' 'openssl' 'icu' 'krb5' 'fontconfig' 'libx11' 'libxcursor' 'libxrandr')
makedepends=('dotnet-sdk>=10.0' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alper-han/CrossMacro/archive/v${pkgver}.tar.gz")
sha256sums=('c3a9a401a942d49de7df96115a387e772e9739a296d5df1484c8d207460f466b')
options=('!strip')

build() {
    cd "CrossMacro-${pkgver}"
    
    # Restore and build .NET application
    dotnet restore
    dotnet publish src/CrossMacro.UI/CrossMacro.UI.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained false \
        -o publish/
}

package() {
    cd "CrossMacro-${pkgver}"
    
    # Install application files
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r publish/* "$pkgdir/usr/lib/$pkgname/"
    
    # Create executable symlink
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/CrossMacro.UI" "$pkgdir/usr/bin/$pkgname"
    
    # Install icon
    install -Dm644 "src/CrossMacro.UI/Assets/mouse-icon.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    
    # Install desktop file
    install -Dm644 "scripts/assets/CrossMacro.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # Install license
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
