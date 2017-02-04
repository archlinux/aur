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
pkgver=4.1.0
pkgrel=1
pkgdesc="Policy analysis tools for SELinux"
groups=('selinux')
arch=('i686' 'x86_64')
url="https://github.com/TresysTechnology/setools/wiki"
license=('GPL' 'LGPL')
depends=('libselinux>=2.5' 'python' 'python-networkx')
optdepends=('python-pyqt5: needed for graphical tools'
            'python2: Python2 support'
            'python2-enum34: Python2 support'
            'python2-networkx: Python2 support'
            'qt5-tools: display apol help with Qt Assistant')
makedepends=('bison' 'flex' 'swig' 'qt5-tools'
             'python-setuptools' 'python-tox'
             'python2' 'python2-setuptools' 'python2-networkx' 'python2-mock' 'python2-tox')
checkdepends=('checkpolicy')
conflicts=("selinux-${pkgname}")
provides=("selinux-${pkgname}=${pkgver}-${pkgrel}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TresysTechnology/setools/archive/${pkgver}.tar.gz")
sha256sums=('cc251572c50298e2705617c8a0ddb5ae7cfe0bde2480bc0c6a4e44341d3df831')

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

  # Install apol.qch too
  sed "s/\(package_data={'': \['\*\.ui', '\*\.qhc'\)\]/\1, '*.qch']/" -i setup.py
  echo 'include setoolsui/apol/apol.qch' >> MANIFEST.in
}

build() {
  cd "${pkgname}-${pkgver}"

  # Rebuild apol help files
  qcollectiongenerator qhc/apol.qhcp
  cp -f qhc/apol.qhc setoolsgui/apol/apol.qhc
  cp -f qhc/apol.qch setoolsgui/apol/apol.qch

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
