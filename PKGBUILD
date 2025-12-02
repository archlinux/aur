# Maintainer: Zynix <crossmacro@zynix.net>
pkgname=crossmacro
pkgver=0.3.1
pkgrel=1
pkgdesc="Mouse Macro Automation Tool for Linux Wayland"
arch=('x86_64')
url="https://github.com/alper-han/CrossMacro"
license=('GPL-3.0')
depends=('zlib' 'openssl' 'icu' 'krb5' 'fontconfig' 'libx11' 'libxcursor' 'libxrandr')
makedepends=('dotnet-sdk>=10.0' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alper-han/CrossMacro/archive/v${pkgver}.tar.gz")
sha256sums=('218b7b200466a7fac2a9bc3abf971b1b7f8f743ac4ca8af48b17f230413eae70')
options=('!strip')

build() {
    cd "CrossMacro-${pkgver}"
    
    # Skip workload integrity check - resolves AUR build errors
    # CrossMacro doesn't use any special workloads (MAUI, Blazor, etc.)
    export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
    
    dotnet restore
    dotnet publish src/CrossMacro.UI/CrossMacro.UI.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -p:PublishTrimmed=false \
        -p:PublishAot=false \
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
