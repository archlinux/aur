# Maintainer: Michał Sałaban <michal@salaban.info>
_name=kovri
pkgname=${_name}-git
pkgver=4317.ab36baef
pkgrel=1
pkgdesc="A free, decentralized, anonymity technology based on I2P's open specifications"
arch=('i686' 'x86_64')
url="https://getkovri.org/"
license=('BSD')
depends=('boost' 'openssl')
#install=${_name}.install
source=(
	"git+https://gitlab.com/kovri-project/kovri"
	"git+https://github.com/anonimal/cpp-netlib.git"
	"git+https://github.com/anonimal/cryptopp.git"
	"git+https://github.com/monero-project/kovri-docs.git")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd ${_name}
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
	cd ${srcdir}/${_name}
	git submodule init
	git config submodule.deps/cpp-netlib.url ${srcdir}/cpp-netlib
	git config submodule.deps/cryptopp.url ${srcdir}/cryptopp
	git config submodule.docs.url ${srcdir}/kovri-docs
	git submodule update -f
	make
}

package() {
	cd ${srcdir}/${_name}
	install -Dm755 build/${_name} ${pkgdir}/usr/bin/${_name}
	install -Dm755 build/${_name}-util ${pkgdir}/usr/bin/${_name}-util
	install -d ${pkgdir}/usr/share/${_name}
	cp -a pkg/* ${pkgdir}/usr/share/${_name}/
}
