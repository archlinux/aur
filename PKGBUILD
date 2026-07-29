# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

# /!\ Important note when upgrading from setools 3 /!\
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
pkgver=4.7.1
pkgrel=1
pkgdesc="Policy analysis tools for SELinux"
groups=('selinux')
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/SELinuxProject/setools/wiki"
license=('GPL' 'LGPL')
depends=('libsepol>=3.9' 'libselinux>=3.9' 'python' 'python-networkx>=2.6' 'python-setuptools')
optdepends=('python-fastmcp-slim: for SETools AI tools'
            'python-graphviz: for seinfoflow, sedta, apol'
            'python-pyqt6: needed for graphical tools'
            'qt6-tools: display apol help with Qt Assistant')
makedepends=('cython' 'python-tox')
checkdepends=('checkpolicy' 'python-fastmcp-slim' 'python-pyqt6' 'python-pytest' 'python-pytest-qt')
conflicts=("selinux-${pkgname}")
provides=("selinux-${pkgname}=${pkgver}-${pkgrel}")
source=("https://github.com/SELinuxProject/setools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('9b414eae7f17aa6ca53248d11d74fad01582a21985c78a483fa1240e70bd3b6a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build_ext
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  # Instructions from https://github.com/SELinuxProject/setools/blob/4.5.1/README.md#unit-tests
  python setup.py build_ext -i

  # Work around failing test when PySide6 is installed by forcing to use PyQt6
  # instead (cf. documentation of pytest-qt:
  # https://pytest-qt.readthedocs.io/en/latest/intro.html#requirements )
  # https://github.com/archlinuxhardened/selinux/issues/141
  # https://github.com/SELinuxProject/setools/issues/160
  PYTEST_QT_API='pyqt6' pytest tests
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
