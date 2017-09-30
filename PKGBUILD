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
pkgver=4.1.1
pkgrel=3
pkgdesc="Policy analysis tools for SELinux"
groups=('selinux')
arch=('i686' 'x86_64')
url="https://github.com/TresysTechnology/setools/wiki"
license=('GPL' 'LGPL')
depends=('libselinux>=2.7' 'python' 'python-networkx>=2.0')
optdepends=('python-pyqt5: needed for graphical tools'
            'python2: Python2 support'
            'python2-enum34: Python2 support'
            'python2-networkx: Python2 support'
            'qt5-tools: display apol help with Qt Assistant')
makedepends=('bison' 'flex' 'swig'
             'python-setuptools' 'python-tox'
             'python2' 'python2-setuptools' 'python2-networkx>=2.0' 'python2-mock' 'python2-tox')
checkdepends=('checkpolicy' 'python2-enum34')
conflicts=("selinux-${pkgname}")
provides=("selinux-${pkgname}=${pkgver}-${pkgrel}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TresysTechnology/setools/archive/${pkgver}.tar.gz"
        '0001-Update-NetworkX-support-to-2.0.-NetworkX-2.0-has-API.patch')
sha256sums=('46a927ea2b163cbe1d35cc35da43e45853e13720c7e02d4cf75a498783c19610'
            '4ff4c3e33de6fddcf42b766904a65926f5d4a2bc543a66e8c1e1f24c71350176')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Flex 2.6.3 generates C code which causes -Werror to trigger:
  #     libqpol/policy_scan.c:398:0: error: "yywrap" redefined [-Werror]
  #         #define yywrap() (/*CONSTCOND*/1)
  #     libqpol/policy_scan.c:74:0: note: this is the location of the previous definition
  #         #define yywrap yywrap
  # This a a bug in Flex, https://github.com/westes/flex/issues/155
  # Do not make the build fail because of this
  sed -e "s/'-Werror',//" -i setup.py

  # NetworkX 2.0 has API breakage
  patch -Np1 -i ../0001-Update-NetworkX-support-to-2.0.-NetworkX-2.0-has-API.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build_ext
  python2 setup.py build
  python setup.py build_ext
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py test
  python setup.py test
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
