# Maintainer: Eddie Billoir <lechatp@outlook.fr>

pkgbase=dosr
pkgname=('dosr')
pkgver=4.3.1
pkgrel=1
pkgdesc='A better alternative to sudo(-rs)/su • Fast • Memory-safe • Security-oriented'
url='https://lechatp.github.io/RootAsRole/'
license=('LGPL-3.0-or-later')
arch=('x86_64')
options=('!debug')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/LeChatP/RootAsRole/archive/v${pkgver}.tar.gz")
sha256sums=('7d7553c89999d593662366ea13cba917b505f06a90b17cce422eadf70f604bb3')
depends=('pcre2' 'pam' 'libseccomp' 'glibc' 'gcc-libs' 'e2fsprogs')
makedepends=('cargo' 'libcap' 'pandoc')
validpgpkeys=('74F43C5774BE1F3527DEFA4835C155EA0525104D')
install=rootasrole.install
backup=('etc/pam.d/dosr')

prepare() {
    cd RootAsRole-$pkgver
    rm Cargo.lock || true
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd RootAsRole-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Remap source paths to avoid $srcdir references in binaries
    export RUSTFLAGS="--remap-path-prefix=$PWD=."
    export CARGO_HOME="$PWD/.cargo"

    cargo build --release --bin dosr --features finder
    cargo build --release --bin chsr --features editor

    # Man pages (same sources as the Debian package)
    mkdir -p man/{en,fr}
    pandoc -s -t man resources/man/en_US.md -o man/en/dosr.8
    pandoc -s -t man resources/man/fr_FR.md -o man/fr/dosr.8
}

check() {
    cd RootAsRole-$pkgver
    export RUSTUP_TOOLCHAIN=stable

    export RAR_AUTHENTICATION="skip"
    export RAR_CFG_PATH="target/rootasrole.json"
    export SKIP_BUILD="true"

    cargo test --all-features --bin dosr --bin chsr || RETVAL=$?

    rm -rf target/ts
    return ${RETVAL:-0}
}

package_dosr() {
    cd RootAsRole-$pkgver

    install -Dm755 'target/release/dosr' -t "$pkgdir/usr/bin"
    install -Dm755 'target/release/chsr' -t "$pkgdir/usr/bin"

    # PAM
    install -Dm644 'resources/arch/arch_sr_pam.conf' -T "$pkgdir/etc/pam.d/dosr"
    install -Dm644 'resources/arch/arch_sr_pam.conf' -T "$pkgdir/usr/share/rootasrole/dosr"

    # Templates copied to /etc/security by rootasrole.install.
    # Both files carry a PACKAGE_VERSION placeholder (Debian substitutes it in debian/generated).
    install -Dm644 'resources/rootasrole.json' -T "$pkgdir/usr/share/rootasrole/default.json"
    cat > "$pkgdir/usr/share/rootasrole/rootasrole.json" <<'EOF'
{
    "version": "PACKAGE_VERSION",
    "storage": {
        "method": "json",
        "settings": {
            "immutable": true,
            "path": "/etc/security/rootasrole.d/"
        }
    }
}
EOF
    chmod 644 "$pkgdir/usr/share/rootasrole/rootasrole.json"
    sed -i "s/PACKAGE_VERSION/$pkgver/g" \
        "$pkgdir/usr/share/rootasrole/default.json" \
        "$pkgdir/usr/share/rootasrole/rootasrole.json"

    # Man pages (chsr shares the dosr page, as in Debian's dosr.links)
    gzip -9nf 'man/en/dosr.8' 'man/fr/dosr.8'
    install -Dm644 'man/en/dosr.8.gz' -t "$pkgdir/usr/share/man/man8"
    ln -s dosr.8.gz "$pkgdir/usr/share/man/man8/chsr.8.gz"
    install -Dm644 'man/fr/dosr.8.gz' -t "$pkgdir/usr/share/man/fr/man8"
    ln -s dosr.8.gz "$pkgdir/usr/share/man/fr/man8/chsr.8.gz"

    setcap '=p' "$pkgdir/usr/bin/dosr"
}
