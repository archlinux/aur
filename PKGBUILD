# Maintainer: DanManN <dnahimov@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-spacy-git
_origpkgname=spaCy
pkgver=2.1.0a4.r9320.0f83b98a
pkgrel=4
pkgdesc="A free open-source library for Natural Language Processing in Python"
arch=("x86_64")
url="https://spacy.io/"
license=("MIT")
depends=("python-cymem"
         "python-preshed"
         "python-thinc"
         "python-blis"
         "python-murmurhash"
         "python-wasabi"
         "python-srsly"
         "python-numpy"
         "python-requests"
         "python-jsonschema"
         "python-regex"
         "python-plac"
         "cython"
         "python-pytest"
         "python-pytest-timeout"
         "python-mock"
         "flake8"
        )

makedepends=('git' 'python-setuptools' 'python-wheel')
provides=('python-spacy')
conflicts=('python-spacy')
source=("git+https://github.com/explosion/$_origpkgname.git")
md5sums=('SKIP')

prepare() {
  cd "$_origpkgname"
  git checkout $(curl https://api.github.com/repos/explosion/$_origpkgname/releases | grep tag_name | cut -d '"' -f4 | head -n 1)
}

pkgver() {
  cd "$_origpkgname"
  printf "%s.r%s.%s" "$(cat spacy/about.py | grep -i version | grep -v '#' | cut -d '"' -f2 | head -n 1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_origpkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
