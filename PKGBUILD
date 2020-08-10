# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=NLSR
_pkgname=ndn-nlsr
pkgname=$_pkgname
pkgver=0.5.2
pkgrel=4
# epoch=
pkgdesc="Named Data Link State Routing Protocol"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost' 'ndn-psync' 'ndn-chronosync')
makedepends=('git' 'python' 'python-sphinx' 'doxygen')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${_reponame}-${pkgver}.tar.gz)
noextract=()
sha256sums=('27d8672784c63f815ff519f807e94fbb66f1a8da3674fe907cea762f465d55de')
validpgpkeys=()

prepare() {
  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"

  # Patch missing includes
  sed -i '26i#include <ostream>' src/statistics.hpp

  ./waf configure --prefix=/usr --with-tests
}

build() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf build
  ./waf docs
}

# Check disabled until upstream gets fixed
#check() {
#  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
#  ./waf install --destdir="${srcdir}/tests"
#  LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests-nlsr
#}

package() {
  install -dm 755 "${pkgdir}/usr/share/doc/$_pkgname"

	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}-${_reponame}-${pkgver}/build/docs/"* "${pkgdir}/usr/share/doc/$_pkgname" 
  mv "${pkgdir}/usr/etc" "${pkgdir}/"
}
