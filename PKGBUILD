# Maintainer: Crazygiscool <crazygiscool@proton.me>
pkgname=primecore
pkgver=1.2.3
pkgrel=1
pkgdesc="File integrity monitoring with VirusTotal and Abuse.ch integration"
arch=('x86_64')
url="https://github.com/crazygiscool/primecore"
license=('MIT')
depends=('python' 'python-requests' 'python-toml')
makedepends=('go' 'git' 'python-nuitka')
provides=('primecore')
conflicts=('primecore-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crazygiscool/primecore/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i "s|crazygiscool|$(echo "$url" | sed 's|https://github.com/||' | sed 's|/.*||')|g" go-watcher/go.mod || true
}

build() {
    cd "$pkgname-$pkgver"

    # Build Go watcher
    cd go-watcher
    go mod tidy
    go build -o ../bin/primecore-go main.go

    # Compile Python service with Nuitka
    cd ../python-service
    python -m nuitka --standalone --onefile --follow-imports service.py
}

package() {
    cd "$pkgname-$pkgver"

    # Install Go watcher binary
    install -Dm755 bin/primecore-go "$pkgdir/usr/bin/primecore-go"

    # Install compiled Python service
    install -Dm755 python-service/service.dist/service "$pkgdir/usr/bin/primecore-service"

    # Install config
    install -Dm644 python-service/config.toml "$pkgdir/etc/primecore/config.toml"
    sed -i 's|watcher_binary = "../bin/primecore-go"|watcher_binary = "/usr/bin/primecore-go"|' "$pkgdir/etc/primecore/config.toml"

    # Create example env (users copy and fill)
    install -Dm644 example.secret.env "$pkgdir/etc/primecore/primecore.env.example"

    # Install systemd service
    install -Dm644 systemd/primecore.service "$pkgdir/usr/lib/systemd/system/primecore.service"
}