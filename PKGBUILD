# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: jordz <jordz@archlinux.us>

pkgname=nemiver-scrolled-expressions
_pkgname=${pkgname%%-*}
pkgver=0.9.5
pkgrel=1
pkgdesc='C/C++ debugger for GNOME (patch for scrollable expressions included)'
arch=('x86_64' 'i686')
license=('GPL')
url='http://www.gnome.org/projects/nemiver/'
install="${pkgname}.install"
depends=('gdlmm' 'gdb' 'gtksourceviewmm' 'libgtop' 'vte3' 'ghex' 'gsettings-desktop-schemas')
makedepends=('boost' 'intltool' 'itstool' 'gconf' 'gnome-common' 'yelp-tools')
conflicts=('nemiver')
source=("http://ftp.acc.umu.se/pub/GNOME/sources/nemiver/0.9/${_pkgname}-${pkgver}.tar.xz"
        vte2.91.patch
        "expressions_monitor_scrolled_win.patch"::"https://bug749204.bugzilla-attachments.gnome.org/attachment.cgi?id=303187")
options=('!emptydirs')
sha256sums=('33590e3964092cabb629a6ba8415786b054702063a944eca5fe4156048baf8d9'
            '25b7b6d81fac0d465ac8ac854a99135702fef49d1fba214c0f72b4d4674d52eb'
            'c51f1bcb7050d1a2c040880ff5d8d20b8148a388afc8132288757102bc9c2092')

prepare() {	
  cd "${_pkgname}-${pkgver}"

  # Consolidated from patches on git master for https://bugzilla.gnome.org/show_bug.cgi?id=730243
  patch -Np1 -i ../vte2.91.patch
  # Add patch for scrollable expressions
  patch -Np1 -i ../expressions_monitor_scrolled_win.patch "src/persp/dbgperspective/nmv-dbg-perspective.cc"

  NOCONFIGURE=1 AUTOPOINT=intltoolize gnome-autogen.sh
}

build() {	
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --with-boost \
    --disable-scrollkeeper \
    --enable-symsvis=yes \
    --enable-memoryview=yes \
    --enable-gsettings=yes \
    --disable-schemas-compile
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

