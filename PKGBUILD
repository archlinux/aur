# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgbase=nmstate
pkgname=(
    nmstate
    libnmstate
    python-libnmstate
)
pkgver=2.2.59
pkgrel=1
pkgdesc='Declarative network manager API for Linux hosts'
arch=('x86_64')
url='https://nmstate.io'
license=('Apache-2.0')
makedepends=(
    'cargo'
    'networkmanager'
    'python-build'
    'python-installer'
    'python-pyyaml'
    'python-setuptools'
    'python-wheel'
)
source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/nmstate/nmstate/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz"
    "$pkgbase-vendor-$pkgver.tar.xz::https://github.com/nmstate/nmstate/releases/download/v$pkgver/$pkgbase-vendor-$pkgver.tar.xz"
)
sha256sums=(
    '16ebda604f576c1cb9344dae46045048613339e88af99ae7b49e48237938ea4a'
    '69495b049ae7e88ec04375a557e47c9883b49f6309ec91c95c71ea26e5e296f4'
)

_pick() {
    local p="$1" f d; shift
    for f; do
        d="$srcdir/$p/${f#$pkgdir/}"
        mkdir -p "$(dirname "$d")"
        mv "$f" "$d"
        rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

prepare() {
    cd "$pkgbase-$pkgver"

    # Set up vendored Rust dependencies
    mv "$srcdir/vendor" rust/vendor
    mkdir -p rust/.cargo
    cat >> rust/.cargo/config.toml <<'EOF'
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "vendor"
EOF
}

build() {
    cd "$pkgbase-$pkgver"

    # Build Rust components (CLI + C library)
    cargo build --release --workspace --manifest-path rust/Cargo.toml

    # Generate man pages and C header/pkg-config from .in templates
    make manpage clib

    # Build Python bindings wheel
    cd rust/src/python
    python -m build --wheel --no-isolation
}

package_nmstate() {
    pkgdesc='Declarative network manager API - CLI tools and service'
    depends=(
        "libnmstate=$pkgver-$pkgrel"
        'networkmanager'
    )
    optdepends=(
        'python-libnmstate: Python bindings'
        'openvswitch: Open vSwitch support'
    )

    cd "$pkgbase-$pkgver"

    # Install everything via Makefile
    make install \
        DESTDIR="$pkgdir" \
        PREFIX=/usr \
        LIBDIR=/usr/lib \
        SYSCONFDIR=/etc \
        SYSTEMD_UNIT_DIR=/usr/lib/systemd/system \
        SKIP_PYTHON_INSTALL=1

    # Install Python bindings into the tree (will be picked out)
    python -m installer --destdir="$pkgdir" rust/src/python/dist/*.whl

    cd "$pkgdir"

    # Pick out libnmstate files
    _pick libnmstate usr/lib/libnmstate.*
    _pick libnmstate usr/include/nmstate.h
    _pick libnmstate usr/lib/pkgconfig/nmstate.pc

    # Pick out python-libnmstate files
    _pick python-libnmstate usr/lib/python*

    install -Dm644 "$srcdir/$pkgbase-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_libnmstate() {
    pkgdesc='Declarative network manager API - C library'
    depends=('gcc-libs' 'glibc')
    optdepends=('networkmanager: required for most operations')
    provides=(libnmstate.so)

    mv -v $pkgname/* "$pkgdir"

    install -Dm644 "$srcdir/$pkgbase-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-libnmstate() {
    pkgdesc='Declarative network manager API - Python bindings'
    depends=(
        "libnmstate=$pkgver-$pkgrel"
        'python'
        'python-pyyaml'
    )
    arch=('any')

    mv -v $pkgname/* "$pkgdir"

    install -Dm644 "$srcdir/$pkgbase-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
