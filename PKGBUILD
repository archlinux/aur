# Maintainer: Flack <puspendrachawlax@gmail.com>
pkgname=pom
pkgver=1.0.2
pkgrel=4
pkgdesc="A beautiful and feature-rich CLI Pomodoro timer with notifications and sound alerts"
url="https://github.com/Flack74/pom"
arch=("x86_64" "aarch64")
license=("MIT")
depends=("libnotify" "pulseaudio" "zenity")
makedepends=("go" "git")

build() {
    # Use absolute paths to handle spaces
    local _builddir="${startdir}"
    
    # Set up Go environment
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOCACHE="${_builddir}/.cache/go-build"
    export GOMODCACHE="${_builddir}/.cache/go-mod"

    _builddate=$(date -u '+%Y-%m-%d %H:%M:%S UTC')
    _commit=$(git -C "${_builddir}" rev-parse --short HEAD 2>/dev/null || echo "unknown")

    cd "${_builddir}"

    # Build the binary
    go build -v \
        -ldflags="-linkmode=external \
                  -X 'main.version=${pkgver}' \
                  -X 'main.buildDate=${_builddate}' \
                  -X 'main.gitCommit=${_commit}'" \
        -o pom
}

package() {
    local _builddir="${startdir}"
    cd "${_builddir}"

    # Create directories
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/man/man1"

    # Install binary and documentation
    install -Dm755 pom "${pkgdir}/usr/bin/pom"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "packaging/man/pom.1" "${pkgdir}/usr/share/man/man1/pom.1"
}

# check() {
#     local _builddir="${startdir}"
#     cd "${_builddir}"
#     go test -v ./...
# }