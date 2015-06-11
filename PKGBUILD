# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-neurokernel-git
pkgver=0.1.r1134.5fed176
_gitname=neurokernel
pkgrel=2
pkgdesc="Neurokernel is a Python framework for developing models of the fruit fly brain and executing them on multiple NVIDIA GPUs (For Python 2)"
arch=('any')
url='http://neurokernel.github.io'
license=('BSD')
depends=('python2'
         'cuda'
         'python2-bottleneck'
         'python2-matplotlib'
         'python2-pyzmq'
         'python2-scipy'
         'python2-numpy'
         'python2-numexpr'
         'python2-pytables'
         'python2-futures'
         'python2-networkx'
         'python2-pycuda'
         'python2-twiggy'
         'python2-bidict-git'
         'python2-msgpack-numpy-git'
         'python2-nose'
         'python2-mock'
         'python2-h5py'
         'python2-setuptools'
         'cython2')
source=('git+https://github.com/neurokernel/neurokernel.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('python2-neurokernel')
conflicts=('python2-neurokernel')

pkgver() {
  cd ${_gitname}
  set -o pipefail

  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep -i --quiet "version = " setup.py; then
      printf "%s.%s" "$(grep -Ri "version = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    elif grep -i --quiet "version=" setup.py; then
      printf "%s.%s" "$(grep -Ri "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
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
