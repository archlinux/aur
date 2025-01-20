# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
_pkgname=dupeguru
pkgname="${_pkgname}-git"
pkgver=4.3.1.r63.g8f197ea7
pkgrel=2
pkgdesc='Find duplicate files on your system'
arch=('x86_64')
url='https://dupeguru.voltaicideas.net/'
license=('GPL3')
depends=('python' 'python-mutagen' 'python-polib' 'python-pyqt5' 'python-semantic-version'
         'python-send2trash' 'python-xxhash')
makedepends=('git' 'python-distro' 'python-setuptools' 'python-sphinx')
checkdepends=('flake8' 'python-pytest' 'python-tox')
source=('git+https://github.com/arsenetar/dupeguru.git')
sha256sums=('SKIP')
provides=('dupeguru')
conflicts=('dupeguru' 'dupeguru-se' 'dupeguru-pe' 'dupeguru-me')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # Ignore formatting-related test failures
  sed -i '/black --check/d' tox.ini

  # Update sphinx requirement
  sed -i 's/^\(sphinx>=5\.3\.0,<\)8\.0\.0$/\19.0.0/' requirements.txt

  # Fix tox python versions
  sed -i 's/^envlist = .*$/envlist = py37,py38,py39,py310,py311,py312,py313/' tox.ini

  # add missing setuptools dependency for isolated test env
  sed -i '/^deps =/a\    setuptools' tox.ini
}

build() {
  cd "$_pkgname"
  python -m venv env --system-site-packages
  source env/bin/activate
  python -m pip install --no-index --find-links=deps -r requirements.txt
  python build.py --clean
}

check() {
  cd "$_pkgname"
  tox
}

package() {
  cd "$_pkgname"
  python package.py --arch-pkg
  cd "build/${_pkgname}-arch"

  mkdir -p "${pkgdir}/usr/share"/{'applications',"${_pkgname}"}
  mkdir -p "${pkgdir}/usr/lib/${_pkgname}"

  cp -a -- * "${pkgdir}/usr/lib/${_pkgname}/"

  mv "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications"
  mv "${pkgdir}/usr/lib/${_pkgname}"/*.png "${pkgdir}/usr/share/${_pkgname}"

  chmod a+x "${pkgdir}/usr/lib/${_pkgname}/run.py"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s ../lib/${_pkgname}/run.py "${pkgdir}/usr/bin/${_pkgname}"
}
