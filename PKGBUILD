# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python2-pylint
pkgver=1.9.5
pkgrel=1
pkgdesc="Analyzes Python code looking for bugs and signs of poor quality"
arch=('any')
url="https://pylint.org"
license=('GPL')
depends=('python2-astroid' 'python2-setuptools' 'python2-mccabe' 'python2-isort'
         'python2-backports.functools_lru_cache' 'python2-configparser' 'python2-singledispatch')
checkdepends=('python2-pytest-runner' 'mpdecimal')
optdepends=('tk: Pylint GUI'
            'graphviz: To have other output formats than dot or vcg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PyCQA/pylint/archive/pylint-$pkgver.tar.gz")
sha512sums=('0ba1feabd21617de5dbfdd98a73fb285fb3e4c19afd77ecc21807a762335ebb4250edeea89d6ec14178ed9e154ca7471b0ab65f0bd3cbde2b318b1125441beb5')

prepare() {
  sed -i 's/pytest<3.3/pytest/' pylint-pylint-$pkgver/setup.py

  cd "$srcdir"/pylint-pylint-$pkgver/pylint
  sed -e "s|/usr/bin/env python|/usr/bin/env python2|" -e "s|/usr/bin/python$|/usr/bin/python2|" -i epylint.py __main__.py test/input/noext test/data/ascript
}

build() {
  cd "$srcdir"/pylint-pylint-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/pylint-pylint-$pkgver
  python2 setup.py pytest
}

package() {
  depends=('python2-astroid' 'python2-setuptools' 'python2-mccabe' 'python2-isort'
           'python2-backports.functools_lru_cache' 'python2-configparser' 'python2-singledispatch')

  cd pylint-pylint-$pkgver

  python2 setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1

  install -d "$pkgdir"/usr/share/man/man1
  install -m644 man/* "$pkgdir"/usr/share/man/man1

  for _exe in epylint pylint pyreverse symilar; do
     mv "$pkgdir"/usr/bin/${_exe}{,2}
     mv "$pkgdir"/usr/share/man/man1/${_exe}{,2}.1
  done
}
