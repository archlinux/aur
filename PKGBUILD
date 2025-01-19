# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Aren Moynihan <rn+aur@peacevolution.org>
pkgname=cosh-git
pkgver=v0.3.0.r0.a5357f9
pkgrel=1
pkgdesc="Concatenative command-line shell"
arch=(x86_64)
url="https://github.com/tomhrr/cosh"
license=('BSD-3-Clause')
depends=(glibc gcc-libs openssl)
makedepends=(rust git)
provides=(cosh)
conflicts=(cosh)
source=('git+https://github.com/tomhrr/cosh.git')
sha256sums=('SKIP')

pkgver() {
	cd cosh
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd cosh

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd cosh

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export libdir="/usr/lib"
	cargo build --frozen --release --all-features
	make
}

check() {
	cd cosh

	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --all-features -- --nocapture
}

package() {
	make -C cosh install prefix="$pkgdir/usr/"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" cosh/LICENCE
}
