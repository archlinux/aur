# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=bond
pkgver=2.2.0
pkgrel=1
pkgdesc='Encrypted, quantum-safe and repairable backups for storage you have no reason to trust'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/bond'
# BOND's own license, then the terms of the 7-Zip build embedded in the binary
license=('MIT' 'LGPL-2.1-or-later' 'BSD-3-Clause' 'BSD-2-Clause' 'LicenseRef-unRAR')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# The 7-Zip package tools/manifest.json pins for each architecture's embedded binary; tools/fetch unpacks it itself
source_x86_64=('https://github.com/ip7z/7zip/releases/download/26.06/7z2606-linux-x64.tar.xz')
source_aarch64=('https://github.com/ip7z/7zip/releases/download/26.06/7z2606-linux-arm64.tar.xz')
noextract=('7z2606-linux-x64.tar.xz' '7z2606-linux-arm64.tar.xz')
sha256sums=('e53571a33db18e3e7359549569a4474c886edf6d3023f0943518bd2a6efc2e56')
sha256sums_x86_64=('2b539cf067b2ad48e1baa5093dbaa8818b73542d1222a0ffde9dc5f2922ea62e')
sha256sums_aarch64=('edcc408aacce77da5223728f2eceb5e9f6dc713b8a9df934ad21e2a7f7560627')

# The module cache stays inside $srcdir, so the build leaves nothing in ~/go
_goenv() {
    export GOPATH="$srcdir/gopath"
    export GOFLAGS='-mod=readonly -modcacherw'
}

# The Go architecture this package builds for
_goarch() {
    case "$CARCH" in
        x86_64) echo amd64 ;;
        aarch64) echo arm64 ;;
    esac
}

prepare() {
    cd "$pkgname-$pkgver"
    _goenv
    go mod download
    # tools/fetch takes a download from its cache when the hash matches the manifest, so with makepkg's checked copy
    # there it unpacks and installs this architecture's embedded binary without going online
    mkdir -p tools/download-cache
    local file
    for file in "${noextract[@]}"; do
        if [ -e "$srcdir/$file" ]; then
            cp "$srcdir/$file" tools/download-cache/
        fi
    done
    go run ./tools/fetch --target "linux/$(_goarch)"
}

build() {
    cd "$pkgname-$pkgver"
    _goenv
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="$GOFLAGS -buildmode=pie -trimpath"
    # -ldflags given here replaces any in GOFLAGS, so -linkmode=external has to be repeated
    go build -ldflags "-linkmode=external -X main.Version=$pkgver" -o bond ./cmd/bond
}

check() {
    cd "$pkgname-$pkgver"
    _goenv
    go test ./...
    # Unpacks the embedded 7-Zip and round-trips an archive through it: what no test of the source tree can show
    ./bond selftest
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bond -t "$pkgdir/usr/bin"
    install -Dm644 README.md NERDME.md config.sample.json -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "tools/licenses/7zz-linux-$(_goarch).txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-7-Zip.txt"
}
