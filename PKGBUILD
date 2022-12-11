# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Ossi Saukko <osaukko at gmail dot com>

_name=valgrind
pkgname=valgrind-git
pkgver=3.20.0.r9.g0811a612d
pkgrel=1
pkgdesc='A tool to help find memory-management problems in programs'
arch=(x86_64)
url='http://valgrind.org/'
license=(GPL)
depends=(glibc perl)
makedepends=(gdb openmpi git docbook-xsl)
optdepends=('openmpi: MPI support')
options=(!emptydirs)
provides=(valgrind)
conflicts=(valgrind)
source=("git://sourceware.org/git/valgrind.git"
        https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/valgrind/trunk/valgrind-3.7.0-respect-flags.patch)
b2sums=('SKIP'
        'af556fdf3c02e37892bfe9afebc954cf2f1b2fa9b75c1caacfa9f3b456ebc02bf078475f9ee30079b3af5d150d41415a947c3d04235c1ea8412cf92b959c484a')
options=(!lto) # https://bugs.kde.org/show_bug.cgi?id=338252

pkgver() {
    cd "${_name}"
    #git describe --long --tags | sed -e 's|-|.|g' -e 's|VALGRIND_||g' -e 's|_|.|g'
    git describe --long --tags | sed 's/^VALGRIND_//;s/\([^-]*-g\)/r\1/;s/-/./g;s|_|.|g'
}

prepare() {
  cd valgrind
  patch -Np1 < ../valgrind-3.7.0-respect-flags.patch
  sed -i 's|sgml/docbook/xsl-stylesheets|xml/docbook/xsl-stylesheets-1.79.2-nons|' docs/Makefile.am

  autoreconf -ifv
}

build() {
  # valgrind does not like some of our flags
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  cd valgrind
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --mandir=/usr/share/man
  make
  make -C docs man-pages
}

package() {
  cd "${_name}"
  make DESTDIR="${pkgdir}" install
}
