pkgname=highly-experimental-git
pkgver=r29.9674a08
pkgrel=1
pkgdesc="Highly Experimental PS1/PS2 (PSF) emulator library"
arch=(i686 x86_64)
url='https://bitbucket.org/kode54/highly-experimental'
license=(GPL3)
depends=(glibc)
makedepends=('git' 'qtchooser')
source=("${pkgname}::git+https://bitbucket.org/kode54/highly-experimental.git")
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/$pkgname"/Core

   # Don't request a static lib, it prevents a dynamic one from being built.
   sed -i '/^CONFIG /s/ staticlib//' Core.pro

   # Install the header files too.
   cat >> Core.pro <<EOF
headers.path = /usr/include/PSX/Core
headers.files += bios.h emuconfig.h iop.h mkhebios.h psx.h r3000.h spu.h
INSTALLS += headers
EOF
}

build() {
   cd "$srcdir/$pkgname"/Core
   qmake Core.pro
   make
}

package() {
   cd "$srcdir/$pkgname"/Core
   make INSTALL_ROOT="$pkgdir" install
}
