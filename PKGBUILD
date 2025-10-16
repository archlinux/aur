# Maintainer: Aira Hinano <hinanoaira at hinasense dot jp>
# Co-Maintainer: kazu0617 <archlinux at kazu0617 dot net>
pkgname=vrcx
pkgver=2025.10.11
pkgrel=1
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

sha256sums=('8f385fc02f9e9821ea451a53cfef62413638e122b45af96e787fb116022e8b49'
            '3e40d0056adfd86848cf0bc594bf399d9fff1f894d470bad90d2b232d17f95c5'
            'cb78754ccba9d260e62e9b2d6f25668a98dbc71cf765e7aff173a5f43053c324')
            
prepare() {
    cd "$srcdir/VRCX-$pkgver"
    patch -p1 < "$srcdir/build.patch"
    echo "$pkgver" > Version

    # WORKAROUND: Upstream lock file is out of sync.
    # Prefer package.json until it gets fixed upstream.
    # npm ci

    npm install --package-lock-only --no-fund
    npm ci --no-fund
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
    
    npm run prod-linux --no-fund
    npm run build-electron --no-fund
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
        magick "images/VRCX.png" -resize "${size}x${size}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vrcx.png"
    done

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    for readme in README.*.md; do
        if [ -f "$readme" ]; then
            install -Dm644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
        fi
    done
}
