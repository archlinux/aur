# Maintainer: xeyossr (axrona)
# Description: 🚀🌠 A minimal, fast, and customizable prompt written in Go

pkgname=pulsarship
pkgver=0.2.4
pkgrel=1
pkgdesc="🚀🌠 A minimal, fast, and customizable prompt written in Go"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/axrona/pulsarship"
license=('GPL3')
depends=()
makedepends=('go' 'git')

source=("git+https://github.com/axrona/pulsarship.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    export TAG=$(git describe --tags)
    export COMMIT=$(git rev-parse --short HEAD)
    export BUILDTIME=$(date -u +%Y-%m-%dT%H:%M:%SZ)
    export GO_BUILDENV=$(go version)

    LDFLAGS="-X 'main.version=${pkgver}' \
             -X 'main.tag=${TAG}' \
             -X 'main.commit=${COMMIT}' \
             -X 'main.buildTime=${BUILDTIME}' \
             -X 'main.buildEnv=${GO_BUILDENV}'"

    mkdir -p build
    go build -ldflags "$LDFLAGS" -o build/pulsarship
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "build/pulsarship" "$pkgdir/usr/bin/$pkgname"

    [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    _bash="$pkgdir/usr/share/bash-completion/completions"
    _fish="$pkgdir/usr/share/fish/vendor_completions.d"
    _zsh="$pkgdir/usr/share/zsh/site-functions"

    install -dm755 "$_bash" "$_fish" "$_zsh"

    ./build/pulsarship -v >"$_bash/pulsarship"
    ./build/pulsarship -v >"$_fish/pulsarship.fish"
    ./build/pulsarship -v >"$_zsh/_pulsarship"
}
