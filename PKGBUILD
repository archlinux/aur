# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tarball <bootctl@gmail.com>

_gitauthor=trufflesecurity
_gitname=trufflehog
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Find, verify, and analyze leaked credentials"

pkgver=3.95.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('AGPL-3.0-only')

depends=('bash')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("GENERIC-${pkgver}.yml::${_ghurlraw}/examples/generic.yml"
		"GENERIC_WITH_FILTERS-${pkgver}.yml::${_ghurlraw}/examples/generic_with_filters.yml")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('37e56a67543eea634967c9516831c823967fb2e2cbfedc036be25648f5d696d2'
            'b1dc9104998919f161e89aa8512699ed20b50c601cfbcebc4ba630e69cf3e62e')
sha256sums_x86_64=('5d836eae522540a32ca0f1a1e00efd4c3153a52462466a4b4008fac1e6c1a548')
sha256sums_aarch64=('8e205da06172db049129101d475dc4f7f43904d315384e4e32b9c5009cac27c8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/trufflehog" <<EOF
#!/usr/bin/sh

exec /usr/lib/$pkgname/trufflehog --no-update "\$@"
EOF

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/lib/${_appname}"

	install -Dm644 "docs/man/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "GENERIC-${pkgver}.yml" "${pkgdir}/usr/share/doc/$pkgname/examples/generic.yml"
	install -Dm644 "GENERIC_WITH_FILTERS-${pkgver}.yml" "${pkgdir}/usr/share/doc/$pkgname/examples/generic_with_filters.yml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
