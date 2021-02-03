# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=PSync
_pkgname=ndn-psync
pkgname=$_pkgname
pkgver=0.3.0
pkgrel=1
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx')
makedepends=('git' 'python' 'doxygen' 'python-sphinx')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${pkgver}.tar.gz)
noextract=()
sha256sums=('65f9f0425950d6b55201f103b899365ce3ecd4eb4d4e83430e0a4de2c0803068')
validpgpkeys=()

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  ./waf configure --prefix=/usr --with-tests
}

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	./waf build
  ./waf docs
}

check() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  ./waf install --destdir="${srcdir}/tests"
  LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests
}

package() {
  install -dm 755 "${pkgdir}/usr/share/doc/$_pkgname"

  cd "${srcdir}/${_reponame}-${pkgver}"
  ./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}-${pkgver}/build/docs/"* "${pkgdir}/usr/share/doc/$_pkgname"
}

