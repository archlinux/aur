# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=python-pyalsaaudio-git
pkgname=(python-pyalsaaudio-git python2-pyalsaaudio-git)
_pkgname=pyalsaaudio
pkgver=0.8.4.r25.g12f8076
pkgrel=1
pkgdesc="ALSA wrappers for Python (development version)"
arch=('i686' 'x86_64')
url="http://larsimmisch.github.io/pyalsaaudio/"
license=('custom: PSF')
makedepends=('python-setuptools' 'python2-setuptools' 'alsa-lib')
source=("git+https://github.com/larsimmisch/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup ${_pkgname} python2-pyalsaaudio
}

build() {
  # build for python 3
  cd ${_pkgname}
  python setup.py build

  # build for python 2
  cd ../python2-pyalsaaudio
  python2 setup.py build
}

# package for python 3
package_python-pyalsaaudio-git() {
  depends=('python' 'alsa-lib')
  pkgdesc="${pkgdesc/Python/Python 3}"
  conflicts=('python-pyalsaaudio')
  provides=('python-pyalsaaudio')

  cd ${_pkgname}

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# package for python 2
package_python2-pyalsaaudio-git() {
  depends=('python2' 'alsa-lib')
  pkgdesc="${pkgdesc/Python/Python 2}"
  conflicts=('python2-pyalsaaudio')
  provides=('python2-pyalsaaudio')

  cd python2-pyalsaaudio

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
