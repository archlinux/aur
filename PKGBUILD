# Maintainer: pingplug <aur at pingplug dot me>

_pkgname=mayo
pkgname=mayo-git
pkgver=0.6.0.r0.ge55c5ee
pkgrel=1
pkgdesc="3D CAD viewer and converter based on Qt and OpenCascade (git version)"
arch=('any')
url="https://github.com/fougue/mayo"
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'opencascade')
makedepends=('unzip' 'patch')
source=("git+https://github.com/fougue/mayo.git#branch=master"
	'mayo.desktop')
sha256sums=('SKIP'
            '09872560c396807d00a7a98dddefdeb734ccdc64e0a752e028194a59622c220b')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}"
  mkdir -p build && cd build
  qmake ../${_pkgname} \
    CASCADE_INC_DIR=/usr/include/opencascade
  make
}

package() {
  cd "${srcdir}"
  install -Dm755 build/mayo "${pkgdir}"/usr/bin/mayo
  install -Dm644 "${_pkgname}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/mayo/LICENSE.txt
  install -Dm644 "${_pkgname}"/images/appicon_256.png "${pkgdir}"/usr/share/mayo/appicon.png
  install -Dm644 mayo.desktop "${pkgdir}"/usr/share/applications/mayo.desktop
}
