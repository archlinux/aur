# Maintainer: Filippo Berto <berto.f@protonmail.com>
_pkgname=ndn-tools
pkgname=${_pkgname}-git
pkgver=ndn.tools.0.6.4.r23.g11c6991
pkgrel=1
# epoch=
pkgdesc="ndn-tools is a collection of basic tools for Named Data Networking"
arch=("any")
url="https://github.com/named-data/${_pkgname}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'gcc' 'python' 'boost' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_pkgname}"
	git checkout `g describe --tags --abbrev=0`
	git submodule update --init
	# Run the initial configuration
	./waf configure
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	# Build libraries and tools
	./waf build
}

package() {
	cd "${srcdir}/${_pkgname}"
	./waf install --destdir="${pkgdir}"
	
	mv "${pkgdir}/usr/local/"* "${pkgdir}/usr"
}
