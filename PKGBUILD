# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-proxyenv-git
pkgver=.r24.a790e3a
pkgrel=1
pkgdesc='A python module to create a HTTP proxy in a docker container and use it'
arch=('any')
url='https://github.com/mwilck/proxyenv'
license=('custom')
depends=('python' 'python-docker-py' 'python-htpasswd-git')
source=('git+https://github.com/mwilck/proxyenv.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-proxyenv')
conflicts=('python-proxyenv' 'python2-proxyenv-git')

pkgver() {
  cd proxyenv
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "version = " setup.py; then
      printf "%s.%s" "$(grep -R "version = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    elif grep --quiet "version=" setup.py; then
      printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd proxyenv
  python setup.py build
}

check() {
  cd proxyenv
  python setup.py test --verbose
}

package() {
  cd proxyenv

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
