# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=toaster
pkgver=0.4.11
pkgrel=2
pkgdesc='Hears whatever is playing and writes it out as live Strudel code, with visuals'
arch=(
    'x86_64'
)
url='https://github.com/StopBanning/toaster'
license=('MIT')
depends=('electron44')
makedepends=(
    'npm'
    'nodejs'
    'git'
)
options=(!debug)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'toaster.desktop'
)
sha256sums=(
    '0fa19818f32b3309f5e0614264badf8d3696184fbeeaa15fb8143b8b76538612'
    'd8716162035147616f5702802e039456968fa2d594c070d4a6ede66845caa01c'
)

prepare() {
    cd "$pkgname-$pkgver"
    npm install --package-lock-only --ignore-scripts
}

build() {
    cd "$pkgname-$pkgver"
    npm ci --omit=dev
}

package() {
    cd "$pkgname-$pkgver"

    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r node_modules package.json . "$pkgdir/usr/lib/$pkgname/"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
exec electron44 /usr/lib/toaster --disable-gpu-sandbox "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    install -Dm644 build/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

    install -Dm644 ../toaster.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
