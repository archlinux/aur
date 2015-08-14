pkgname=python2-rtshell
_name=rtshell
pkgver=4.0.0
pkgrel=1
pkgdesc="Shell commands for managing RT-Middleware running on OpenRTM-aist"
url="https://github.com/gbiggs/rtshell"
depends=('python2' 'openrtm-aist-python' 'python2-rtctree')
makedepends=('python2' 'python2-setuptools' 'expect')
license=('EPLv1.0')
arch=('any')
source=("https://github.com/gbiggs/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('3a459a8aea23539d2ab4378dfb044afba71e129a905c71b9c9e904fb9239dba6')

# FIXME: doc not properly generated
# FIXME: probably some dependencies missing

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  # Script asks for user input for doc generation
  expect -c "spawn python2 setup.py build;
             expect -re \".*Generate documentation?.*\" { send \"n\r\" };
             interact;"
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
