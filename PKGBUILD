# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=pyrefly
pkgbase=$_pkgname-git
pkgname=($pkgbase python-$pkgbase)
pkgver=1.0.0.r0.2362c07
pkgrel=1
pkgdesc='A fast type checker and language server for Python'
arch=(x86_64)
url=https://github.com/facebook/pyrefly
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
    cargo test --frozen --all-features
}

_package_common() {
    cd "$srcdir"/$_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname README.md
}

package_pyrefly-git() {
    _package_common
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$_pkgname
}

package_python-pyrefly-git() {
    depends=(python $_pkgname)

    _package_common
    python -m installer -d "$pkgdir" target/wheels/*.whl
    rm -rf "$pkgdir"/usr/bin
}
