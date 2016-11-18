# Maintainer: Pritunl <contact@pritunl.com>

pkgname=pritunl-git
_pkgname=pritunl
pkgver=10744.de3c11b
pkgrel=1
pkgdesc="Enterprise VPN Server"
arch=("any")
license=("custom")
url="https://github.com/${_pkgname}/${_pkgname}"
depends=("python" "python2" "python2-flask" "python2-pyopenssl" "python2-pymongo" "net-tools" "iproute2" "openvpn" "python2-netifaces" "python2-boto" "python2-requests" "python2-psutil" "python2-dateutil" "python2-redis" "python2-cherrypy" "python2-pyroute2" "mongodb" "go")
makedepends=("python2-distribute" "python2-flask" "python2-pyopenssl" "python2-pymongo" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${_pkgname}.install
source=("git+https://github.com/${_pkgname}/${_pkgname}")
sha256sums=("SKIP")
options=("emptydirs")
backup=("etc/${_pkgname}.conf" "var/lib/${_pkgname}/${_pkgname}.db" "var/log/${_pkgname}.log" "var/log/${_pkgname}.log.1")

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$_pkgname"
	python2 setup.py build
	export GOPATH=$srcdir/go
	go get github.com/pritunl/pritunl-dns
	go get github.com/pritunl/pritunl-web
}

package() {
	cd "$srcdir/$_pkgname"
	mkdir -p "${pkgdir}/var/lib/${_pkgname}"
	python2 setup.py install --root="${pkgdir}" --prefix=/usr
	install -Dm755 $GOPATH/bin/pritunl-{dns,web} $pkgdir/usr/bin
}
