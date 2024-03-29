# Maintainer: Yamashiro <dev@cosmicheron.com>

_pkgbase='comet-gog'
_depname='proto'
pkgname="${_pkgbase}-git"
pkgdesc='Open Source implementation of GOG Galaxy Communication Service for SDK bundled with GOG games'
pkgver=r76.e313c8a
pkgrel=1
arch=('x86_64')
url='https://github.com/imLinguin/comet'
license=('GPL-3.0')
makedepends=('git' 'cargo')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("${_pkgbase}::git+${url}.git" "${_depname}::git+https://github.com/Yepoleb/gog_protocols.git")
sha256sums=('SKIP' 'SKIP')

OPTIONS+=(!lto)

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgbase"
	git submodule init
	git config "submodule.${_depname}.url" "${srcdir}/${_depname}"
	git -c protocol.file.allow=always submodule update

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked --all-features
}

package() {
	cd "${srcdir}/${_pkgbase}"
	install -Dm755 -t "${pkgdir}/usr/bin" 'target/release/comet'
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgbase}" 'LICENSE'
}
