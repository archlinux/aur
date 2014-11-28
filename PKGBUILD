# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Achraf cherti <achrafcherti@gmail.com>

pkgname=superswitcher
pkgver=0.6
pkgrel=4
pkgdesc='Powerful window and workspace switching using the Super key'
arch=('i686' 'x86_64')
url='http://code.google.com/p/superswitcher/'
license=('GPL')
depends=('gconf' 'libwnck' 'dbus-glib')
makedepends=('intltool' 'patch')
options=('!emptydirs')
source=(http://superswitcher.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
        superswitcher_0.6_arch_linux_patch.patch)
md5sums=('e8620c8502dccc3f3d3d84e0eb359142'
         'c8e046fecb2d19e83402647bc3bc78da')

build() {
  cd ${pkgname}-${pkgver}

  patch -Np2 -i "${srcdir}"/superswitcher_0.6_arch_linux_patch.patch

  sed -i 's/$(addsuffix .in, $(INTLTOOL_BUILT))/`addsuffix .in, $INTLTOOL_BUILT`/' Makefile.am
  sed -i -e 's/\(^GNOME_COMPILE_WARNINGS(yes)\)/#\1/' configure.in
  sed -i -e 's/\(AM_CFLAGS = @WARN_CFLAGS@\)/#\1/' src/Makefile.am

  aclocal

  autoconf

  automake \
    --add-missing

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make prefix="${pkgdir}"/usr install
}
