# Maintainer: kazu0617 <archlinux at kazu0617 dot net>
pkgname=xyvr
pkgver=0.0.1_alpha.15
pkgrel=1
pkgdesc="It is an address book application that lets you search through your VRChat, Resonite, and ChilloutVR contacts."
arch=('x86_64')
url="https://github.com/hai-vr/XYVR/"
license=('MIT')
depends=('aspnet-runtime-9.0' 'webkit2gtk')
makedepends=('dotnet-sdk-9.0' 'nodejs' 'npm' 'imagemagick')
options=(!debug !lto)
_tag=${pkgver//_/-}
_srcdir="XYVR-${_tag}"
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/hai-vr/XYVR/archive/refs/tags/${_tag}.tar.gz"
    "xyvr.desktop"
)
sha256sums=('85067a02ab25d27e4b9843f929925430909dd12c3bd85f68f1cbe3b4226cda8d'
            '5322356af793f1671f0f49347ae6f9dd31aeb9492e65055c01bb69534180c623')


prepare() {
    cd "$srcdir/${_srcdir}"
}

build() {
    cd "$srcdir/${_srcdir}/ui-frontend/src"
    npm ci --no-audit --no-fund
    #npm install
    npm run build-and-copy

    cd "$srcdir/${_srcdir}"
    dotnet publish ui-photino-linux/ui-photino-linux.csproj \
        --runtime linux-x64 \
        --self-contained false \
        --configuration Release \
        --output "build/linux-unpacked"
}

package() {
    cd "$srcdir/${_srcdir}"

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
