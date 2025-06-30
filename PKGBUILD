# Maintainer: Flack <puspendrachawlax@gmail.com>
pkgname=pom
pkgver=1.0.1
pkgrel=19
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
    
    # Set up Go environment
    export GOPATH="${srcdir}/gopath"
    export PATH="${GOPATH}/bin:${PATH}"
    
    # Create a new module with correct path
    rm -f go.mod go.sum
    go mod init github.com/Flack74/pom
    
    # Fix imports in all Go files
    find . -type f -name "*.go" -exec sed -i 's|"pom/|"github.com/Flack74/pom/|g' {} +

# Add required dependencies
cat >> go.mod << EOF
require (
github.com/spf13/cobra v1.9.1
golang.org/x/term v0.32.0
)

replace github.com/Flack74/pom => ./
EOF

# Initialize and update modules
go mod tidy

# Create temporary workspace
mkdir -p "${srcdir}/workspace/github.com/Flack74"
ln -sf "${srcdir}/${pkgname}" "${srcdir}/workspace/github.com/Flack74/pom"
cd "${srcdir}/workspace"
echo "go 1.21" > go.work
echo "use github.com/Flack74/pom" >> go.work

# Copy source files to GOPATH
mkdir -p "${GOPATH}/src/github.com/Flack74"
cp -r "${srcdir}/${pkgname}" "${GOPATH}/src/github.com/Flack74/pom"

# Create a temporary module for local development
cd "${srcdir}/${pkgname}"
cat > go.mod << EOF
module github.com/Flack74/pom

go 1.21

require (
github.com/spf13/cobra v1.9.1
golang.org/x/term v0.32.0
)
EOF
}

build() {
cd "${srcdir}/${pkgname}"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

# Ensure we're using Go modules
export GO111MODULE=on
go mod download
go build -o build/pom ./cmd/pom.go
}

package() {
cd "${srcdir}/${pkgname}"
install -Dm755 build/pom "$pkgdir/usr/bin/pom"
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
install -Dm644 packaging/man/pom.1 "$pkgdir/usr/share/man/man1/pom.1"
gzip -9 "$pkgdir/usr/share/man/man1/pom.1"
}
