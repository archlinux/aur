# Maintainer: Eloreden <luca.morleschi@outlook.it>
pkgname=protonaut-git
pkgver=r4.4db1c4c
pkgrel=1
pkgdesc="A desktop companion dashboard for your Steam/Proton library on Linux, built with Wails (Go + React)"
arch=('x86_64')
url="https://github.com/Eloreden/protonaut"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('go' 'npm' 'git' 'imagemagick')
optdepends=(
    'steam: to actually own and run the games Protonaut manages'
    'protontricks: required for auto-launched companion tools'
)
provides=('protonaut')
conflicts=('protonaut')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    cd frontend
    npm ci
    npm run build
    cd ..

    export CGO_ENABLED=1
    go build -trimpath -tags webkit2_41,desktop,production \
        -ldflags "-w -s" \
        -o protonaut .
}

package() {
    cd "$pkgname"

    install -Dm755 protonaut "$pkgdir/usr/bin/protonaut"
    install -Dm644 packaging/linux/protonaut.desktop \
        "$pkgdir/usr/share/applications/protonaut.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for size in 256 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick build/appicon.png -resize ${size}x${size} \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/protonaut.png"
    done
}
