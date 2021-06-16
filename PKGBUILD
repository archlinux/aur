# Maintainer: FrancisDuRadis

pkgname=mozilla-vpn-client-git
_pkgname=${pkgname%-*}
pkgver=2.4.0
pkgrel=1
epoch=0
pkgdesc="Mozilla VPN from git"
arch=(x86_64)
url="https://github.com/mozilla-mobile/mozilla-vpn-client"
license=('MPL2')
makedepends=('git' 'python-pip')
depends=('qt5-quickcontrols' 'qt5-charts' 'qt5-networkauth' 'polkit>=0.105' 'wireguard-tools>=1.0.20200513' 'resolvconf' 'python3')
source=(
	"${_pkgname}::git+${url}.git"
)
sha256sums=(
	'SKIP'
)
prepare() {
	pip3 install glean_parser pyhumps pyyaml
	cd "${srcdir}/${_pkgname}"
	git submodule init
	git submodule update
	./scripts/generate_glean.py
	./scripts/importLanguages.py
}

build() {
      cd "${srcdir}/${_pkgname}"
      qmake CONFIG+=production
      make -j$(nproc)
}

package() {
	cd "${srcdir}/${_pkgname}"
	sudo make install
}
