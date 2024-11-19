# Maintainer: fossdd <fossdd@pwned.life>
pkgname=rust-beta-bin
pkgver=2024.11.17
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64')
pkgdesc='Systems programming language focused on safety, speed and concurrency (beta pre-compiled version)'
url='https://www.rust-lang.org/'
license=("Apache-2.0 OR MIT")
provides=('rust' 'rust-beta' 'cargo' 'cargo-beta' 'rust-docs')
conflicts=('rust' 'rust-git' 'rust-beta' 'cargo-beta-bin' 'cargo' 'cargo-git' 'cargo-beta' 'cargo-beta-bin' 'rust-docs')
depends=('gcc-libs' 'llvm' 'zlib' 'sh' 'python' )
makedepends=('curl')
source=("rust-beta-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::https://static.rust-lang.org/dist/${pkgver//./-}/rust-beta-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')
options=(staticlibs !debug !strip)

pkgver() {
    curl https://static.rust-lang.org/dist/channel-rust-beta.toml | \
	    grep date | \
	    cut -d '"' -f2 | \
	    cut -d '"' -f1 | \
	    sed 's/-/./g'
}

package() {
    # Rust, Cargo and Documentation.
    cd rust-beta-${CARCH}-unknown-linux-gnu
    ./install.sh \
        --disable-ldconfig \
        --destdir="${pkgdir}" \
        --prefix=/usr/ \
        --components=rustc,cargo,llvm-tools-preview,rust-std-${CARCH}-unknown-linux-gnu,rust-docs,rust-analysis-x86_64-unknown-linux-gnu


    install -dm755 "${pkgdir}/usr/share/bash-completion/"
    mv "${pkgdir}/usr/etc/bash_completion.d/" "${pkgdir}/usr/share/bash-completion/completions/"
    rmdir "${pkgdir}/usr/etc/"

    install -dm755 "${pkgdir}/usr/share/licenses/rust-beta-bin/"{rust,cargo}

    mv "${pkgdir}"/usr/share/doc/cargo/LICENSE-* "${pkgdir}/usr/share/licenses/rust-beta-bin/cargo/"
    mv "${pkgdir}"/usr/share/doc/rust/{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/rust-beta-bin/rust/"

    # Remove cruft.
    rm "${pkgdir}/usr/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}
    #This is where the dependency on llvm git pops up
    rm  $pkgdir/usr/lib/libLLVM-*.so
    # Remove duplicate .so libraries and symlink to them.
    # https://github.com/rust-lang/rust/issues/37971
    find "${pkgdir}/usr/lib/rustlib/" -name "*.so" -exec ln -rfs -t "${pkgdir}/usr/lib/" {} +
}
