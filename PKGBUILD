# Maintainer: Sardelli Tommaso <lacappannadelloziotom [at] gmail [dot] com>
# Contributor: Philippe Mongeau <ph.mongeau@gmail.com>

pkgname=ympd-git
_pkgname=ympd
pkgver=1.3.0.r55.g612f8fc
pkgrel=1
pkgdesc="A standalone MPD Web GUI"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.ympd.org"
license=('GPL2')
depends=('libmpdclient' 'openssl')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
backup=('etc/default/ympd')
source=(
  "git+https://github.com/notandy/ympd.git"
  "https://github.com/notandy/$_pkgname/pull/191.patch"
)
sha256sums=('SKIP'
            'aa8fd50482d95840e4296533cf63529348f5794d596f7e12a1911322b05fdd88')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -E 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
  patch -d "${_pkgname}" -Np1 -i "${srcdir}"/191.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build && cd build;
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644  "${srcdir}/${_pkgname}/contrib/ympd.service" "$pkgdir/usr/lib/systemd/system/ympd.service"
  install -Dm644  "${srcdir}/${_pkgname}/contrib/ympd.default" "$pkgdir/etc/default/ympd"
}

# vim:set ts=2 sw=2 et:
