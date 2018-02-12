# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=nano-git
pkgver=20180208
pkgrel=1
pkgdesc="Pico editor clone with enhancements, git version"
arch=(i686 x86_64)
license=('GPL')
url="http://www.nano-editor.org"
depends=('glibc' 'ncurses')
makedepends=('texinfo' 'subversion')
source=(git://git.savannah.gnu.org/nano.git)
backup=('etc/nanorc')
provides=('nano')
conflicts=('nano')
replaces=('nano-svn')
md5sums=('SKIP')

pkgver() {
    # Identify latest version.
    cd "$srcdir/nano"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
    # Running the configure script.
    cd $srcdir/nano
    ./autogen.sh

    ./configure                     \
        --prefix=/usr               \
	--sysconfdir=/etc           \
	--enable-color              \
	--enable-nanorc             \
	--enable-multibuffer        \
	--bindir=/usr/bin           \
	--sbindir=/usr/bin          \
	--disable-wrapping-as-root
}

build() {
    cd $srcdir/nano
    make
}

package(){
    # Removing unwanted source dir.
    rm -r $startdir/nano

    # Moving everything to pkg/.
    cd $srcdir/nano
    make DESTDIR=$pkgdir sbindir=/usr/bin install
    install -DTm644 $srcdir/nano/doc/nanorc.sample $pkgdir/etc/nanorc
}
