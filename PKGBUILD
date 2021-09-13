# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=traffictoll-git
_pkgname=TrafficToll
pkgver=1.5.0.r1.g4569b4c
pkgrel=1
pkgdesc="NetLimiter-like traffic shaping for Linux"
arch=("any")
url="https://github.com/cryzed/${_pkgname}"
license=("GPL3")
depends=("python" "python-loguru" "python-psutil" "python-ruamel-yaml")
optdepends=("speedtest-cli: determine the download and upload speed automatically for traffic prioritization"
            "ookla-speedtest-bin: determine the download and upload speed automatically for traffic prioritization")
makedepends=("git" "python-pip" "python-poetry")
conflicts=("traffictoll")
source=("git+https://github.com/cryzed/${_pkgname}.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
