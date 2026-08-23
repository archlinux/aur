# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lolt3under
_pkgname=se-rs
_appname=${_pkgname%-rs}
pkgname=${_pkgname}
pkgdesc="A structural text editor for searching and rewriting byte ranges"

pkgver=0.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('BSD-3-Clause')

makedepends=('rust' 'pkgconf')
depends=('glibc' 'libgcc')

provides=("${_appname[@]}")
conflicts=("${_appname}")

source=("${pkgname}-${pkgver}.crate::${url}/releases/download/${_pkgvername}/${pkgname}-${pkgver}.crate")
sha256sums=('36d216fe6006a0770e342278423aca4f7dba6a74d9eb005131f6f85d1bb43f7d')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/docs/" || exit 1

	mv "README.md" "WIKI.md"
	for doc in *.md; do
		ext="${doc##*.}"
		base="${doc%.*}"
		mv -f "${doc}" "${doc}.tmp"
		mv -f "${doc}.tmp" "${base^^}.${ext}"
	done
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "man/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	for doc in docs/*.md; do
		install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${doc})"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
