# Maintainer: Oliwier <szerwigi14@gmail.com>
pkgname=brokefetch-mod
pkgver=2025.08.16.rfcae890
pkgrel=1
pkgdesc="A broken neofetch clone script 💀 (mod version with logos)"
arch=('any')
url="https://github.com/Szerwigi1410/brokefetch"
license=('MIT')
depends=('bash' 'git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    local hash date
    hash=$(git rev-parse --short HEAD)
    date=$(git log -1 --format=%cd --date=format:'%Y.%m.%d')
    echo "${date}.r${hash}"
}

prepare() {
    echo "🧹 Preparing mod script..."
    cp "$srcdir/$pkgname/brokefetch_mod.sh" "$srcdir/"
}

package() {
    echo "📦 Installing mod script..."
    install -Dm755 "$srcdir/brokefetch_mod.sh" "$pkgdir/usr/bin/brokefetch-mod"

    echo "🖼️ Installing logos folder from repo..."
    install -d "$pkgdir/usr/share/brokefetch/logos/logos/"
    cp -r "$srcdir/$pkgname/logos/"* "$pkgdir/usr/share/brokefetch/logos/logos/"
}

clean() {
    echo "💣 Nuking old build artifacts..."
    rm -f "$PWD"/*.pkg.tar.* "$PWD"/*.log
}

post_install() {
    echo "♻️ Cleaning old system binary (if any)..."
    if [[ -f /usr/bin/brokefetch-mod ]]; then
        rm -f /usr/bin/brokefetch-mod
    fi
}

post_upgrade() {
    echo "🔄 Updating... removing outdated mod script..."
    if [[ -f /usr/bin/brokefetch-mod ]]; then
        rm -f /usr/bin/brokefetch-mod
    fi
}

post_remove() {
    echo "🗑️ Removing brokefetch-mod leftovers..."
    if [[ -f /usr/bin/brokefetch-mod ]]; then
        rm -f /usr/bin/brokefetch-mod
    fi
    rm -rf /usr/share/brokefetch/logos/
}

