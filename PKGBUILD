# Maintainer: 30p87 <30p87@30p87.de>
pkgname='piped-html-proxy-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r47.b9cf35f
pkgrel=1
pkgdesc='Express.js proxy for Piped that injects OpenGraph meta to the HTML body.'
arch=('any')
url="https://github.com/JuniorJPDJ/${_componentname}"
license=('MIT')
groups=('piped-git')
depends=('npm')
backup=("etc/webapps/piped/${_componentnameshort}.env")
source=("git+${url}"
		'environment.env'
		'unix-socket.patch'
		'sysusers.conf'
		'tmpfiles.conf'
		'systemd.service')
sha256sums=('SKIP'
            'dfbc965ac0938ba4ebd43a35076a615df99979e12a293680b8d216d6446518bc'
            '0c7ab02c4c1e81b8d48248d0019fc6dec3874f4fba42fcb179c95ec757d22d0f'
            'eb122e1cf5149be5e89a2ebfb158f29f305427cb8b2061d6728c53ad1d1b89d4'
            '9ce131ebca18f9bc96c65e6dd51c55084d40bdb13069ad9ea422d4a0654b2b7a'
            'bc64a45a88254363e931d24cb326530d2ea2c394c864f8b39d51295e775f1417')
dest="/usr/share/webapps/piped/${_componentnameshort}"

pkgver() {
	cd "${_componentname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${_componentname}"
	patch -Np1 -i ../unix-socket.patch
}

build() {
	cd "${_componentname}"
	npm ci
}

package() {
	install -dm755 "${pkgdir}/etc/webapps/piped"
	install -dm755 "${pkgdir}/usr/share/webapps/piped/${_componentnameshort}"

	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}.service"
	install -Dm644 "${srcdir}/environment.env" "${pkgdir}/etc/webapps/piped/${_componentnameshort}.env"

	install -Dm644 "${srcdir}/${_componentname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cp -r ${srcdir}/${_componentname}/{*.js{,on},node_modules} "${pkgdir}/usr/share/webapps/piped/${_componentnameshort}"
}
