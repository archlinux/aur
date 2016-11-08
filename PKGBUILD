# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# /!\ Important note /!\
# When upgrading with policycoreutils 2.5-3, pacman fails with:
#    failed to prepare transaction (could not satisfy dependencies)
#    :: policycoreutils: installing setools (4.0.1-1) breaks dependency 'setools3-libs'
# In order to upgrade setools, you can either:
#   - build setools 4.0.1-1 and setools3-libs 3.3.8-1 and install both packages
#     at the same time (with a single "pacman -U" command)
#   - temporarily uninstall policycoreutils while upgrading and install it
#     again afterwards, or
#   - replace setools 3.3.8 with setools3-libs and install setools then.

pkgname=setools
pkgver=4.0.1
pkgrel=1
pkgdesc="Policy analysis tools for SELinux"
groups=('selinux')
arch=('i686' 'x86_64')
url="https://github.com/TresysTechnology/setools/wiki"
license=('GPL' 'LGPL')
depends=('libselinux>=2.5' 'python' 'python-networkx')
optdepends=('python-pyqt5: needed for graphical tools'
            'python2: Python2 support'
            'python2-networkx: Python2 support')
makedepends=('bison' 'flex' 'swig'
             'python-setuptools' 'python-tox'
             'python2' 'python2-setuptools' 'python2-networkx' 'python2-mock' 'python2-tox')
checkdepends=('checkpolicy')
conflicts=("selinux-${pkgname}")
provides=("selinux-${pkgname}=${pkgver}-${pkgrel}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TresysTechnology/setools/archive/${pkgver}.tar.gz")
sha256sums=('4c2049877f2f68e4485b72bc280fe20127b49a019169a2cf1d8295c908bdcdfe')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Flex 2.6.1 generates C code which causes -Wsign-compare to trigger:
  #     libqpol/policy_scan.c: In function ‘yy_scan_bytes’:
  #     libqpol/policy_scan.c:3254:17: warning: comparison between signed and
  #     unsigned integer expressions [-Wsign-compare]
  #        for ( i = 0; i < _yybytes_len; ++i )
  #                       ^
  # Do not make the build fail because of this
  sed -e "s/\('-Werror',\)/\1 '-Wno-error=sign-compare',/" -i setup.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py test
  python setup.py test
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
  python setup.py install --root="$pkgdir" --optimize=1
}
