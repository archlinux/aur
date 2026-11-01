# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=toaster
pkgver=0.4.29
pkgrel=1
pkgdesc='Hears whatever is playing and writes it out as live Strudel code, with visuals'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/StopBanning/toaster'
license=('MIT')
depends=('electron44')
makedepends=(
    'npm'
    'nodejs'
    'git'
    'patch'
)
options=(!debug)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'toaster.desktop'
    '0001-clean-remove-the-auto-update-functionality.patch'
    '0002-chore-npm-update-the-packages.patch'
)
sha256sums=(
    '199487c968fe70064e98e10faffd547d46d7fa1db1aac0d6d7c97154dbb085bb'
    'd8716162035147616f5702802e039456968fa2d594c070d4a6ede66845caa01c'
    '8b5376b277fb9bba6ad41d55a2fed3a6802504990fda72774cb057ab007cbaed'
    '84bb64037873a10a98999cccf1a14062f083cb402348e6d366887650098bd902'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../0001-clean-remove-the-auto-update-functionality.patch
    patch -p1 < ../0002-chore-npm-update-the-packages.patch
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
