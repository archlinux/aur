# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tarball <bootctl@gmail.com>

_gitauthor=trufflesecurity
_gitname=trufflehog
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Find, verify, and analyze leaked credentials"

pkgver=3.95.8
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
sha256sums_x86_64=('136c42933697ab2e09402d003ff4259086312b80cb671e7d9ab05477597bc4f0')
sha256sums_aarch64=('49231b33cdd49dee4e98c7efc9acfb16e8d08ac5fed84bf7e983656487a96b98')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/trufflehog" <<EOF
#!/usr/bin/sh

exec /usr/lib/${_appname}/${_appname} --no-update "\$@"
EOF

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/lib/${_appname}"

	install -Dm644 "docs/man/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "GENERIC-${pkgver}.yml" "${pkgdir}/usr/share/doc/${pkgname}/examples/generic.yml"
	install -Dm644 "GENERIC_WITH_FILTERS-${pkgver}.yml" "${pkgdir}/usr/share/doc/${pkgname}/examples/generic_with_filters.yml"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
