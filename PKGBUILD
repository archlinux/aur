pkgname=diesel-cli-git
pkgver=2.0.0.rc0.r98.gdf7ca0ae5
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(openssl sqlite postgresql-libs libmariadbclient)
replaces=(diesel_cli_git)
makedepends=(cargo git)
source=("git+https://github.com/diesel-rs/diesel.git")
sha256sums=('SKIP')
provides=('diesel-cli')
conflicts=('diesel-cli')

pkgver() {
	cd "$srcdir/diesel"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/diesel/diesel_cli"
	RUSTFLAGS="--cap-lints allow" RUSTUP_TOOLCHAIN=stable cargo build --release --no-default-features --features sqlite
}

check() {
    cd "$srcdir/diesel/diesel_cli"
    RUSTFLAGS="--cap-lints allow" RUSTUP_TOOLCHAIN=stable cargo test --no-default-features --features sqlite
}


package() {
    cd "$srcdir/diesel"
	install -Dm755 "$srcdir/diesel/target/release/diesel" "$pkgdir/usr/bin/diesel"


    install -d "${pkgdir}/usr/share/bash-completion/completions" \
               "${pkgdir}/usr/share/zsh/site-functions" \
               "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${pkgdir}/usr/bin/diesel" completions bash > "${pkgdir}/usr/share/bash-completion/completions/diesel"
    "${pkgdir}/usr/bin/diesel" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_diesel"
    "${pkgdir}/usr/bin/diesel" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/diesel.fish"

    install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
