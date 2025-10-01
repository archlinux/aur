# Maintainer: kazu0617 <archlinux at kazu0617 dot net>
pkgname=xyvr
pkgver=0.0.1alpha.10
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="XYVR is an address book application that lets you search through your VRChat, Resonite, and ChilloutVR contacts."
license=('MIT')
depends=('dotnet-runtime-9.0' 'webkit2gtk')
makedepends=('dotnet-sdk-9.0' 'nodejs' 'npm' 'imagemagick')
options=(!debug !lto)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/hai-vr/XYVR/archive/refs/tags/0.0.1-alpha.10.tar.gz"
    "xyvr.desktop"
)
sha256sums=('c42385f66ecabf9678deb8e7fceb7d35b47a66c92e655c4162232aa83f2a6d9c'
            '7afe9d6bba26750d3c963e7c78b8ecf1b7fa7763ff4c995d38b75327edd7d83c')

prepare() {
    cd "$srcdir/XYVR-0.0.1-alpha.10"
    echo "$pkgver" > Version
}

build() {
    cd "$srcdir/XYVR-0.0.1-alpha.10/ui-frontend/src"
    npm install
    npm run build-and-copy

    cd "$srcdir/XYVR-0.0.1-alpha.10"
    dotnet publish ui-photino-linux/ui-photino-linux.csproj \
        --runtime linux-x64 \
        --self-contained true \
        --configuration Release \
        --output "build/linux-unpacked"
}

package() {
    cd "$srcdir/XYVR-0.0.1-alpha.10"

    install -dm755 "$pkgdir/opt/xyvr"
    cp -r build/linux-unpacked/* "$pkgdir/opt/xyvr/"
    chmod +x "$pkgdir/opt/xyvr/xyvr"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/xyvr/xyvr" "$pkgdir/usr/bin/xyvr"

    install -Dm644 "$srcdir/xyvr.desktop" "$pkgdir/usr/share/applications/xyvr.desktop"

    # Install icons in multiple sizes
    for size in 32 64 128 256 512; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        convert "build/linux-unpacked/icon.png" -resize "${size}x${size}" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/xyvr.png"
    done

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    for readme in README.*.md; do
        if [ -f "$readme" ]; then
            install -Dm644 "$readme" "$pkgdir/usr/share/doc/$pkgname/$readme"
        fi
    done
}
