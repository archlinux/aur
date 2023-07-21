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
pkgver=4.4.2
pkgrel=2
pkgdesc="Policy analysis tools for SELinux"
groups=('selinux')
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/SELinuxProject/setools/wiki"
license=('GPL' 'LGPL')
depends=('libsepol>=3.2' 'libselinux>=3.2' 'python' 'python-networkx>=2.0' 'python-setuptools')
optdepends=('python-pyqt5: needed for graphical tools'
            'qt5-tools: display apol help with Qt Assistant')
makedepends=('cython' 'python-tox')
checkdepends=('checkpolicy')
conflicts=("selinux-${pkgname}")
provides=("selinux-${pkgname}=${pkgver}-${pkgrel}")
source=("https://github.com/SELinuxProject/setools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        '0001-SELinuxPolicy-Add-explicit-cast-for-libsepol-message.patch')
sha256sums=('f23e3c8635aa289096ca0218ca6f4568a4346e088bc46f374cb0917b7fb66f05'
            '877849712e1519c40e6a9b94805514729af8c9a17dfa6128f40f16637e626fec')

prepare() {
  cd "${pkgname}"

  # Fix cython 3.0 compatibility
  # https://github.com/SELinuxProject/setools/pull/104
  # https://github.com/SELinuxProject/setools/commit/31e104c3a9ca97038e09d3a4549fe2b8c8df36e8
  patch -Np1 -i ../0001-SELinuxPolicy-Add-explicit-cast-for-libsepol-message.patch
}

build() {
  cd "${pkgname}"
  python setup.py build_ext
  python setup.py build
}

check() {
  cd "${pkgname}"
  python setup.py test
}

package() {
  cd "${pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
