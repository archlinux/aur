# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Tim Jester-Pfadt <t.jp at gmx.de>

pkgname=python-fuel-git
pkgver=0.1.1.r289.g1d6292d
pkgrel=1
pkgdesc='A data pipeline framework for machine learning.'
arch=(x86_64)
url='https://github.com/mila-udem/fuel'
license=('MIT')
depends=('python' 'python-pyzmq' 'python-progressbar' 'python-h5py' 'python-pytables' 'python-pyyaml' 'python-picklable-itertools')
source=('git+https://github.com/mila-udem/fuel.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-fuel')

pkgver() {
  cd "$srcdir/fuel"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/fuel"
  python setup.py build
}

check() {
  cd "$srcdir/fuel"
  python setup.py test --verbose
}

package() {
  cd "$srcdir/fuel"

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
