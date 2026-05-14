# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cesarferreira
_pkgname=stax
_cratename=${_pkgname}
_appname=(stax st)
pkgname=${_cratename}
pkgdesc="The fastest stacked-branch workflow for Git"

pkgver=0.73.0
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'pkgconf' 'openssl' 'libgit2')
depends=('glibc' 'gcc-libs' 'libgit2')

provides=("${_appname[@]}")
conflicts=("${_appname}")

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('215e46c7c542750d658cc72a4098d7ec0b707998e26446a43f6da05451579f65')


build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	for bin in ${_appname[@]}; do
		install -Dm755 "target/release/${bin}" "${pkgdir}/usr/bin/${bin}"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
