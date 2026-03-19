# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=spacetimedb
pkgname=(${_pkgbase}{,-cli}-bin)
pkgver=2.0.5
pkgrel=1
pkgdesc="A relational database and a server combined into one (bin version)"
arch=('x86_64' 'aarch64')
url="https://github.com/clockworklabs/SpacetimeDB"
license=('custom:BSL')
source=("spacetime-BSL-${pkgver}.txt::${url}/raw/refs/tags/v${pkgver}/LICENSE.txt"
        'spacetimedb.service'
        'spacetimedb.sysusers')
_source() { echo "spacetime-${CARCH}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/spacetime-${CARCH}-unknown-linux-gnu.tar.gz"; }
source_x86_64=("$(CARCH=x86_64 _source)")
source_aarch64=("$(CARCH=aarch64 _source)")
sha256sums=('c096ab7f54e9b0394f304c6b7598f37dc498d634f912db7a0e9e6038c5e7a7d9'
            'bc5673cdabd668504a1cee7bb6995a49eb4c2f7314fc18830d3d368a0c6bcc16'
            '2a31e8040c5177900122e8aeacb333742676b5e8f05046b53dc1f8f7ff62de60')
sha256sums_x86_64=('a8c85b999e6bd9bd212af4b7f7f57237e7252bf2719f323848f8698d407cfd91')
sha256sums_aarch64=('7a1501062d9f094d6d31dd49709d9a624a394dace3ff447a6cfc3e0a50855fc0')

_package() {
	install -Dm644 "spacetime-BSL-${pkgver}.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_spacetimedb-bin() {
	provides=(${_pkgbase})
	conflicts=(${_pkgbase})

	_package

	install -Dm755 'spacetimedb-standalone' -t "${pkgdir}/usr/bin/"

	install -Dm644 'spacetimedb.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 'spacetimedb.sysusers' "${pkgdir}/usr/lib/sysusers.d/spacetimedb.conf"
}

package_spacetimedb-cli-bin() {
	optdepends+=('binaryen: for wasm-opt')
	provides=(${_pkgbase}-cli)
	conflicts=(${_pkgbase}-cli)

	_package

	install -Dm755 'spacetimedb-cli' "${pkgdir}/usr/bin/spacetime"
}
