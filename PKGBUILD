# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Sandro Munda <munda.sandro@gmail.com>

pkgname=python2-watchdog-git
pkgver=0.8.3.r1073.abb1072
pkgrel=2
pkgdesc='Python 2 library to monitor filesystem events.'
arch=('any')
url='https://github.com/gorakhargosh/watchdog'
license=('custom')
depends=('python2'
         'python2-setuptools'
         'python2-pathtools'
         'python2-yaml'
         'python2-argh'
         )
source=('git+https://github.com/gorakhargosh/watchdog.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python2-watchdog')
conflicts=('python2-watchdog')


pkgver() {
  cd watchdog

  printf "%s." "$(grep -Ri "VERSION_MAJOR = " src/watchdog/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "%s." "$(grep -Ri "VERSION_MINOR = " src/watchdog/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "%s." "$(grep -Ri "VERSION_BUILD = " src/watchdog/version.py | awk 'BEGIN {FS = " "} {print $3}')"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd watchdog

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

# Half the time check fails on one of the 51 tests for delayed queue
# check() {
#  cd watchdog
#  python2 setup.py test --verbose
#}

package() {
  cd watchdog

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  # Conflicts happen because of the /usr/bin/watchmedo file if someone installs both the python2 and 3 packages
  # lets rename the python2 version to watchmedo2
  mv "${pkgdir}/usr/bin/watchmedo" "${pkgdir}/usr/bin/watchmedo2"
}

# vim:set ts=2 sw=2 et:
