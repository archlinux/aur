# Maintainer: Oliwier <szerwigi14@gmail.com>
pkgname=cpuinfo-git
pkgver=2025.09.21.rc40647b
pkgrel=1
pkgdesc="cpuinfo is a simple tool to check your cpu specs. (git version)"
arch=('any')
url="https://github.com/Szerwigi1410/cpuinfo"
license=('MIT')
depends=('bash' 'util-linux')
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
    echo "🧹 Preparing cpuinfo script..."
    cp "$srcdir/$pkgname/cpuinfo.sh" "$srcdir/"
}

package() {
    echo "📦 Installing cpuinfo..."
    install -Dm755 "$srcdir/cpuinfo.sh" "$pkgdir/usr/bin/cpuinfo"
}

clean() {
    echo "💣 Nuking old build artifacts..."
    rm -f "$PWD"/*.pkg.tar.* "$PWD"/*.log
}

post_install() {
    echo "♻️ Removing any old system binary..."
    if [[ -f /usr/bin/cpuinfo ]]; then
        rm -f /usr/bin/cpuinfo
    fi
}

post_upgrade() {
    echo "🔄 Updating... removing outdated cpuinfo..."
    if [[ -f /usr/bin/cpuinfo ]]; then
        rm -f /usr/bin/cpuinfo
    fi
}
