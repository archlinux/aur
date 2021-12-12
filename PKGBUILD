pkgname=highly-quixotic-git
pkgver=r35.977f8ea
pkgrel=1
pkgdesc="Highly Quixotic Capcom QSound (QSF) emulator library"
arch=(i686 x86_64)
url='https://bitbucket.org/losnoco/highly_quixotic'
license=(GPL3)
depends=(glibc)
makedepends=('git' 'qt5-base')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname}::git+https://bitbucket.org/losnoco/highly_quixotic.git")
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/$pkgname"/Core

   # Don't request a static lib, it prevents a dynamic one from being built.
   sed -i '/^CONFIG /s/ staticlib//' Core.pro

   # Add qsound_ctr.c to the sources, it's required.
   sed -i '/^SOURCES /aqsound_ctr.c \\' Core.pro

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
