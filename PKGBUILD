pkgname=python-jedi-git
_gitname=jedi
epoch=0
pkgver=v0.17.2.r141.216f976f
pkgrel=0
pkgdesc="An awesome autocompletion, static analysis and refactoring library for Python"
arch=(any)
url="https://github.com/davidhalter/jedi"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-jedi')
conflicts=('python-jedi')
options=(!emptydirs)
source=(git+https://github.com/davidhalter/jedi.git
        git+https://github.com/davidhalter/typeshed
        git+https://github.com/typeddjango/django-stubs)
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
      cd "$srcdir/$_gitname"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
      cd "$srcdir/$_gitname"

  git submodule init
  git config submodule."jedi/third_party/typeshed".url "${srcdir}/typeshed"
  git config submodule."jedi/third_party/django-stubs".url "${srcdir}/django-stubs"
  git submodule update --recursive
}

build() {
      cd "$srcdir/$_gitname"

  python setup.py build
}

package() {
      cd "$srcdir/$_gitname"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
