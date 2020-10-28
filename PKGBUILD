# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ChronoSync
_pkgname=ndn-chronosync
pkgname=${_pkgname}-git
pkgver=0.5.3.r9.g5f408ae
pkgrel=9
# epoch=
pkgdesc="Synchronization library for distributed realtime applications for NDN"
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
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}"
	./waf build
  ./waf docs
}

check() {
  cd "${srcdir}/${_reponame}"
  ./waf install --destdir="${srcdir}/tests"
	LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests
}

package() {
  install -dm 755 "${pkgdir}/usr/share/doc/$_pkgname"

	cd "${srcdir}/${_reponame}"
	./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}/build/docs/"* "${pkgdir}/usr/share/doc/$_pkgname"
}
