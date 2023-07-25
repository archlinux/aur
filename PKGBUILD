

# Mantainer: Alessio <alessio@linux.com>
# Contributor: Jingbei Li <i@jingbei.li>

pkgname=pritunl-git
_pkgname=pritunl
pkgver=1.32.3602.80
pkgrel=1
pkgdesc="Enterprise VPN Server"
arch=("x86_64")
license=("custom")
url="https://github.com/${_pkgname}/${_pkgname}"
_depends=(
	pritunl-dns
	pritunl-web
	python3
	net-tools
	iproute2
	openvpn
)
makedepends=(
	git
	python-setuptools
	python-virtualenv
	python-pip
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
	virtualenv "$virtualenv"
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

}
