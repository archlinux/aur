# Maintainer: Michael Serajnik <ms dot mserajnik dot at>
pkgname=traffictoll-git
_pkgname=TrafficToll
pkgver=r35.0add8b6
pkgrel=2
pkgdesc="NetLimiter-like traffic shaping for Linux"
arch=('any')
url="https://github.com/cryzed/${_pkgname}"
license=('GPL3')
depends=('python' 'python-loguru' 'python-psutil' 'python-ruamel-yaml')
makedepends=('python-pip' 'python-poetry')
conflicts=('traffictoll')
source=("git+https://github.com/cryzed/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export HOME=$(mktemp -d) # Don't create a virtual environment inside the user's home dir
}

build() {
  cd "${srcdir}/${_pkgname}"
  poetry build
}

package() {
  INSTALL_PATH="${srcdir}/${_pkgname}/dist/${_pkgname}-*.whl"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location $INSTALL_PATH
}
