# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=valgrind-codspeed
pkgver=3.26.0_0codspeed4
pkgrel=1
_capstone_ver=5.0.9
pkgdesc='Fork of Valgrind to be used in Codspeed'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://github.com/CodSpeedHQ/valgrind-codspeed'
depends=('glibc' 'perl' 'debuginfod')
makedepends=('cmake' 'docbook-xsl' 'gdb')
checkdepends=('procps-ng')
provides=('valgrind')
conflicts=('valgrind')
replaces=('valgrind')
options=('!emptydirs' '!strip' '!lto')
source=(
  https://github.com/CodSpeedHQ/valgrind-codspeed/archive/refs/tags/${pkgver//_/-}.tar.gz
  capstone-${_capstone_ver}.tar.gz::https://github.com/capstone-engine/capstone/archive/refs/tags/${_capstone_ver}.tar.gz
)
sha256sums=('c1d3b2b7cd2d180647e7211b6d16c4b83cdc17039b085465e9d28739df815d71'
            '0619da31af08152600af95c481527ef6d756c0a8404fca7544a4fdf6dfc2c0f9')

prepare() {
  cd valgrind-codspeed-${pkgver//_/-}
  sed -i '/#include <string.h>/a\
#undef strchr\
#undef strrchr\
#undef strstr' callgrind/cycledecode_capstone.c
  sed -i 's/AC_GCC_WARNING_SUBST_NO(\[alloc-size-larger-than=18446744073709551615\], \[FLAG_W_NO_ALLOC_SIZE_LARGER_THAN\])/AC_SUBST([FLAG_W_NO_ALLOC_SIZE_LARGER_THAN], [])/' configure.ac
  sed -i '/XSL_MAN_STYLES = \\/a\
    /usr/share/xml/docbook/xsl-stylesheets/manpages/docbook.xsl \\' docs/Makefile.am
  autoreconf -ifv
}

build() {
  cmake -S capstone-${_capstone_ver} -B capstone-build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCAPSTONE_ARCHITECTURE_DEFAULT=OFF \
    -DCAPSTONE_X86_SUPPORT=ON \
    -DCAPSTONE_ARM64_SUPPORT=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DCAPSTONE_BUILD_CSTOOL=OFF \
    -DCAPSTONE_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/capstone-static" \
    -DCMAKE_C_FLAGS="-fno-stack-protector -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0 -fPIC"
  cmake --build capstone-build
  cmake --install capstone-build

  cd valgrind-codspeed-${pkgver//_/-}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --mandir=/usr/share/man \
    --enable-lto=yes \
    --with-capstone="${srcdir}/capstone-static"
  make
  make -C docs man-pages
}

check() {
  cd valgrind-codspeed-${pkgver//_/-}

  ./vg-in-place --error-exitcode=1 /bin/true

  make check CPPFLAGS= CFLAGS= CXXFLAGS= LDFLAGS=
}

package() {
  cd valgrind-codspeed-${pkgver//_/-}

  make DESTDIR="${pkgdir}" install

  install -Dm644 docs/*.1 -t "$pkgdir/usr/share/man/man1"
}
