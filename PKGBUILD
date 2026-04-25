# Maintainer: Kostiantyn Kushnir <...>
pkgname=openusage-cli-git
pkgver=r0.0.0
pkgrel=1
pkgdesc="HTTP daemon for executing OpenUsage plugins and exposing local usage snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/chpock/openusage-cli"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git' 'cmake' 'clang' 'nasm')
options=(!lto)
optdepends=('opencode: AI assistant integration')
provides=("openusage-cli=$pkgver")
conflicts=('openusage-cli')
source=("git+https://github.com/chpock/openusage-cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "openusage-cli"

    # Use latest tag for monotonic versioning, fallback to commit count
    local tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
    local commits=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)

    if [ -n "$tag" ]; then
        # Tag-based version: 0.2.0.r123.gabc1234
        local version="${tag#v}"
        echo "${version}.r${commits}.g${hash}"
    else
        # No tags yet: 0.0.0.r123.gabc1234
        echo "0.0.0.r${commits}.g${hash}"
    fi
}

build() {
    cd "openusage-cli"
    export CARGO_TARGET_DIR=target

    # Generate semver-compatible version with git info
    local tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
    local commits=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)

    if [ -n "$tag" ]; then
        # Semver with build metadata: 1.2.3+150.gabc1234
        local version="${tag#v}"
        export OPENUSAGE_BUILD_VERSION="${version}+${commits}.g${hash}"
    else
        # No tags yet, use 0.0.0 as base
        export OPENUSAGE_BUILD_VERSION="0.0.0+${commits}.g${hash}"
    fi

    /usr/bin/cargo build --locked --release
}

package() {
    cd "openusage-cli"

    # Install binary
    install -Dm755 "target/release/openusage-cli" "$pkgdir/usr/bin/openusage-cli"

    # Install plugins
    install -dm755 "$pkgdir/usr/share/openusage-cli/openusage-plugins"
    cp -a vendor/openusage/plugins/. "$pkgdir/usr/share/openusage-cli/openusage-plugins/"

    # Install plugin overrides
    install -dm755 "$pkgdir/usr/share/openusage-cli/plugin-overrides"
    cp -a plugin-overrides/. "$pkgdir/usr/share/openusage-cli/plugin-overrides/"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
