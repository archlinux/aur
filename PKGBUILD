# Maintainer: Carlos José Ruiz-Henestrosa Ruiz <ruizh.cj@gmail.com>
pkgname=beancount-import-git
_name=${pkgname%-git}
pkgver=1.3.3.r2.bd39126
pkgrel=1
pkgdesc="Semi-automatic importer from external data sources into beancount"
arch=('any')
url="https://github.com/jbms/beancount-import"
license=('MIT')
depends=('beancount>=2.1.3'
         'python>=3.5'
         'python-setuptools'
         'python-tornado'
         'python-numpy'
         'python-scipy'
         'python-scikit-learn'
         'python-nltk'
         'python-dateutil'
         'python-atomicwrites>=1.3.0'
         'python-jsonschema'
         'python-watchdog')

makedepends=('git')

provides=("beancount-import=${pkgver%%.r*}")
conflicts=("beancount-import")
source=('git://github.com/jbms/beancount-import.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name}"

  # The repo does not tag releases, so we have to get creative
  _release_commit=$(git log -L '/version=/',+1:setup.py \
                            --max-count=1 --pretty="format:%h" | \
                    head --lines=1)
  _ver=$(grep version setup.py | cut --delimiter="'" --fields=2)
  printf "%s.r%s.%s" \
    "${_ver}" \
    "$(git rev-list --count ${_release_commit}..HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_name}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
