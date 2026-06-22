# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

pkgname=colgrep-bin
pkgver=1.6.0
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
sha256sums=('250aa728bc5b0dcec4fb24ca97788b18e58686809b6c189c6b7b29f3e52de323'
            'ee117a7c69343b2abc501f4ec19149c1993d9db838e5e979b088f118bf599e25')

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
