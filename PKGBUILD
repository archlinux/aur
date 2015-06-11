# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-textblob-git
pkgver=0.9.1.r355.238aa50
pkgrel=2
pkgdesc='A Python 3 library for processing textual data. Provides an API for diving into commmon natural language processing (NLP) tasks such as part-of-speech tagging, noun phrase extraction, sentiment analysis, classification, translation, and more.'
arch=('any')
url='https://github.com/sloria/textblob'
license=('MIT')
depends=('python' 'python-nltk' 'python-nose' 'python-mock' 'nltk-data')
source=('git+https://github.com/sloria/textblob.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-textblob')
conflicts=('python-textblob')
optdepends=('python-textblob-aptagger-git: A fast and accurte part-of-speech tagger for TextBlob')

pkgver() {
  cd textblob
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "textblob/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" textblob/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd textblob
  python setup.py build
}

check() {
  cd textblob
  python setup.py test --verbose
}

package() {
  cd textblob

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
