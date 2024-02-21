# Maintainer: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
_base=astra-toolbox
pkgname=python-${_base}
pkgver=2.1.0
pkgrel=1
pkgdesc="MATLAB and Python toolbox of high-performance GPU primitives for 2D and 3D tomography"
arch=(x86_64)
url="https://github.com/astra-toolbox/astra-toolbox"
license=(GPL3)
depends=(python-numpy python-scipy python-six boost)
makedepends=(python-setuptools cython)
source=(https://github.com/astra-toolbox/astra-toolbox/archive/refs/tags/v${pkgver}.tar.gz
	fix-python-install-prefix.patch)
sha512sums=('676d5bfa24f40c855cce6333052a829339a84b83665d432f7942d05e81f87c943bb10ed34c3b02903e35c0e039e103a4f18679306f51e24528c965ab5d806375'
            '5c21c3d293d2ae140d7216f3c52c9a4a31b4c39047da0a3c97e954a17678446556d508b4e3020bc426f0591af6323929843d4d32c585058ffd2285a32f65f84f')
prepare() {
  cd ${_base}-${pkgver}
# astra does not honor the installation prefix by default
  patch -p1 -i ../0001-fix-python-install-prefix.patch
}

build() {
  cd ${_base}-${pkgver}
  cd build/linux
  ./autogen.sh
  ./configure --with-python \
		--prefix="$pkgdir"/usr \
		--with-install-type=module
  make
}

package() {
  cd ${_base}-${pkgver}
  cd build/linux
  make install
# ugly fix to make 'import astra' work
  cd "$pkgdir"/usr/lib/python3.11/site-packages
  ln -s astra_toolbox-2.1.0-py3.11-linux-x86_64.egg/astra/ astra
}
