# Maintaner: Evan Overman <evanrileyoverman@gmail.com>

pkgname=webby-git
_pkgname=webby
pkgver=3.2.0.r0.gd3818df
pkgrel=1
pkgdesc='A very simple HTTP/HTTPS server and service.'
url='https://github.com/an-prata/webby'
makedepends=('git' 'go')
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	go build
}

package() {
	cd "${srcdir}/${_pkgname}"

	mkdir -p ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/etc/webby/
	mkdir -p ${pkgdir}/srv/webby/website/
	mkdir -p ${pkgdir}/usr/lib/systemd/system/

	mv webby ${pkgdir}/usr/bin/
	cp webby.service ${pkgdir}/usr/lib/systemd/system/

	if [ ! -f "/etc/webby/config.json" ]
	then
		cp /etc/webby/config.json ${pkgdir}/etc/webby
	fi

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
