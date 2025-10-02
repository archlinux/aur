# Maintainer: kazu0617 <archlinux at kazu0617 dot net>
pkgname=xyvr
pkgver=0.0.1_alpha.11
pkgrel=4
pkgdesc="XYVR is an address book application that lets you search through your VRChat, Resonite, and ChilloutVR contacts."
arch=('x86_64')
url="https://github.com/hai-vr/XYVR/"
license=('MIT')
depends=('aspnet-runtime-9.0' 'webkit2gtk')
makedepends=('dotnet-sdk-9.0' 'nodejs' 'npm' 'imagemagick')
options=(!debug !lto)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/hai-vr/XYVR/archive/refs/tags/0.0.1-alpha.11.tar.gz"
    "xyvr.desktop"
)
sha256sums=('297695de91f04d9b7045ced04845459f36ef54eeac037d98a0f7c790c32d634a'
            '0b0464c946c0eb4619ff19b2c43b6a5b1d91b2a09e6254c867288414b41211d4')

prepare() {
    cd "$srcdir/XYVR-0.0.1-alpha.11"
    echo "$pkgver" > Version
}

build() {
    cd "$srcdir/XYVR-0.0.1-alpha.11/ui-frontend/src"
    npm install
    npm run build-and-copy

    cd "$srcdir/XYVR-0.0.1-alpha.11"
    dotnet publish ui-photino-linux/ui-photino-linux.csproj \
        --runtime linux-x64 \
        --self-contained false \
        --configuration Release \
        --output "build/linux-unpacked"
}

package() {
    cd "$srcdir/XYVR-0.0.1-alpha.11"

    install -dm755 "$pkgdir/opt/xyvr"
    cp -r build/linux-unpacked/* "$pkgdir/opt/xyvr/"
    chmod +x "$pkgdir/opt/xyvr/xyvr"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/xyvr/xyvr" "$pkgdir/usr/bin/xyvr"

    install -Dm644 "$srcdir/xyvr.desktop" "$pkgdir/usr/share/applications/xyvr.desktop"

    # Install icons in multiple sizes
    for size in 32 64 128 256 512; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick "build/linux-unpacked/icon.png" -resize "${size}x${size}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/xyvr.png"
    done

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    for readme in README.*.md; do
        if [ -f "$readme" ]; then
            install -Dm644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
        fi
    done
}
