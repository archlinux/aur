# Maintainer: mmxgn <eruyome@gmail.com>
# Based on dosbox-svn AUR PKGBUILD from: https://aur.archlinux.org/packages/dosbox-svn/
# Includes patches from: James Kelly Jr, James-F (https://sourceforge.net/p/dosbox/patches/238/)

pkgname=dosbox-svn-ne2000
pkgver=0.74.2.4335M
pkgrel=1
epoch=1
pkgdesc="An emulator with builtin DOS for running DOS Games - Includes patches for NE2000 network card"
arch=('i686' 'x86_64')
url='http://dosbox.sourceforge.net/'
license=('GPL2')
depends=('alsa-lib' 'hicolor-icon-theme' 'libgl' 'libpng' 'libpcap' 'mesa' 'sdl_net' 'sdl_sound')
makedepends=('subversion' 'desktop-file-utils')
provides=('dosbox')
conflicts=('dosbox')
source=($pkgname::svn+https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk
    $pkgname.desktop
    dosbox-16.png
    dosbox-48.png
    dosbox-128.png
    ne2000.patch
)

prepare(){
    cd $pkgname
    #patch -N --forward --strip=1 --silent < ../ne2000.patch
    patch -Np1 -i ../ne2000.patch
}

pkgver(){
    echo $(cat $pkgname/VERSION).$(svnversion $pkgname) | sed 's/-/./'
}

build() {
    cd $pkgname
    sh autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc/dosbox
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install

    # Fix invalid permissions FS#10732
    chmod 755 "$pkgdir"/usr/share/man/man1

    for i in 16 48 128; do
	install -Dm644 dosbox-$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x$i/apps/dosbox.png
    done
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    echo ""
    echo ""
    echo "Please make sure to edit ~/.dosbox/dosbox-SVN.conf and set the desired"
    echo "interface to use. Note: you have to have permissions to capture from it"
    echo "see e.g.:"
    echo "	https://askubuntu.com/questions/530920/tcpdump-permissions-problem#632189"
    echo ""
    echo ""
}

sha256sums=('SKIP'
            '7c8db8a5a475f54283748b539b50fa49b59a87c5ff80e94e82520530b996f871'
            'e657254e56dd7d66cb1cefbf37f0f360e13a221bc60b1638c00dcda508f7fd56'
            'e71a3984170b3bf7af7d9cfbec0752187d70be76602721a1227b60980d7c380a'
            '228593e97732eaa31e0202b7d46da9d7529672369c17312db3f97784601b5d81'
            '839e20fab07cc29bb80e34fce2199dea91eacd090c6bce89c4d276564ac519cb')
