# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-word2vec-git
pkgver=0.7.1.r109.bec7e3a
pkgrel=2
pkgdesc='Python 2 interface to word2vec. Used for converting words into vectors for machine learning and deep learning'
arch=(x86_64)
url='https://github.com/danielfrg/word2vec'
license=('APACHE')
depends=('python2' 'python2-numpy' 'python2-scikit-learn' 'python2-joblib')
source=('git+https://github.com/danielfrg/word2vec.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools' 'make')
provides=('python2-word2vec')
conflicts=('python2-word2vec' 'word2vec-svn' 'python-word2vec')
optdepends=('ipython2: For examples')

pkgver() {
  cd word2vec
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
  cd word2vec

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd word2vec

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
