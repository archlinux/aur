# Maintainer: Lilith Roth <lilith@roth.systems>

pkgname=yrba-git
pkgver=1.3.0
pkgrel=1
pkgdesc="Incremental remote backups made simple!"
url="https://github.com/lilith-roth/yrba"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
license=("GPL-3.0")
depends=("openssl" "libssh2")
makedepends=("cargo" "git" "jq")
provides=("yrba")
conflicts=("yrba")
source=("git+${url}.git#branch=main")
md5sums=("SKIP")

pkgver() {
	cd yrba
	cargo read-manifest --manifest-path=Cargo.toml | jq -r .version
}

prepare() {
	cd yrba
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd yrba
	export RUST_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	LIBSSH2_SYS_USE_PKG_CONFIG=1 cargo build --frozen --release
}

package() {
	cd yrba

	# Install binary
	install -Dm755 target/release/yrba -t "$pkgdir/usr/bin"

	# Install license
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"

	# Install systemd service & timers
    install -Dm644 systemd/yrba.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 systemd/yrba.daily.timer -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 systemd/yrba.weekly.timer -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 systemd/yrba.monthly.timer -t "${pkgdir}/usr/lib/systemd/system/"

    # Install default config
    install -Dm644 config.example.toml "${pkgdir}/etc/default/yrba.toml"
}
