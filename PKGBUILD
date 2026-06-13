# Maintainer: Niko <aurpkgs@niko.lgbt>

_pkgname=libmedium
pkgname="${_pkgname}-git"
pkgver=r188.c715480
pkgrel=2
pkgdesc="An Alternative Medium Frontend"
url="https://git.batsense.net/realaravinth/libmedium"
license=('AGPL-3.0')
arch=('x86_64' 'aarch64')
makedepends=("cargo" "git")
depends=('zstd' 'oniguruma')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}/config.toml")

source=(
	"${pkgname}::git+${url}"
	"libmedium.service"
	"0001-modify-cache-dir.patch"
)
sha256sums=('SKIP'
            'd03c68462809945609446bcb6cdd8d87b6abc1fc1d03b17f1cbc15fd7f6e8ed9'
            'bccd90af43ea14de9cb0976cd2872cc89898c14dbf5289702d30989597adcb10')

# https://wiki.archlinux.org/title/VCS_package_guidelines#Git
pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	patch -p1 -i ../0001-modify-cache-dir.patch
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
