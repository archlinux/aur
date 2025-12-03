# Maintainer: George Tsiamasiotis <george+aur@tsiamasiotis.gr>

pkgname=cascade
pkgver=0.1.0alpha5
_pkgver=0.1.0-alpha5
pkgrel=1
pkgdesc='A friendly DNSSEC signing solution: sensible defaults, controllability, observability and flexibility.'
arch=('x86_64')
url='https://github.com/NLnetLabs/cascade'
license=(BSD-3-Clause)
depends=(
    openssl
    glibc
    gcc-libs
)
makedepends=(
    cargo
)

options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NLnetLabs/cascade/archive/refs/tags/v$_pkgver.tar.gz"
        "cascade.sysusers"
        "cascade.tmpfiles")
sha256sums=('88d80ec178fb83ea9521d3bcff8e0ffd460c94601e54b151de136ea7303ce6e5'
            '48caabb8a6e636198c31c5930d9aef8a8e68f5e195809aea9bdfcf9b022115cd'
            '61a157e34740983ad0f24e7878ad97058c766c8ab4a2d5f2aa93e1cd25ffda83')

export RUSTUP_TOOLCHAIN="stable"
export CARGO_TARGET_DIR="target"
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$pkgname-$_pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$_pkgver"
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_pkgver"

    # This currently runs just two unit tests, so it's really not worth the extra compile time.
    # Maybe it can be turned on down the line, when cascade is no longer alpha software.
    # cargo test
}

package() {
    cd "$pkgname-$_pkgver"

    # Install the final binaries into `/usr/bin`.
    install -Dm0755 -t "$pkgdir/usr/bin" \
        "target/$CARGO_BUILD_TARGET/release/cascade" \
        "target/$CARGO_BUILD_TARGET/release/cascaded"

    # Install default configuration.
    install -Dm0644 -t "$pkgdir/etc/cascade" \
        "etc/config.template.toml" \
        "etc/config.system.toml" \
        "etc/policy.template.toml"

    # Install all man pages.
    for page in $(find doc/manual/build/man -type f -name '*.[0-9]*' -maxdepth 1)
    do
        install -Dm0644 -t "$pkgdir/usr/share/man/man${page##*.}/" "$page"
    done

    # Install systemd units.
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system" \
        "pkg/common/cascaded.service" \
        "pkg/common/cascaded.socket"

    # Install auxiliary files for 'cascade' user.
    install -Dm0644 "$srcdir/cascade.sysusers" "$pkgdir/usr/lib/sysusers.d/cascade.conf"
    install -Dm0644 "$srcdir/cascade.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/cascade.conf"

    # Install the license file (this is required for BSD-3-Clause).
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/cascade/LICENSE"
}
