# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>

pkgname=bedrockboot
pkgver=2.1.10.98
pkgrel=1
pkgdesc="Industrial Grade Minecraft Bedrock Edition Launcher for Windows & Linux"
arch=('x86_64')
url="https://github.com/Round-Studio/BedrockBoot"
license=('GPL-3.0-only')
depends=('dotnet-runtime-10.0'
         'fontconfig'
         'freetype2'
         'zlib'
         'bzip2'
         'libpng'
         'brotli')
makedepends=('dotnet-sdk-10.0' 'git')
source=(
    "$pkgname::git+${url}.git#tag=v${pkgver}"
    "OnePointUI.Avalonia::git+https://github.com/Round-Studio/OnePointUI.Avalonia.git"
    "Round.SDK::git+https://github.com/Round-Studio/Round.SDK.git"
    "PeNet::git+https://github.com/Round-Studio/PeNet.git"
    "PaperConnect::git+https://github.com/Round-Studio/PaperConnect.git"
    "ResourcePackConvert::git+https://github.com/BE-Community-Dev/ResourcePackConvert.git"
    "LiteSkinViewer::git+https://github.com/Round-Studio/LiteSkinViewer.git"
    "PreLoadCpp::git+https://github.com/Round-Studio/PreLoadCpp.git"
    "CrashStackAnalyzer::git+https://github.com/Round-Studio/CrashStackAnalyzer.git"
    "disable-update-check.patch"
)
sha256sums=('8983be82d9ef8ba21355cab9b02ada8bfd38a61f86d860a10c75fd6da648c3d6'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '7dce907b5c92972c6524c5fd078789287e0753f472c13981948146494a0bd1e5')

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.src/OnePointUI.Avalonia.url "$srcdir/OnePointUI.Avalonia"
    git config submodule.src/Round.SDK.url "$srcdir/Round.SDK"
    git config submodule.src/PeNet.url "$srcdir/PeNet"
    git config submodule.src/PaperConnect.url "$srcdir/PaperConnect"
    git config submodule.src/ResourcePackConvert.url "$srcdir/ResourcePackConvert"
    git config submodule.src/LiteSkinViewer.url "$srcdir/LiteSkinViewer"
    git config submodule.src/PreLoadCpp.url "$srcdir/PreLoadCpp"
    git config submodule.src/CrashStackAnalyzer.url "$srcdir/CrashStackAnalyzer"
    git -c protocol.file.allow=always submodule update

    # 应用补丁：禁用内置更新检查（Arch Linux 通过 pacman 管理更新）
    echo "应用禁用更新检查补丁..."
    patch -p1 < "$srcdir/disable-update-check.patch"
}

build() {
    cd "$pkgname"
    dotnet publish src/BedrockBoot/BedrockBoot.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained false \
        -p:Version="${pkgver}" \
        -p:DebugType=none \
        -o build-output
}

package() {
    cd "$pkgname"

    # Install application files
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r build-output/* "$pkgdir/opt/$pkgname/"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec dotnet /opt/bedrockboot/BedrockBoot.dll "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << 'EOF'
[Desktop Entry]
Name=BedrockBoot
Comment=Industrial Grade Minecraft Bedrock Edition Launcher
Exec=/usr/bin/bedrockboot
Icon=bedrockboot
Terminal=false
Type=Application
Categories=Game;
Keywords=minecraft;bedrock;launcher;
EOF

    # Install icon
    install -Dm644 assets/BedrockBoot.Icon.512x.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/bedrockboot.png"
    install -Dm644 assets/BedrockBoot.Icon.256x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/bedrockboot.png"
}
