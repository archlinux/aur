# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
_pkgname=dupeguru
pkgname="${_pkgname}-git"
pkgver=4.0.4.r59.g092cf147
pkgrel=1
pkgdesc='Find duplicate files on your system'
arch=('x86_64')
url='https://dupeguru.voltaicideas.net/'
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-polib' 'python-send2trash' 'python-hsaudiotag3k'
         'libxkbcommon-x11')
makedepends=('git' 'python-sphinx')
checkdepends=('python-tox')
source=('git+https://github.com/arsenetar/dupeguru.git')
sha256sums=('SKIP')
provides=('dupeguru')
conflicts=('dupeguru' 'dupeguru-se' 'dupeguru-pe' 'dupeguru-me')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
