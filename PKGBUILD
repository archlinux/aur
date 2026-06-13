# Maintainer: Niko <aurpkgs@niko.lgbt>

_pkgname=libmedium
pkgname="${_pkgname}-git"
pkgver=r188.c715480
pkgrel=1
pkgdesc="An Alternative Medium Frontend"
url="https://git.batsense.net/realaravinth/libmedium"
license=('AGPL-3.0')
arch=('x86_64' 'aarch64')
makedepends=("cargo" "git")
depends=('zstd' 'oniguruma')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/config.toml")
source=("${pkgname}::git+${url}" "libmedium.service")
sha256sums=('SKIP'
            'a4c2b3cea4c21a35168a443e7a6429dec268255dd06be55ff66fd9f462de15f9')

# https://wiki.archlinux.org/title/VCS_package_guidelines#Git
pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# https://github.com/rust-onig/rust-onig/issues/195#issuecomment-2905179949
	export CFLAGS="${CFLAGS} -std=gnu17"

	# weird build-time linker errors if these aren't set???
	# C FFI sucks
	export RUSTONIG_SYSTEM_LIBONIG=true
	export ZSTD_SYS_USE_PKG_CONFIG=true

	# build with debugging symbols
	export CARGO_PROFILE_RELEASE_DEBUG=line-tables-only

	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 "target/release/${_pkgname}"	-t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE.md"			-t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	install -Dm644 "README.md"			-t "${pkgdir}/usr/share/doc/${_pkgname}/"
	install -Dm644 "../${_pkgname}.service"		-t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 "config/default.toml"		"${pkgdir}/etc/${_pkgname}/config.toml"
}
