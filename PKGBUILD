# Maintainer: Eloreden <luca.morleschi@outlook.it>
pkgname=protonaut-git
pkgver=0.1.8.r0.g06bf892
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

# Versione dai tag git: v0.1.6 -> 0.1.6.r0.g815e9c1 (r<commit dopo il tag>.g<hash>).
pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"

    cd frontend
    npm ci
    npm run build
    cd ..

    # Nel binario va la versione semver del tag (es. v0.1.6 o v0.1.6-2-gabc1234),
    # non il pkgver: l'updater la confronta con il tag dell'ultima release GitHub.
    local appver
    appver="$(git describe --tags --abbrev=7)"

    export CGO_ENABLED=1
    go build -trimpath -tags webkit2_41,desktop,production \
        -ldflags "-w -s -X main.Version=$appver" \
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
