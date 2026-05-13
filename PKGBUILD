# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cesarferreira
_pkgname=stax
_cratename=${_pkgname}
_appname=(stax st)
pkgname=${_cratename}
pkgdesc="The fastest stacked-branch workflow for Git"

pkgver=0.71.1
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
sha256sums=('50d6ff3ad8596192f42eb3cc541a9646d449b4dd269c4f9d0ca7e7d8d06f954c')


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
