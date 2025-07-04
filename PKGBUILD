# Maintainer: David Manouchehri
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: megamoth
# Contributor: xorly

_gitname='pulseview'
pkgname="${_gitname}-git"
pkgver=0.3.0.r1172.ge2fe9dfb
pkgrel=1
pkgdesc="A Qt based logic analyzer GUI for sigrok. (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://sigrok.org/wiki/Main_Page"
license=('GPL3')
depends=('libsigrok-git' 'libsigrokdecode-git' 'qt5-base' 'boost-libs' 'qt5-svg')
makedepends=('git' 'cmake' 'boost' 'qt5-tools')
conflicts=("${_gitname}")
provides=("${_gitname}")
#source=("git://sigrok.org/${_gitname}") unreachable at this moment (2025/07/04)
source=("git+https://github.com/sigrokproject/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --exclude pulseview-unreleased --long | sed 's/^pulseview-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${srcdir}/${_gitname}" \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_CXX_FLAGS=-fext-numeric-literals \
        -DDISABLE_WERROR=TRUE \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
