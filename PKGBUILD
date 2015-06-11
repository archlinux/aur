# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-bottlenose-git
pkgver=0.6.2.r113.bf4b02a
pkgrel=2
pkgdesc='A stable, up-to-date Python 2 wraper for the Amazon Product Advertising API'
arch=('any')
url='https://github.com/lionheart/bottlenose'
license=('APACHE')
depends=('python2')
source=('git+https://github.com/lionheart/bottlenose.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-bottlenose')
conflicts=('python2-bottlenose')

pkgver() {
  cd bottlenose
  set -o pipefail
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

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
  cd bottlenose

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd bottlenose
  python2 setup.py test --verbose
}

package() {
  cd bottlenose

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
