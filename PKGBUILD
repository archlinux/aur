# Maintainer: Aira Hinano <hinanoaira at hinasense dot jp>
# Co-Maintainer: kazu0617 <archlinux at kazu0617 dot net>
pkgname=vrcx
pkgver=2025.09.10
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

sha256sums=('d898044dac496e1d621f2388cec024df9d94999f6b8d8f92ac2bf33a036febf5'
            '3e40d0056adfd86848cf0bc594bf399d9fff1f894d470bad90d2b232d17f95c5'
            '8b464aaa69ad89fd6e14e5d65e138b668f54e074a2c9bfcb99dacca90550377d')
            
prepare() {
    cd "$srcdir/VRCX-$pkgver"
    patch -p1 < "$srcdir/build.patch"
    echo "$pkgver" > Version
    npm ci
}

build() {
    cd "$srcdir/VRCX-$pkgver"
    
    dotnet build 'Dotnet/VRCX-Electron.csproj' \
        -p:Configuration=Release \
        -p:Platform=x64 \
        -p:PlatformTarget=x64 \
        -p:RestorePackagesConfig=true \
        -t:"Restore;Clean;Build" \
        -m -r linux-x64
    
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
    for size in 16 24 32 64 128 256 512; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick "VRCX.png" -resize "${size}x${size}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vrcx.png"
    done

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    for readme in README.*.md; do
        if [ -f "$readme" ]; then
            install -Dm644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
        fi
    done
}
