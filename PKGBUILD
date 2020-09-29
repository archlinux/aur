# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Giovanni Scafora <giovanni@archlinux.org>
# Contributor : Simon Sapin <simon dot sapin at exyr dot org>
# Contributor : Michal Marek <reqamst at gmail dot com>
# Contributor : Rick W. Chena <stuffcorpse@archlinux.us>
# Contributor : Andrea Fagiani <andfagiani _at_ gmail dot com>


pkgname=python-cssutils
_name="${pkgname#python-}"

pkgver=1.0.2
pkgrel=6

pkgdesc='CSS Cascading Style Sheets library for Python'
arch=('any')
url="http://cthedot.de/$_name"
license=('LGPL3')

makedepends=('python-setuptools')
depends=('python')
checkdepends=('python-nose')

source=("https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a2fcf06467553038e98fea9cfe36af2bf14063eb147a70958cfcaa8f5786acaf')


prepare() {
  cd "$_name-$pkgver"
  # don't pin old versions of testrunner
  sed -i "/tests_require/{s/pbr < 1\.7\.0/pbr/;s/'mock', //}" setup.py
  sed -i 's/\(import mock\)/from unittest \1/' "src/$_name/tests/"*.py
  find . -name __init__.py -exec sed -i 's/w\(indows-1252\)/W\1/g' '{}' ';'
}

build() {
  cd "$_name-$pkgver"
  2to3 --no-diffs -nw src
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python setup.py nosetests
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.txt -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/* -t"$pkgdir/usr/share/doc/$pkgname/examples/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
