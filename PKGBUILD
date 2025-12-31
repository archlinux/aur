# Maintainer: Zynix <crossmacro@zynix.net>
pkgname=crossmacro
pkgver=0.8.3
pkgrel=1
pkgdesc="Cross-platform mouse and keyboard macro automation tool"
arch=('x86_64')
url="https://github.com/alper-han/CrossMacro"
license=('GPL-3.0')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'fontconfig' 'libx11' 'libxcursor' 'libxrandr' 'polkit' 'libxtst' 'systemd-libs')
makedepends=('dotnet-sdk>=10.0' 'git' 'clang' 'zlib')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alper-han/CrossMacro/archive/v${pkgver}.tar.gz"
        "crossmacro.sysusers"
        "crossmacro-modules.conf")
sha256sums=('20668fd4381b682ead6fbf6e8605e8f2f0d2b7b59b7531900f8fcc55a2acb734'
            'SKIP'
            'SKIP')  # sysusers and modules config checksums (local files)
install=crossmacro.install

build() {
    cd "CrossMacro-${pkgver}"
    
    export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
    dotnet restore -r linux-x64
    
    # Build UI
    dotnet publish src/CrossMacro.UI/CrossMacro.UI.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained true \
        -p:PublishSingleFile=true \
        -p:PublishTrimmed=true \
        -p:PublishReadyToRun=true \
        -p:PublishAot=false \
        -p:DebugType=None \
        -p:DebugSymbols=false \
        -o publish/
        
    # Build Daemon
    dotnet publish src/CrossMacro.Daemon/CrossMacro.Daemon.csproj \
        -c Release \
        -r linux-x64 \
        -o publish-daemon/
}

package() {
    cd "CrossMacro-${pkgver}"
    
    # Install UI files
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r publish/* "$pkgdir/usr/lib/$pkgname/"
    
    # Install Daemon files
    install -dm755 "$pkgdir/usr/lib/$pkgname/daemon"
    cp -r publish-daemon/* "$pkgdir/usr/lib/$pkgname/daemon/"
    
    # Ensure binaries have executable permissions
    chmod +x "$pkgdir/usr/lib/$pkgname/CrossMacro.UI"
    chmod +x "$pkgdir/usr/lib/$pkgname/daemon/CrossMacro.Daemon"
    
    # Install Service File
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "scripts/daemon/crossmacro.service" \
        "$pkgdir/usr/lib/systemd/system/crossmacro.service"
        

        
    # Install sysusers config
    install -Dm644 "$srcdir/crossmacro.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/crossmacro.conf"

    # Install modules-load config
    install -Dm644 "$srcdir/crossmacro-modules.conf" \
        "$pkgdir/usr/lib/modules-load.d/crossmacro.conf"
    
    # Install udev rules
    install -Dm644 "scripts/assets/99-crossmacro.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-crossmacro.rules"
        
    # Install Polkit Policy
    install -Dm644 "scripts/assets/org.crossmacro.policy" \
        "$pkgdir/usr/share/polkit-1/actions/org.crossmacro.policy"
        
    # Install Polkit Rules
    install -dm755 "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 "scripts/assets/50-crossmacro.rules" \
        "$pkgdir/usr/share/polkit-1/rules.d/50-crossmacro.rules"
    
    # Create executable symlink for UI
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/CrossMacro.UI" "$pkgdir/usr/bin/$pkgname"
    
    # Install icons
    install -dm755 "$pkgdir/usr/share/icons/hicolor"
    cp -r "src/CrossMacro.UI/Assets/icons/"* "$pkgdir/usr/share/icons/hicolor/"
    
    # Install desktop file
    install -Dm644 "scripts/assets/CrossMacro.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # Install license
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
