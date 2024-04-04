# Maintainer: Jonathon Fernyhough <jonathon "m2x +dotdev>
# Contributor: Angel Velasquez <angvp@archlinux.org>

pkgname=python2-notify
pkgver=0.1.1
pkgrel=14
pkgdesc="Python bindings for libnotify"
arch=('i686' 'x86_64')
url="http://www.galago-project.org/"
license=('GPL')
depends=('pygtk>=2.22.0' 'libnotify>=0.7.1')
makedepends=('python2')
conflicts=('python-notify<=0.1.1-11')
replaces=('python-notify<=0.1.1-11')
source=(https://galago-project.org/files/releases/source/notify-python/notify-python-${pkgver}.tar.gz
        libnotify07.patch
        notify-python-0.1.1-fix-GTK-symbols.patch)
sha512sums=('f900d58e4004d199f718e458ebaa9b654c0040b848312f6fe5a885afbdf67c771fd3360b4cbf121b66404d750a7cce24f776c360568eadcefc9733e7f501cccf'
            'd8c9a829d9255c0e971f00f7ef0f337207f94cd89f67bc657f0bcc2dc18a50b138924e2f9ef878daad2372256f7656064071f7a7324292700044c93e990f17fc'
            'a5f9f04b080425114950aaa7fc2e68ff3e32d092cd0f7a9ef212a37d8056e4a2d438d075921e66be541bbdcadb4602c14e5bb7443e7455dc7ebc923c4dbd0961')

prepare() {
    cd notify-python-$pkgver

    patch -Np1 -i ../libnotify07.patch
    patch -Np1 -i ../notify-python-0.1.1-fix-GTK-symbols.patch

    ./configure --prefix=/usr

    # WARNING - we touch src/pynotify.override in build because upstream did not rebuild pynotify.c
    # from the input definitions, this forces pynotify.c to be regenerated, at some point this can be removed
    touch src/pynotify.override
}

build() {
    cd notify-python-$pkgver
    make clean
    make CFLAGS+=" -fcommon"
}

package() {
    cd notify-python-$pkgver
    make DESTDIR="$pkgdir" install
}
