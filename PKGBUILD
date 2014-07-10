# Contributor: Mark Grimes <mark_aur@peculier.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: macxcool

pkgname=stopmotion
_realname=linuxstopmotion
pkgver=0.8.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Stop motion animation creation program"
url="http://linuxstopmotion.org/index.html"
license=('GPL')
makedepends=('pkgconfig')
depends=('qt4' 'sdl_image' 'libxml2' 'libvorbis')
# 'inotify-tools'
makedepends=('git' 'libtar')
conflicts=('linuxstopmotion-git')
source=($_realname::git+http://git.code.sf.net/p/$_realname/code#tag=$pkgver)
#         add-unistd.patch)
md5sums=('SKIP')

build() {
    cd "$srcdir/$_realname"
    lrelease-qt4 stopmotion.pro
    qmake-qt4 PREFIX=/usr stopmotion.pro
    sed -i '/^LIBS/s|$| -lX11|' Makefile
    make
}

package() {
    cd "$srcdir/$_realname"
    sed -e 's/install_desktop install_dummy/install_desktop/' -i Makefile.Release
    make INSTALL_ROOT="$pkgdir" install
    install -D -m644 stopmotion.desktop "$pkgdir"/usr/share/applications/stopmotion.desktop
    install -D -m644 graphics/stopmotion.png "$pkgdir"/usr/share/pixmaps/stopmotion.png
    install -D -m644 stopmotion.mime "$pkgdir"/usr/share/mime-info/stopmotion.mime
    install -D -m644 stopmotion.1 "$pkgdir"/usr/share/man/man1/stopmotion.1
    gzip "$pkgdir"/usr/share/man/man1/stopmotion.1
}

