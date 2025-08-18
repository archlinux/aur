# Maintainer: Aira Hinano <hinanoaira at hinasense dot jp>
pkgname=vrcx
pkgver=2025.08.17
pkgrel=2
pkgdesc="Friendship management tool for VRChat (built with Electron)"
arch=('x86_64')
url="https://github.com/vrcx-team/VRCX"
license=('MIT')
depends=('dotnet-runtime-9.0' 'electron' 'gtk3' 'nss' 'libxss' 'gconf' 'libxrandr' 'alsa-lib')
makedepends=('dotnet-sdk-9.0' 'git' 'nodejs' 'npm' 'imagemagick')
conflicts=('vrcx-bin')
options=(!debug !lto)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/vrcx-team/VRCX/archive/refs/tags/v$pkgver.tar.gz"
    "vrcx.desktop"
    "build.patch"
)
sha256sums=('f7d825cd8e4ba603aeeb24860473063999cd33586ebecb442b09fb8f50404e90'
            '078bd22b5ee6979942b366759eeb1758a7198864a7ef5b02f42cffe4cba5df26'
            '5f981884a64dce32575d020c2dd81a31bef99514e0301b5af5f4a55e820811e4')
            
prepare() {
    cd "$srcdir/VRCX-$pkgver"
    patch -p1 < "$srcdir/build.patch"
    echo "2021.01.01" > Version
    npm ci
}

build() {
    cd "$srcdir/VRCX-$pkgver"
    
    dotnet build 'Dotnet/VRCX-Electron.csproj' \
        -p:Configuration=Release \
        -p:Platform=x64 \
        -p:RestorePackagesConfig=true \
        -t:"Restore;Clean;Build" \
        -m --self-contained
    
    npm run prod-linux
    npm run build-electron
}

package() {
    cd "$srcdir/VRCX-$pkgver"
    
    install -dm755 "$pkgdir/opt/vrcx"
    cp -r build/linux-unpacked/* "$pkgdir/opt/vrcx/"
    chmod +x "$pkgdir/opt/vrcx/vrcx"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/vrcx/vrcx" "$pkgdir/usr/bin/vrcx"
    
    install -Dm644 "$srcdir/vrcx.desktop" "$pkgdir/usr/share/applications/vrcx.desktop"
    
    # Install icons in multiple sizes
    for size in 32 64 128 256 512; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        convert "VRCX.png" -resize "${size}x${size}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vrcx.png"
    done
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    for readme in README.*.md; do
        if [ -f "$readme" ]; then
            install -Dm644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
        fi
    done
}
