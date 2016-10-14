# Maintainer: cth451 <cth451@gmail.com>

pkgname=linthesia
pkgver=0.4.3
pkgrel=4
pkgdesc="A game of playing music. A fork of Synthesia"
arch=('i686' 'x86_64')
url="http://linthesia.sourceforge.net/"
license=('GPL2')
depends=('gtkmm' 'gconfmm' 'gtkglextmm' 'alsa-lib' 'fluidsynth')
makedepends=('gtkmm' 'gconfmm' 'gtkglextmm' 'alsa-lib' 'svn')
source=("svn+http://svn.code.sf.net/p/linthesia/code/#revision=r87" 
0000-TextWriter.patch 
0001-Makefile-CXXFLAGS.patch)
sha256sums=('SKIP' '7953b732355bae0417d2eaff421a46d786201f104db289caa291a6a36f6fc199' '9e331f9f4656837bb1b89c1ff36e8499a6a392eec28855f5f73b856c7dea4c78')

build() {
    cd "$srcdir/code"
    patch -p1 -i "$srcdir/0000-TextWriter-ptr-compare.patch"
	patch -p1 -i "$srcdir/0001-Makefile-CXXFLAGS.patch"
    make GRAPHDIR="/usr/share/linthesia/graphics"
    cd "$srcdir/code/extra"
    sed -i linthesia.desktop -e "s/Exec=linthesia/Exec=\/usr\/games\/linthesia/g"
}

package () {
    cd "$srcdir/code"
    make DESTDIR="$pkgdir" install
    # Install desktop file
    mkdir "$pkgdir/usr/share/applications"
    install -Tm644 extra/linthesia.desktop $pkgdir/usr/share/applications/linthesia.desktop 
    # Install pixmap
    mkdir "$pkgdir/usr/share/pixmaps"
    install -Tm644 extra/linthesia.xpm $pkgdir/usr/share/pixmaps/linthesia.xpm
    # Install docs
    mkdir "$pkgdir/usr/share/doc"
    mkdir "$pkgdir/usr/share/doc/linthesia"
    install -Tm644 README $pkgdir/usr/share/doc/linthesia/README
    install -Tm644 COPYING $pkgdir/usr/share/doc/linthesia/COPYING
}
