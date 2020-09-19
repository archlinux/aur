# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: Pritunl <contact@pritunl.com>

pkgname=pritunl-git
_pkgname=pritunl
pkgver=1.29.2547.95
pkgrel=1
pkgdesc="Enterprise VPN Server"
arch=("x86_64" "aarch64")
license=("custom")
url="https://github.com/${_pkgname}/${_pkgname}"
_depends=(
	pritunl-dns
	pritunl-web
	#python2-jinja
	#python2-urllib3
	#python2-iptables

	python2
	#python-boto
	#python-boto3
	##python-bson is provided by python-pymongo
	#python-cheroot
	#python-cryptography
	#python-dateutil
	#python-flask
	#python-google-api-python-client
	#python-netifaces
	#python-oauth2client
	#python-oci
	#python-psutil
	#python-pymongo
	#python-pynacl
	#python-pyroute2
	#python-redis
	#python-requests
	#python-yubico-client

	net-tools
	iproute2
	openvpn
)
makedepends=(
	git
	python2-setuptools
	python2-virtualenv
	python2-pip
)
optdepends=(mongodb)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${_pkgname}.install
source=("git+$url")
sha256sums=('SKIP')
options=("emptydirs")
backup=("etc/${_pkgname}.conf")

pkgver() {
	cd $_pkgname
	git describe --always --tags | sed -e 's/-/./g' -e 's/v//g'
}

_build() {
	export virtualenv="${pkgdir}/opt/${_pkgname}"
	export mirror="-i https://pypi.tuna.tsinghua.edu.cn/simple"

	cd "$srcdir/$_pkgname"
	#python2 setup.py build
	virtualenv2 "$virtualenv"
	${virtualenv}/bin/python setup.py build
	${virtualenv}/bin/python setup.py install --root="${pkgdir}" --prefix="/opt/${_pkgname}"
	${virtualenv}/bin/pip install $mirror -U -r requirements.txt --root="${pkgdir}" --prefix="/opt/${_pkgname}"
}

package() {
	depends=(${_depends[@]})

	_build

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin"

	msg2 "Replacing \$pkgdir"
	sed -e "s|${pkgdir}||g" -i $(grep "${virtualenv}" ${pkgdir} -rIl 2>/dev/null)

	#mkdir -p "${pkgdir}/var/lib/${_pkgname}"
	#python2 setup.py install --root="${pkgdir}" --prefix=/usr
}
