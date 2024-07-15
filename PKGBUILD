# Maintainer: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
_base=astra-toolbox
pkgname=python-${_base}-git
pkgver=2.2.0.g73388dd
pkgrel=1
pkgdesc="MATLAB and Python toolbox of high-performance GPU primitives for 2D and 3D tomography"
arch=(x86_64)
url="https://github.com/astra-toolbox/astra-toolbox"
license=(GPL3)
depends=(python-numpy python-scipy python-six boost)
makedepends=(git python-setuptools cython)
source=('astra-toolbox::git+https://github.com/astra-toolbox/astra-toolbox.git')
sha512sums=('SKIP')

provides=('python-astra-toolbox')
conflicts=('python-astra-toolbox')

pkgver() {
  cd "$_base"

  VBASE=$(grep "#define ASTRA_TOOLBOXVERSION_STRING" include/astra/Globals.h | cut -d \" -f 2)
  echo -n "$VBASE".g$(git rev-parse --short HEAD) | tr -d '\n' | tr -d ' '
}

build() {
  cd ${_base}
  cd build/linux

  ./autogen.sh
  ./configure --with-python \
		--prefix=/usr \
		--with-install-type=module
  make
}

package() {
  cd ${_base}
  cd build/linux

  make DESTDIR=${pkgdir} install
}
