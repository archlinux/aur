# Maintainer: Oleksii Opaliev <rayder.ua@gmail.com>
# Contributor: Oleksii Opaliev <rayder.ua@gmail.com>
_pkgname=liberasurecode
pkgname=liberasurecode-git
pkgver=1.6.1.r9.gfb13b37
pkgrel=1
pkgdesc="Erasure Code API library written in C with pluggable Erasure Code backends"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
url="https://github.com/openstack/liberasurecode"
depends=('zlib')
makedepends=('doxygen' 'git')
source=("${_pkgname}::git+https://github.com/openstack/liberasurecode.git" "disable-doc-full-path-names.patch")
sha256sums=('SKIP' '9ff00135d87efb99fc558106e7f38b506651673acb4163bdfd1e4428abf325a8')

pkgver() {
  cd "$srcdir/${_pkgname}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i "${srcdir}/disable-doc-full-path-names.patch"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --disable-mmi
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make test || true
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/COPYING
}
