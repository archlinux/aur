# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Danilo Bargen <gezuru@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Jesus Alvarez

pkgname=python38-jedi
_gitcommit=fae26fa7a427b94a21e11500503d8008647e6309
pkgver=0.18.1
pkgrel=1
pkgdesc="Awesome autocompletion for python"
url="https://github.com/davidhalter/jedi"
arch=('any')
license=('MIT')
depends=('python' 'python38-parso')
makedepends=('git' 'python38-setuptools' 'python38-sphinx' 'python38-sphinx_rtd_theme')
checkdepends=('python38-pytest' 'python38-parso')
source=("git+https://github.com/davidhalter/jedi#commit=${_gitcommit}"
        git+https://github.com/davidhalter/typeshed
        git+https://github.com/davidhalter/django-stubs)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd jedi
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd jedi
  git submodule init
  git config submodule."jedi/third_party/typeshed".url "${srcdir}/typeshed"
  git config submodule."jedi/third_party/django-stubs".url "${srcdir}/django-stubs"
  git submodule update --recursive
}

build() {
  cd jedi
  python3.8 setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd jedi
  # skip pytest 6 test issues https://github.com/davidhalter/jedi/issues/1660
  # these are also skipped in upstream's Travis CI
  pytest test -k 'not test_completion[pytest'
}

package() {
  cd jedi
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 CHANGELOG.rst README.rst docs/_build/text/*.txt -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 docs/_build/man/jedi.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim: ts=2 sw=2 et:
