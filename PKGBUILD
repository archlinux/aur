# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=('python-pip-git' 'python2-pip-git')
pkgver=19.0.3.r105.gde242d0e
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=('any')
license=('MIT')
_deps=('setuptools' 'appdirs' 'cachecontrol' 'colorama' 'distlib' 'distro' 'html5lib' 'lockfile'
       'msgpack' 'six' 'packaging' 'pep517' 'progress' 'pytoml' 'retrying' 'requests' 'urllib3'
       'webencodings')
makedepends=("${_deps[@]/#/python-}" "${_deps[@]/#/python2-}" 'python2-ipaddress' 'python-sphinx')
checkdepends=('python-pytest-runner' 'python-scripttest' 'python-virtualenv' 'python-pretend'
              'python-yaml' 'python-mock' 'python-freezegun')
conflicts=('python-pip' 'python2-pip')
source=("pip-$pkgver::git+https://github.com/pypa/pip.git")
sha512sums=('SKIP')

pkgver() {
  cd "pip-$pkgver"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


# shopt -s extglob
# prepare() {
#   cd "$srcdir/pip-$pkgver"

#   # Fix compat with python-progress 1.5
#   # https://github.com/pypa/pip/pull/6319
#   patch -Np1 -i ../progress.patch

#   rm -rf src/pip/_vendor/!(__init__.py)
#   sed -i -e 's/DEBUNDLED = False/DEBUNDLED = True/' \
#          -e '/cachecontrol/a\    vendored("pep517")' \
#             src/pip/_vendor/__init__.py
# }

build() {
  cd "$srcdir/pip-$pkgver"

  python setup.py build
  python2 setup.py build

  cd docs/
  PYTHONPATH="$srcdir/pip-$pkgver/src/" sphinx-build -W -b man -d build/doctrees/man man build/man -c html
  mkdir -p build/man-pip2
  cd build/man
  for manfile in *; do
    sed 's/pip/pip2/g;s/PIP/PIP2/g' $manfile > ../man-pip2/${manfile/pip/pip2}
  done
}

check() {
  cd "$srcdir/pip-$pkgver"
  python setup.py pytest || warning "Tests failed"
}

package_python-pip-git() {
  depends=("${_deps[@]/#/python-}")

  cd "$srcdir/pip-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"

  install -D -m644 LICENSE.txt \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 -t "$pkgdir"/usr/share/man/man1 docs/build/man/*

  PYTHONPATH="$pkgdir"/usr/lib/python3.7/site-packages "$pkgdir"/usr/bin/pip completion --bash \
    | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip
}

package_python2-pip-git() {
  depends=("${_deps[@]/#/python2-}" 'python2-ipaddress')
  conflicts=('python-pyinstall' 'python2-pip')
  replaces=('python-pyinstall')

  cd "$srcdir/pip-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  mv "$pkgdir/usr/bin/pip" "$pkgdir/usr/bin/pip2"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    ${pkgdir}/usr/lib/python2.7/site-packages/pip/__init__.py
  python2 -m compileall ${pkgdir}/usr/lib/python2.7/site-packages/pip/__init__.py

  install -D -m644 LICENSE.txt \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 -t "$pkgdir"/usr/share/man/man1 docs/build/man-pip2/*

  PYTHONPATH="$pkgdir"/usr/lib/python2.7/site-packages "$pkgdir"/usr/bin/pip2 completion --bash \
    | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip2
}
