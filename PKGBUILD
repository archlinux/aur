_name=fonttools
pkgbase=python-"$_name"-git
pkgname=("python-$_name-git" "python2-$_name-git")
pkgver=3.0.r1920
pkgrel=1
pkgdesc='Modify OpenType and TrueType fonts and convert them to and from XML'
arch=('any')
url="https://github.com/behdad/$_name"
license=('MIT')
depends=('python')
makedepends=("python2-setuptools" "python-numpy" "python2-numpy")
#provides=("python-$_name" "python2-$_name")
#conflicts=("python-$_name" "python2-$_name")
source=("git+https://github.com/behdad/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "%s.r%s" \
    "$(git describe --abbrev=0 | sed 's/^v//')" \
    "$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir"
  cp -a fonttools fonttools-py2
  cd fonttools-py2

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python2"

  cd "$srcdir"/fonttools-py2
  python2 setup.py build

  msg "Building Python3"
  cd "$srcdir"/fonttools
  python setup.py build
}

package_python2-fonttools-git() {
  depends=("python2-numpy")

  cd "$srcdir"/fonttools-py2

  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  # fix conflicts with python-fonttools
  mv "$pkgdir"/usr/bin/pyftinspect{,2}
  mv "$pkgdir"/usr/bin/pyftmerge{,2}
  mv "$pkgdir"/usr/bin/pyftsubset{,2}
  mv "$pkgdir"/usr/bin/ttx{,2}
  mv "$pkgdir"/usr/share/man/man1/ttx{,2}.1

  install -D -m755 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  chmod oga+r "$pkgdir"/usr/share/man/man1/ttx2.1
}

package_python-fonttools-git() {
  depends=("python-numpy")

  cd "$srcdir"/fonttools

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -D -m755 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  chmod oga+r "$pkgdir"/usr/share/man/man1/ttx.1
}
