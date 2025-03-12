# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pkgname=ruff
pkgbase=$_pkgname-git
pkgname=($pkgbase python-$pkgbase)
pkgver=0.9.10.r35.6b84253
pkgrel=1
pkgdesc='An extremely fast Python linter and code formatter, written in Rust'
arch=(x86_64)
url=https://github.com/astral-sh/ruff
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
depends=(gcc-libs glibc)
makedepends=(cargo git maturin python-installer)
source=(git+$url)
sha256sums=(SKIP)
options=(!lto)

pkgver() {
    cd "$srcdir"/$_pkgname
    git describe --tags --long --abbrev=7 |\
        sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$srcdir"/$_pkgname
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$_pkgname
    export CARGO_TARGET_DIR=target
    maturin build --locked --release --all-features --strip
}

check() {
    cd "$srcdir"/$_pkgname
    cargo test -p ruff --frozen --all-features
}

_package_common() {
    cd "$srcdir"/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname \
        BREAKING_CHANGES.md CHANGELOG.md README.md
}

package_ruff-git() {
    _package_common
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
}

package_python-ruff-git() {
    depends=(python $_pkgname)

    _package_common
    python -m installer -d "$pkgdir" target/wheels/*.whl
    rm -rf "$pkgdir"/usr/bin
}
