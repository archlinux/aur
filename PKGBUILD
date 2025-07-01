# Maintainer: Flack74 <puspendrachawlax@gmail.com>

pkgname=pom
pkgver=1.0.2
pkgrel=4
pkgdesc="A CLI Pomodoro timer application"
arch=("x86_64")
url="https://github.com/Flack74/pom"
license=("MIT")
depends=("pulseaudio")
makedepends=("go>=1.24")

prepare() {
    mkdir -p "$srcdir/$pkgname-build"
    cp -r "$startdir"/* "$srcdir/$pkgname-build/"
    cd "$srcdir/$pkgname-build"
    go mod init github.com/Flack74/pom
    go mod tidy
}

build() {
    cd "$srcdir/$pkgname-build"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOWORK=off
    go build -o pom
}

package() {
    cd "$srcdir/$pkgname-build"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/man/pom.1 "$pkgdir/usr/share/man/man1/pom.1"
}
