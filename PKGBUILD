# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=colgrep-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="Semantic code search powered by ColBERT (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lightonai/next-plaid"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl')
provides=('colgrep')
conflicts=('colgrep')
_source_archive="colgrep-${pkgver}-x86_64-unknown-linux-gnu.tar.xz"
_upstream_archive="colgrep-x86_64-unknown-linux-gnu.tar.xz"
source=("${_source_archive}::https://github.com/lightonai/next-plaid/releases/download/v${pkgver}/${_upstream_archive}"
        "${_source_archive}.sha256::https://github.com/lightonai/next-plaid/releases/download/v${pkgver}/${_upstream_archive}.sha256")
sha256sums=('6f1dbcffd36e30a34541ee38a7dadc43131d654f06a32c400dfc3a266cad69d7'
            'ff68d16be51963e6a4f4e97e7e0514a0064f1e47dbf03e49e71b10e5ae217ddf')

prepare() {
	cd "${srcdir}"

	local upstream_sum actual_sum
	upstream_sum="$(awk '{print $1}' "${_source_archive}.sha256")"
	actual_sum="$(sha256sum "${_source_archive}" | awk '{print $1}')"

	if [[ "${actual_sum}" != "${upstream_sum}" ]]; then
		printf 'Upstream checksum mismatch for %s\n' "${_source_archive}" >&2
		printf '  upstream: %s\n' "${upstream_sum}" >&2
		printf '  actual:   %s\n' "${actual_sum}" >&2
		return 1
	fi
}

package() {
	cd "${srcdir}/colgrep-x86_64-unknown-linux-gnu"
	install -Dm755 "colgrep" "${pkgdir}/usr/bin/colgrep"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
