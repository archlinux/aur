pkgname=highly-quixotic-git
pkgver=r25.8b587d1
pkgrel=1
pkgdesc="Highly Quixotic Capcom QSound (QSF) emulator library"
arch=(i686 x86_64)
url='https://gitlab.kode54.net/kode54/Highly_Quixotic'
license=(GPL3)
depends=(glibc)
makedepends=('git' 'qtchooser')
source=("${pkgname}::git+https://gitlab.kode54.net/kode54/Highly_Quixotic.git")
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
headers.path = /usr/include/QSound/Core
headers.files += qsound.h emuconfig.h kabuki.h qmix.h z80.h
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
