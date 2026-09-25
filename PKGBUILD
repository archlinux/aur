# Maintainer: Marcel Röthke <marcel@roethke.info>

_pkgname=crosspoint-sync
pkgname=${_pkgname}-git
pkgver=r66.d35a853
pkgrel=2
pkgdesc="Lightweight KoSync Server for Syncing Crosspoint/CrossInk stats & progress"
arch=("any")
url="https://github.com/crosspoint-reader/crosspoint-sync"
license=('MIT')
depends=("nodejs>=22.13")
makedepends=('git' 'npm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/conf.d/crosspoint-sync')
source=(
	'git+https://github.com/crosspoint-reader/crosspoint-sync.git'
	'crosspoint-sync.conf'
	'crosspoint-sync.service'
	'sysusers.conf'
	'tmpfiles.conf'
	'0001-Allow-the-listening-socket-to-be-set-using-the-LISTE.patch'
)
sha256sums=('SKIP'
            '0c64d04f1dd9f9cc0c6d3ff100042aa6abc9014224e0a1df5e5f5cf0c8295d04'
            'bbdd8040565e60573327c6adcbdbab2e1ea1294353f511a89b9ade66399229fe'
            '497f0708a4465f8426a45d33c63f9a73930d31985411c03d57abb7266e3b2c98'
            '76ba495d8f493c75ad18aeff4775a55aac3a8499fec3606e8e6361fc04288011'
            '69ecaacfac8b23c33afaf94da1d6c9d324677086fccbd8182bed444708888307')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"

	npm ci
}

build() {
	cd "$srcdir/${_pkgname}"

	patch -p1 < "${srcdir}/0001-Allow-the-listening-socket-to-be-set-using-the-LISTE.patch"

	npm run build
	npm ci --omit=dev
}

package() {
	cd "$srcdir/${_pkgname}"


	install -vDm644 -t "${pkgdir}/usr/lib/${_pkgname}" package.json
	find {dist,node_modules,migrations,assets,extension} -type f -print0 |
		xargs -0 -I {} install -vDm644 {} "${pkgdir}/usr/lib/${_pkgname}/"{}

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/crosspoint-sync-git/LICENSE"

	install -Dm644 "${srcdir}/crosspoint-sync.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
	install -Dm644 "${srcdir}/crosspoint-sync.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
}
