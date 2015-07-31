pkgname=python2-rtshell
_name=rtshell
pkgver=3.0.1
pkgrel=1
pkgdesc="Shell commands for managing RT-Middleware running on OpenRTM-aist"
url="https://github.com/gbiggs/rtshell"
depends=('python2' 'openrtm-aist-python' 'python2-rtctree')
makedepends=('python2' 'python2-setuptools' 'expect')
license=('EPLv1.0')
arch=('any')
source=("https://github.com/gbiggs/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('6f22c8783028cc548fde9d2c2abb9b1c')

# FIXME: doc not properly generated
# FIXME: probably some dependencies missing

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  # Fix for Python 2 scripts
  sed -i "s,env python *$,env python2,g" $(find . -type f)
  sed -i "s,/usr/bin/python *$,/usr/bin/env python2,g" $(find . -type f)

  # Script asks for user input for doc generation
  expect -c "spawn python2 setup.py build;
             expect -re \".*Generate documentation?.*\" { send \"n\r\" };
             interact;"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  # Script asks for user input for doc generation
  expect -c "spawn python2 setup.py install --root="${pkgdir}" --optimize=1;
             expect -re \".*Generate documentation?.*\" { send \"y\r\" };
             interact;"
}
