# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-textblob-aptagger-git
pkgver=0.3.0.dev.r15.92a9b99
pkgrel=1
pkgdesc='A fast and accurte part-of-speach tagger for Python 2 based on the Averaged Perception. For use with TextBlob'
arch=('any')
url='https://github.com/sloria/textblob-aptagger'
license=('MIT')
depends=('python2' 'python2-textblob-git')
source=('git+https://github.com/sloria/textblob-aptagger.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-textblob-aptagger')
conflicts=('python2-textblob-aptagger')

pkgver() {
  cd textblob-aptagger
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "textblob_aptagger/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" textblob_aptagger/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd textblob-aptagger

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd textblob-aptagger
  python2 setup.py test --verbose
}

package() {
  cd textblob-aptagger

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
