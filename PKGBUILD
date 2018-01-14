
pkgname=gpupad-git
_pkgname=gpupad
pkgver=latest
pkgrel=1
pkgdesc='A text editor for efficiently editing GLSL shaders of all kinds.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/houmaster/gpupad"
license=('GPL3')
depends=('qt5-declarative')
makedepends=('qbs' 'git')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=('git+https://github.com/houmaster/gpupad.git')
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  echo "\"${pkgver}\"" > "src/_version.h"
  qbs setup-qt /usr/bin/qmake qt5
  qbs build -d "../${pkgname}-build" profile:qt5 release
}

package() {
  cd "${srcdir}/${_pkgname}"
  qbs install -d "../${pkgname}-build" --no-build --install-root "${pkgdir}/usr" profile:qt5 release
}
