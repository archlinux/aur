# Maintainer: Yamashiro <dev cosmicheron com>

pkgname='comet-gog'
pkgdesc='Open Source implementation of GOG Galaxy Communication Service for SDK bundled with GOG games'
_version='0.1.2'
pkgver="v${_version}"
pkgrel='1'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo')
depends=('gcc-libs' 'glibc')
_depurl='https://github.com/Yepoleb/gog_protocols'
_depcommit='5b78acfdc781f230e802476c1134f010463d7a91'
url='https://github.com/imLinguin/comet'
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
		"${_depurl}/archive/${_depcommit}.tar.gz")
sha512sums=('c782b4b8a8c0cb067c48e16bdc8077c73be481a2148abbd3ffa0ad4470cf65c175e4b3ea5b4469648d51133c545d2e1d2d2b4feb75fa682f703361d1322a5bf0'
			'434f1ecebb4073dd42b6300e487a6eb8c3f9f9acd9ae89782b353cdcf955e698a22d075d33cddcc51d88e9d3e72d72e82dd2ea38594e7c1542129f655c0228bb')
options=(!lto)
_depdir="gog_protocols-${_depcommit}"
_cometdir="comet-${_version}"

prepare() {
	_dep="${srcdir}/${_depdir}"
	_comet="${srcdir}/${_cometdir}"
	cd "$_dep"
	mv -- ./* "${_comet}/proto"
	cd "$_comet"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/${_cometdir}"
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked --all-features
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/${_cometdir}/target/release/comet"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_cometdir}/LICENSE"
}
