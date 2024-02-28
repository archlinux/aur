# Contributor:  jyantis <yantis@yantis.net>
# Contributor: Sandro Munda <munda.sandro@gmail.com>

pkgname=python-watchdog-git
pkgver=4.0.1.r1464.b92b6fa
pkgrel=1
pkgdesc='Python 3 library to monitor filesystem events.'
arch=('any')
url='https://github.com/gorakhargosh/watchdog'
license=('custom')
depends=('python'
         )
source=('git+https://github.com/gorakhargosh/watchdog.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=("python-watchdog=$pkgver")

conflicts=('python-watchdog')

pkgver() {
  cd watchdog

  printf "%s." "$(grep -Ri "VERSION_MAJOR = " src/watchdog/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "%s." "$(grep -Ri "VERSION_MINOR = " src/watchdog/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "%s." "$(grep -Ri "VERSION_BUILD = " src/watchdog/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd watchdog
  python setup.py build
}

# Half the time check fails on one of the 51 tests for delayed queue
# check() {
#  cd watchdog
#  python setup.py test --verbose
#}

package() {
  cd watchdog

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
