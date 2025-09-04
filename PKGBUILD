# Maintainer: Eddie Billoir <lechatp@outlook.fr>

pkgbase=dosr
pkgname=('dosr')
pkgver=3.2.4
pkgrel=1
pkgdesc='A better alternative to sudo(-rs)/su • Fast • Memory-safe • Security-oriented'
url='https://lechatp.github.io/RootAsRole/'
license=('LGPL-3.0-or-later')
arch=('x86_64')
options=('!debug')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/LeChatP/RootAsRole/archive/v${pkgver}.tar.gz")
sha256sums=('127941467817b58b475b47800628b285ddc14653212139e1ee22fda0595decd3')
depends=('pcre2' 'pam' 'libseccomp' 'glibc' 'gcc-libs')
makedepends=(cargo e2fsprogs)
optdepends=('pandoc: for building man pages')
validpgpkeys=('74F43C5774BE1F3527DEFA4835C155EA0525104D')
install=rootasrole.install
backup=('usr/share/rootasrole/dosr' 'usr/share/rootasrole/default.json')

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
    # Build release binaries
    cargo build --release --bin dosr --features finder
    cargo build --release --bin chsr --features editor

    # Build man pages from markdown (if pandoc is available)
    if command -v pandoc >/dev/null 2>&1; then
        mkdir -p man/{en,fr}
        pandoc -s -t man resources/man/en_US.md -o man/en/dosr.8
        pandoc -s -t man resources/man/fr_FR.md -o man/fr/dosr.8
    fi
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
    install -Dm644 'resources/arch/arch_sr_pam.conf' -T "$pkgdir/etc/pam.d/dosr"
    install -Dm644 'resources/arch/arch_sr_pam.conf' -T "$pkgdir/usr/share/rootasrole/dosr"
    install -Dm644 'resources/rootasrole.json' -T "$pkgdir/usr/share/rootasrole/default.json"

    # Install man pages if they were built
    if [ -f man/en/dosr.8 ]; then
        gzip 'man/en/dosr.8'
        gzip 'man/fr/dosr.8'

        install -Dm644 'man/en/dosr.8.gz' -t "$pkgdir/usr/share/man/man8"
        ln -s dosr.8.gz "$pkgdir/usr/share/man/man8/chsr.8.gz"
        install -Dm644 'man/fr/dosr.8.gz' -t "$pkgdir/usr/share/man/fr/man8"
        ln -s dosr.8.gz "$pkgdir/usr/share/man/fr/man8/chsr.8.gz"
    fi


    setcap '=p' "$pkgdir/usr/bin/dosr"
}