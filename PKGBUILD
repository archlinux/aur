# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=nlsr
_pkgname=nlsr
pkgname=ndn-${_pkgname}-git
pkgver=0.5.2.r11.g7a231c0
pkgrel=1
# epoch=
pkgdesc="Named Data Link State Routing Protocol"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_pkgname}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx' 'ndn-psync' 'ndn-chronosync')
makedepends=('git' 'python' 'python-sphinx' 'doxygen')
checkdepends=()
optdepends=()
provides=("ndn-${_pkgname}")
conflicts=("ndn-${_pkgname}")
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
  git describe --long | sed 's/^NLSR.//;s/\([^-]*-g\)/r\1/;s/-/./g'	
}

prepare() {
	cd "${srcdir}/${_reponame}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}"
	./waf build
  ./waf docs
}

## Check disabled until upstream gets fixed
#check() {
#  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
#  ./waf install --destdir="${srcdir}/tests"
#  LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests-nlsr
#}


package() {
  install -dm 755 "${pkgdir}/usr/share/doc/$_pkgname"

  cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}/build/docs/"* "${pkgdir}/usr/share/doc/$_pkgname"
  mv "${pkgdir}/usr/etc" "${pkgdir}/"
}
