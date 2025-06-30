# Maintainer: Flack <puspendrachawlax@gmail.com>
pkgname=pom
pkgver=1.0.1
pkgrel=2
pkgdesc="A beautiful and feature-rich CLI Pomodoro timer with notifications and sound alerts"
arch=("x86_64" "aarch64")
url="https://github.com/Flack74/pom"
license=("MIT")
depends=("libnotify" "pulseaudio" "zenity")
makedepends=("go" "git")
source=("git+https://github.com/Flack74/pom.git#tag=v${pkgver}")
sha256sums=("SKIP")

prepare() {
    cd "$pkgname"
    mkdir -p build/
    # Fix module path
    find . -type f -name "*.go" -exec sed -i 's|"pom/|"github.com/Flack74/pom/|g' {} +
# Ensure module name is correct in go.mod
sed -i 's|module github.com/Flack74/Pom|module github.com/Flack74/pom|g' go.mod
}

build() {
cd "$pkgname"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

# Ensure we're using Go modules
export GO111MODULE=on
go mod tidy
go mod download
go build -o build/pom
}

package() {
cd "$pkgname"
install -Dm755 build/pom "$pkgdir/usr/bin/pom"
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
install -Dm644 packaging/man/pom.1 "$pkgdir/usr/share/man/man1/pom.1"
gzip -9 "$pkgdir/usr/share/man/man1/pom.1"
}
