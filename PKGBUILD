# Maintainer: Flack74 <puspendrachawlax@gmail.com>

pkgname=pom
pkgver=2.2.0
pkgrel=1
pkgdesc="Advanced Pomodoro timer with daemon web UI, CLI controls via browser, AI insights, and plugin system. Zero dependencies."
arch=("x86_64")
url="https://github.com/Flack74/pom"
license=("MIT")
optdepends=("pulseaudio: for sound notifications"
            "pipewire-pulse: for sound notifications (pipewire users)")
makedepends=("go" "git")
source=("git+https://github.com/Flack74/pom.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/pom"
    export CGO_ENABLED=0
    export GO111MODULE=on
    
    # Get build info
    VERSION=$(git describe --tags --always --dirty 2>/dev/null || echo "v$pkgver")
    BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    GIT_COMMIT=$(git rev-parse HEAD 2>/dev/null || echo "unknown")
    
    # Build with version info
    go build -ldflags "-s -w -X github.com/Flack74/pom/cmd.version=$VERSION -X github.com/Flack74/pom/cmd.buildDate=$BUILD_DATE -X github.com/Flack74/pom/cmd.gitCommit=$GIT_COMMIT" -o pom .
}

package() {
    cd "$srcdir/pom"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
