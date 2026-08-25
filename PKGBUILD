# Maintainer: Zynix <crossmacro@zynix.net>
pkgname=crossmacro
pkgver=1.4.0
pkgrel=1
pkgdesc="Mouse and keyboard macro recorder with hotkeys, scheduling, and text expansion"
arch=('x86_64' 'aarch64')
url="https://github.com/alper-han/CrossMacro"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'fontconfig' 'libx11' 'libxcursor' 'libxrandr' 'polkit' 'libxtst' 'shadow' 'systemd' 'systemd-libs' 'libxkbcommon' 'icu')
makedepends=('dotnet-sdk>=10.0' 'clang' 'zlib')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alper-han/CrossMacro/archive/v1.4.0.tar.gz"
        "crossmacro.sysusers"
        "crossmacro-modules.conf")
sha256sums=('0edf9eb15159d17aa80a8e45e2675a84af037e59b59846ed945b9182a6dcb025'
            'SKIP'
            'SKIP')
install=crossmacro.install

build() {
    cd "CrossMacro-1.4.0"
    local target_rid
    case "${CARCH}" in
        x86_64)
            target_rid="linux-x64"
            ;;
        aarch64)
            target_rid="linux-arm64"
            ;;
        *)
            echo "Unsupported architecture: ${CARCH}" >&2
            return 1
            ;;
    esac
    
    export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
    dotnet restore -r "$target_rid"
    
    # Build UI
    dotnet publish src/CrossMacro.UI.Linux/CrossMacro.UI.Linux.csproj \
        -c Release \
        -r "$target_rid" \
        -p:CrossMacroPublishProfile=native-aot \
        -o publish/
        
    # Build Daemon
    dotnet publish src/CrossMacro.Daemon/CrossMacro.Daemon.csproj \
        -c Release \
        -r "$target_rid" \
        -p:CrossMacroPublishProfile=native-aot \
        -o publish-daemon/
}

package() {
    cd "CrossMacro-1.4.0"
    
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
    install -Dm644 "scripts/assets/io.github.alper_han.crossmacro.policy" \
        "$pkgdir/usr/share/polkit-1/actions/io.github.alper_han.crossmacro.policy"
        
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
        "$pkgdir/usr/share/applications/CrossMacro.desktop"
    sed -i 's|Exec=crossmacro|Exec=/usr/lib/crossmacro/CrossMacro.UI|g' \
        "$pkgdir/usr/share/applications/CrossMacro.desktop"

    # Install man page
    install -Dm644 "docs/man/crossmacro.1" \
        "$pkgdir/usr/share/man/man1/crossmacro.1"
    
    # Install license
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
