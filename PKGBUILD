pkgname=python2-rtshell
_name=rtshell
pkgver=4.1.0
pkgrel=2
pkgdesc="Shell commands for managing RT-Middleware running on OpenRTM-aist"
url="https://github.com/gbiggs/rtshell"
depends=('python2' 'openrtm-aist-python' 'python2-rtctree')
makedepends=('python2' 'python2-setuptools' 'expect')
license=('EPLv1.0')
arch=('any')
source=("https://github.com/gbiggs/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('e2db912fccd0ae3fa24e2d3e32c0b9bb86ab5133db5b8d018d3201422e3acbd8')

# FIXME: doc not properly generated
# FIXME: probably some dependencies missing

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  # Script asks for user input for doc generation
  expect -c "spawn python2 setup.py build;
             expect -re \".*Generate documentation?.*\" { send \"n\r\" };
             interact;"

  # Fix for Python 2
  sed -i "s:PYTHON_COMMAND=python:PYTHON_COMMAND=python2:g" data/shell_support
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  # Script asks for user input for doc generation
  expect -c "spawn python2 setup.py install --root="${pkgdir}" --optimize=1;
             expect -re \".*Generate documentation?.*\" { send \"n\r\" };
             interact;"

  # Fix paths
  sed -i "s:${pkgdir}::g" $(find ${pkgdir} -type f)
}
