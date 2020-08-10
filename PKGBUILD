# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=NFD
_pkgname=ndn-nfd
pkgname=${_pkgname}-git
pkgver=NFD.0.7.0.r36.gbc0e617e
pkgrel=1
# epoch=
pkgdesc="NFD is a network forwarder that implements and evolves together with the Named Data Networking (NDN) protocol"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'python' 'boost' 'python-sphinx' 'doxygen')
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

pkgver() {
	cd "${srcdir}/${_reponame}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_reponame}"
	git submodule update --init --recursive
	./waf configure --prefix=/usr/local --with-tests
}

build() {
	cd "${srcdir}/${_reponame}"
	./waf build
  ./waf docs
}

# Check disabled until upstream gets fixed                     
#check() {                                                     
#  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"          
#  ./waf install --destdir="${srcdir}/tests"                   
#  for unit_test in ./build/unit-tests-*; do                   
#    LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" "$unit_test"        
#  done                                                                       
#}

package() {
  install -dm 755 "${pkgdir}/usr/share/doc/$_pkgname"

  cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}-${_reponame}-${pkgver}/build/docs/"* "${pkgdir}/usr/share/doc/$_pkgname"
}
