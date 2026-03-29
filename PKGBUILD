# Maintainer: Tu Nombre <tu@email.com>
pkgname=tofu
pkgver=0.0.3
pkgrel=1
pkgdesc="Offline, encrypted TOTP manager for the terminal. Trust On First Use."
arch=('x86_64')
url="https://github.com/Thecloudff7/tofu"
license=('MIT')
depends=('dotnet-runtime-10.0')
makedepends=('dotnet-sdk-10.0')
conflicts=('tofu-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ad24f587619f0c7627753535cb89ac9088aa07b2b3ebf968bfeceaa6e685744')

build() {
    cd "$pkgname-$pkgver"
    export DOTNET_NOLOGO=true
    export DOTNET_CLI_TELEMETRY_OPTOUT=true
    dotnet publish Tofu.csproj \
        -c Release \
        -r linux-x64 \
        --self-contained false \
        -o "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/tofu"
    cp -r "$srcdir/publish/"* "$pkgdir/usr/lib/tofu/"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/tofu" << 'EOF'
#!/bin/sh
exec /usr/lib/tofu/tofu "$@"
EOF
    chmod +x "$pkgdir/usr/bin/tofu"
}
