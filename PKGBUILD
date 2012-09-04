# Contributor: Mark Grimes <mark_aur@peculier.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=stopmotion
pkgver=0.6.2
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Stop motion animation creation program"
url="http://stopmotion.bjoernen.com"
license=('GPL')
makedepends=('pkgconfig')
depends=('qt' 'sdl_image' 'libxml2' 'libvorbis' 'inotify-tools')
source=(http://developer.skolelinux.no/info/studentgrupper/2005-hig-stopmotion/project_management/webpage/releases/$pkgname-$pkgver.tar.gz
        add-x11-lib.patch add-unistd.patch)
md5sums=('a139f036286f31bba21effb2b6553d1e' 'e8943488fec6994aee11ac9f25d04d45'
         '87bbc308a7c3146560fd3cf1dc7ceb78' )

_qt4profile=/etc/profile.d/qt4.sh

build() {
    [ -e $_qt4profile ] && . $_qt4profile
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 < "${srcdir}/add-x11-lib.patch"
    patch -p1 < "${srcdir}/add-unistd.patch"

    ./configure --prefix=/usr --with-html-dir=/usr/share/$pkgname/html
    make -j1
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make prefix=$startdir/pkg install

    # Makefile doesn't seem to install the man file
    gzip ${pkgname}.1
    mkdir -p $startdir/pkg/usr/share/man/man1
    install -m 644 -p ${pkgname}.1.gz $startdir/pkg/usr/share/man/man1
}

