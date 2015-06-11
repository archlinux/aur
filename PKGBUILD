# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Sandro Munda <munda.sandro@gmail.com>

# Note this version is confusing because even though this is his primary repo
# the pypy version is 0.1.2 and this is only 0.1.1.2

pkgname=python-pathtools-git
pkgver=0.1.1.r42.06d2c7d
pkgrel=1
pkgdesc="Path utilities for Python 2."
arch=('any')
url='https://github.com/gorakhargosh/pathtools'
license=('MIT')
depends=('python' 'python-setuptools')
source=('git+https://github.com/gorakhargosh/pathtools.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python-pathtools')
conflicts=('python-pathtools')

pkgver() {
  cd pathtools
  printf "%s." "$(grep -Ri "VERSION_MAJOR = " pathtools/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "%s." "$(grep -Ri "VERSION_MINOR = " pathtools/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "%s." "$(grep -Ri "VERSION_BUILD = " pathtools/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pathtools

  python setup.py build
}

package() {
  cd pathtools

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
