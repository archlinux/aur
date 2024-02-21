# Maintainer: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
_base=astra-toolbox
pkgname=python-${_base}-git
pkgver=2.1.3.g2935d56
pkgrel=1
pkgdesc="MATLAB and Python toolbox of high-performance GPU primitives for 2D and 3D tomography"
arch=(x86_64)
url="https://github.com/astra-toolbox/astra-toolbox"
license=(GPL3)
depends=(python-numpy python-scipy python-six boost)
makedepends=(git python-setuptools cython)
source=('astra-toolbox::git+https://github.com/astra-toolbox/astra-toolbox.git'
	'fix-python-install-prefix.patch')
sha512sums=('SKIP'
            'c16dacf023917958888c58ff0220398ae7fe4ac0b634c2e74c0f67ffdf48dda8c09b30c679d6e80a570d8fd86e3fa25084f4fe94bc247af7383a4987fc371629')

provides=('python-astra-toolbox')
conflicts=('python-astra-toolbox')

pkgver() {
  cd "$_base"

  VBASE=$(grep "#define ASTRA_TOOLBOXVERSION_STRING" include/astra/Globals.h | cut -d \" -f 2)
#  echo $VBASE
  #git describe --tags --match v\* --long
  echo -n "$VBASE".g$(git rev-parse --short HEAD) | tr -d '\n' | tr -d ' '
}

prepare() {
  cd ${_base}
# astra does not honor the installation prefix by default
  patch -p1 -i ../fix-python-install-prefix.patch
}

build() {
echo $VBASE
  cd ${_base}
  cd build/linux
  ./autogen.sh
  ./configure --with-python \
		--prefix="$pkgdir"/usr \
		--with-install-type=module
  make
}

package() {
  cd ${_base}
  VBASE=$(grep "#define ASTRA_TOOLBOXVERSION_STRING" include/astra/Globals.h | cut -d \" -f 2)
  cd build/linux
  make install
# ugly fix to make 'import astra' work
  cd "$pkgdir"/usr/lib/python3.11/site-packages
  ln -s astra_toolbox-"$VBASE"-py3.11-linux-x86_64.egg/astra/ astra
}
