# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-msgpack-numpy-git
pkgver=0.3.2.r15.gd6603cd
_gitname=msgpack-numpy
pkgrel=2
pkgdesc='Python 2 package that provides encoding and decoding routines that enable the serialization and deserialization of numerical and array data types provided by numpy using the highly efficient msgpack format.'
arch=('any')
url='https://github.com/lebedov/msgpack-numpy'
license=('BSD')
depends=('python2'
         'python2-numpy'
         'python2-msgpack')
source=('git+https://github.com/lebedov/msgpack-numpy')
sha256sums=('SKIP')
provides=('python2-msgpack-numpy')
conflicts=('python2-msgpack-numpy')

pkgver() {
  cd "$_gitname"
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}

    # patch any #!/usr/bin/python to #!/usr/bin/python2
    for file in $(find . -name '*.py' -print); do
      sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
      sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
    done

    python2 setup.py build
}

check() {
  cd ${_gitname}
  python2 setup.py test --verbose
}


package() {
    cd ${_gitname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
