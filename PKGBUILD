# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
_pkgname=dupeguru
pkgname="${_pkgname}-git"
pkgver=4.0.3
pkgrel=1
pkgdesc='Find duplicate files on your system'
arch=('x86_64')
url='https://dupeguru.voltaicideas.net/'
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-polib' 'python-send2trash' 'python-hsaudiotag3k'
         'libxkbcommon-x11')
makedepends=('git' 'python-sphinx')
checkdepends=('python-tox')
source=('package_py.patch'
        'git+https://github.com/hsoft/dupeguru.git'
        'git+https://github.com/hsoft/hscommon#commit=5497c6fec44de6767a6488f540526d70218ef0da'
        'git+https://github.com/hsoft/qtlib.git#commit=45cf0cbf77c87eb591914f0235b3b2e36ef09bb8')
md5sums=('01bc14050c5225d0939d051e54c397a3'
         'SKIP' 'SKIP' 'SKIP')
provides=('dupeguru')
conflicts=('dupeguru' 'dupeguru-se' 'dupeguru-pe' 'dupeguru-me')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.hscommon.url "${srcdir}/hscommon"
  git config submodule.qtlib.url    "${srcdir}/qtlib"
  git submodule update

  patch -p1 package.py <"${srcdir}/package_py.patch"
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

  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${_pkgname}.desktop "${pkgdir}/usr/share/applications"

  mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
  cp -a * "${pkgdir}/usr/lib/${_pkgname}/"
  chmod a+x "${pkgdir}/usr/lib/${_pkgname}/run.py"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s ../lib/${_pkgname}/run.py "${pkgdir}/usr/bin/${_pkgname}"
}
