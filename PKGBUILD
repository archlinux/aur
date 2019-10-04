# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=NFD
_pkgname=ndn-nfd
pkgname=${_pkgname}-git
pkgver=NFD.0.6.6.r37.g606d5ddc
pkgrel=1
# epoch=
pkgdesc="NFD is a network forwarder that implements and evolves together with the Named Data Networking (NDN) protocol"
arch=("any")
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'gcc' 'python' 'boost' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=('valgrind: memory analysis')
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
	cd "${srcdir}/${_reponame}"
	git checkout `g describe --tags --abbrev=0`
	git submodule update --init
	# Run the initial configuration
	./waf configure
}

pkgver() {
	cd "${srcdir}/${_reponame}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_reponame}"
	# Build libraries and tools
	./waf build
}

package() {
	cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
	
	mv "${pkgdir}/usr/local/"* "${pkgdir}/usr"
}
