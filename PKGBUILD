# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Peukert <daniel@peukert.cc>

# This package tracks the upstream main branch instead of a tagged release
# because P-256 (p256) support is only available on main and has not yet
# shipped in a release (0.5.1). P-256 support enables using the YubiKey
# without requiring the plugin to be installed for encryption (it is only
# needed for decryption). Switch back to a tagged release once main is
# released with this feature.

_pkgname=age-plugin-yubikey
pkgname=age-plugin-yubikey-git
pkgver=0.5.1.r24.gcafbc75
pkgrel=1
pkgdesc='Yubikey plugin for age'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/str4d/$_pkgname"
license=(Apache-2.0 MIT)
depends=(glibc
         libgcc
         pcsclite)
makedepends=(cargo
             git)
optdepends=('age: for use with age'
            'rage-encryption: for use with rage')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname"
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
