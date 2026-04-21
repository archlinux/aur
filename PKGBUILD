# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tarball <bootctl@gmail.com>

_gitauthor=trufflesecurity
_gitname=trufflehog
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Find, verify, and analyze leaked credentials"

pkgver=3.95.2
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
sha256sums_x86_64=('fded1c139fe4d3872d9fde65e1428d82d5556d655439e82f492d87ae8d846779')
sha256sums_aarch64=('5588f09da2d52e840273b6a8c57751021709182dff42574f09dbaf81ebdf8366')


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
