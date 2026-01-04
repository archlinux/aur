# Maintainer: Aira Hinano <hinanoaira at hinasense dot jp>
# Co-Maintainer: kazu0617 <archlinux at kazu0617 dot net>
pkgname=vrcx
pkgver=2026.01.04
pkgrel=1
pkgdesc="Friendship management tool for VRChat (built with Electron)"
arch=('x86_64')
url="https://github.com/vrcx-team/VRCX"
license=('MIT')
depends=('dotnet-runtime-9.0' 'electron' 'gtk3' 'nss' 'libxss' 'libxrandr' 'alsa-lib')
makedepends=('dotnet-sdk-9.0' 'git' 'nodejs' 'npm' 'imagemagick')
conflicts=('vrcx-bin')
options=(!debug !lto)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/vrcx-team/VRCX/archive/refs/tags/v$pkgver.tar.gz"
    "vrcx.desktop"
    "build.patch"
)

sha256sums=('9364e447a2c7d8e0693e6448f56d8c67689e4f9cb12669bffb7c21a86735ab26'
            '3e40d0056adfd86848cf0bc594bf399d9fff1f894d470bad90d2b232d17f95c5'
            '3519827b3d8423d2441a4ac01a474f9f8ed8df1c09dea092de36da207a9c2eb1')
            
prepare() {
    cd "$srcdir/VRCX-$pkgver"
    patch -p1 < "$srcdir/build.patch"
    echo "$pkgver" > Version
    echo "" > .no-updater

    npm ci --loglevel=error
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
    
    npm run prod-linux --no-fund --loglevel=error
    npm run build-electron --no-fund --loglevel=error
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
