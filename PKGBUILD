# Maintainer: David Adler <d.adler@posteo.de>

pkgname=jack-smf-utils
pkgver=1.0
pkgrel=6
pkgdesc="JACK MIDI smf player and recorder with JACK Transport sync"
arch=('x86_64')
url="http://jack-smf-utils.sourceforge.net"
license=('custom')
depends=('jack' 'libsmf')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz $pkgname.patch)
md5sums=('80234923dd5a14bdbd8ef567347d9df8'
         'a67d49e0427291cd37a2e3b3d250e966')

prepare() {
    cd $pkgname-$pkgver

    # two changes:
    #
    #   use /usr/bin/smfsh from package libsmf instead of the one
    #   shipped with this package to avoid file conflict
    #
    #   call g_warning with format string to avoid error due to
    #   -Werror=format-security

    patch -p1 -i ../$pkgname.patch
}

build() {
    cd $pkgname-$pkgver
    autoreconf --install
    automake --add-missing
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    install -t "${pkgdir}/usr/share/licenses/$pkgname/" \
        -vDm 644 COPYING
}

