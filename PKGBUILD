# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgbase=nmstate
pkgname=(
    nmstate
    libnmstate
    python-libnmstate
)
pkgver=2.2.61
pkgrel=2
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
    "$pkgbase-$pkgver.tar.gz.asc::https://github.com/nmstate/nmstate/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz.asc"
    "$pkgbase-vendor-$pkgver.tar.xz::https://github.com/nmstate/nmstate/releases/download/v$pkgver/$pkgbase-vendor-$pkgver.tar.xz"
)
# vendor tarball is unsigned upstream; sha256 only
sha256sums=(
            '25cb1b4055c3f1c9d6e98c7efd3084f09d38f105b34ce6d80132d4427a98ed16'
            '4306b81631898d628ad3376577a4aff08e3eb78b4f60b8e88bfdc0868de5792b'
            '13412239f623451a86a8ee2e3a8a0d00da5dd5e754be1006e063cfe2f07ed0d3'
)
# nmstate release signers (from upstream nmstate.gpg keyring)
validpgpkeys=(
    '48FD6FAE515A77B48436821C8789567B8715CEBC' # Gris Ge <fge@redhat.com>
    '2B5F3B2028801E15F57AAA309906C97AA15D984F' # Fernando Fernandez Mancera <ffmancera@riseup.net>
    '07F9AEC86144386D9576210B66A44781B4EBC2D0' # Íñigo Huguet <ihuguet@redhat.com>
    'C698DE9589AD876D618B03B4157D02EF4DD5D752' # Ján Václav <jvaclav@redhat.com>
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

    # Set up vendored Rust dependencies. The config must sit in $srcdir so
    # cargo finds it walking up from the build cwd ($pkgbase-$pkgver); a config
    # under rust/.cargo is never read because build() runs cargo from the
    # project root via --manifest-path, so it would silently hit crates.io.
    mv "$srcdir/vendor" rust/vendor
    mkdir -p "$srcdir/.cargo"
    cat > "$srcdir/.cargo/config.toml" <<EOF
[source.crates-io]
replace-with = "vendored-sources"

[source.vendored-sources]
directory = "$srcdir/$pkgbase-$pkgver/rust/vendor"
EOF
}

build() {
    cd "$pkgbase-$pkgver"

    # Build Rust components (CLI + C library). --offline forces use of the
    # vendored sources and fails loudly if vendoring breaks, rather than
    # silently resolving "latest compatible" crates from crates.io.
    cargo build --offline --release --workspace --manifest-path rust/Cargo.toml

    make manpage clib

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

    make install \
        DESTDIR="$pkgdir" \
        PREFIX=/usr \
        LIBDIR=/usr/lib \
        SYSCONFDIR=/etc \
        SYSTEMD_UNIT_DIR=/usr/lib/systemd/system \
        SKIP_PYTHON_INSTALL=1

    # installed into this pkgdir, picked out into python-libnmstate below
    python -m installer --destdir="$pkgdir" rust/src/python/dist/*.whl

    cd "$pkgdir"

    _pick libnmstate usr/lib/libnmstate.*
    _pick libnmstate usr/include/nmstate.h
    _pick libnmstate usr/lib/pkgconfig/nmstate.pc

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
