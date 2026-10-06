# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=rotkonetworks
_gitname=zish
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast shell interpreter, written in zig, with built-in AI agent and GGUF inference"

pkgver=0.25.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux' 'aarch64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('jq' 'curl')
depends=('glibc')

options=('!strip')

source=("INDEX-${pkgver}.jsonl::${_ghurl}/releases/download/${_gitversion}/index.jsonl"
		"MANPAGE-${pkgver}.1::${_ghurlraw}/${_appname}.1"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('ea7b98ceed70312e95e37808da62c690c12467825ed77a62c89b4dd1e0c78368'
            '5a4c025947240e5f8a6d5bea2990741d4b137b2dba98e4ead828137128fd0cec'
            '16079321729f9ece2bb6d58a10671fbec899e9ba046f1880a79804db52fdbc57'
            '1fb9fa70ab9186cceadfedf00366d587479450d9b8eae962c8719112ddad958c')
sha256sums_x86_64=('7c2b769d785cf479c1f0e70f5bd9488f7488d14845ed377df9ca2d010d96c74f')
sha256sums_aarch64=('5db4488c2b55e4665f52d9809aa0e77be89e90b8374e0d02a2fb3d11fdd20bed')


prepare() {
	cd "${srcdir}/" || exit

	TARGET_TIER="standard"

	mkdir -p "feats/${TARGET_TIER}/"

	while read -r url; do
		echo "Downloading: ${url}"
		curl -sSL -O --output-dir "feats/${TARGET_TIER}/" "${url}"
	done < <(jq -r --arg a "${CARCH}" --arg t "${TARGET_TIER}" 'select(.arch == $a and .tier == $t) | .url' "./INDEX-${pkgver}.jsonl")
}

package() {
	cd "${srcdir}/" || exit

	TARGET_TIER="standard"

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	for archive in feats/${TARGET_TIER}/*.tar.gz; do
		[ -f "${archive}" ] || continue

		feature=$(basename "${archive}" | cut -d'-' -f1)

		install -d "${pkgdir}/usr/share/zish/feats/${TARGET_TIER}/${feature}"

		echo "Installing: ${feature}"
		tar -xf "${archive}" --no-same-owner -C "${pkgdir}/usr/share/zish/feats/${TARGET_TIER}/${feature}/"
	done

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
