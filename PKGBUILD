# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgname=highly-quixotic-git
pkgver=r23.c60a359
pkgrel=1
pkgdesc="Highly Quixotic Capcom QSound (QSF) emulator library"
arch=(i686 x86_64)
url='https://bitbucket.org/kode54/highly-quixotic'
license=(unknown)
depends=(glibc)
makedepends=('git' 'qtchooser')
source=("${pkgname}::git+https://bitbucket.org/kode54/highly-quixotic.git")
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
headers.files += qsound.h emuconfig.h
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
