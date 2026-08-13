# Maintainer: 30p87 <aur@30p87.de>

pkgname='piped-html-proxy-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r57.f8b03e6
pkgrel=2
pkgdesc='Express.js proxy for Piped that injects OpenGraph meta to the HTML body.'
arch=('any')
url="https://github.com/JuniorJPDJ/piped-html-proxy"
license=('MIT')
groups=('piped-git')
depends=('npm')
backup=("etc/webapps/piped/${_componentnameshort}.env")
source=("git+${url}"
		'unix-socket.patch'
		'config.env'
		'nginx.conf'
		'sysusers.conf'
		'tmpfiles.conf'
		'systemd.service')
sha256sums=('SKIP'
            '55a19624e05ab2da61a8d505d195ec04558c87baa64e774ea4799107d632fbc4'
            'dfbc965ac0938ba4ebd43a35076a615df99979e12a293680b8d216d6446518bc'
            '98ead0813c5fe2b0f97490eb979f34741bc35ebf5745801f63b5676c81bda7e3'
            'eb122e1cf5149be5e89a2ebfb158f29f305427cb8b2061d6728c53ad1d1b89d4'
            '881a3ce33e4327919721e61f707bb1097a77077125c8c68766b2145ee0eadc58'
            'bb8105e1d76da20c138ad22c37e9e1be93a078ef9fbd9eedf10664399328b80b')
_dest="/usr/share/webapps/piped/${_componentnameshort}"

pkgver() {
	cd 'piped-html-proxy'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd 'piped-html-proxy'
	patch -Np1 -i ../unix-socket.patch
}

build() {
	cd 'piped-html-proxy'
	npm audit fix --force
	npm ci
}

package() {
	install -Dm644 "${srcdir}/config.env" "${pkgdir}/etc/webapps/piped/${_componentnameshort}.env"

	install -Dm644 "${srcdir}/piped-html-proxy/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/nginx.conf"

	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}.service"

	install -dm755 "${pkgdir}${_dest}"
	cp -r ${srcdir}/piped-html-proxy/{*.js{,on},node_modules} "${pkgdir}${_dest}"
}
