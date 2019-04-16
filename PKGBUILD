# Maintainer: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
pkgname=brp-pacu
_upstreamname=BRP_PACU
pkgver=2.1.1
pkgrel=3
pkgdesc="A cross platform dual channel FFT based Acoustic Analysis Tool to help engineers analyze live professional sound systems using the transfer function. One feature is the ability to capture four sample plots, average them, and invert to aid in final EQ."
url='http://sourceforge.net/projects/brp-pacu/'
arch=('i686' 'x86_64')
license=('gpl')
depends=('gtk2' 'gtkdatabox' 'jack' 'fftw2')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname-v2-any/$pkgver/$_upstreamname-$pkgver.tar.gz/download"
        "$_upstreamname.desktop"
        "start-$pkgname.sh"
        "$pkgname.patch")
sha256sums=('ae1ce474791ff1210fa79e175d02d81403cabc6a8b897053ec76e2b8f73a4990'
            '62e0af1bc76691a6bc056e74126dce10b8342e633bbfb2d91d19e5ec9c7bf760'
            'ac0fc68d39f887dd276fac2ad57a334f604a3106b03b675926037dbc6b13e38e'
            '03ebb27c8823c44a36680f1cdcdfcb8841f2a74423fea8f15d86889adabb7f70')

build() {
    cd $srcdir/$_upstreamname-$pkgver
    patch -p1 -i ../$pkgname.patch
    ./configure --prefix=/usr
    make
}

package() {
    cd $srcdir/$_upstreamname-$pkgver
    make DESTDIR="$pkgdir" install
    cd $srcdir
    install -d $pkgdir/usr/share/applications
    mv $pkgdir/usr/bin/$_upstreamname $pkgdir/usr/share/$_upstreamname/
    install -m755 -t $pkgdir/usr/share/$_upstreamname/ start-brp-pacu.sh
    ln -sf /usr/share/$_upstreamname/start-brp-pacu.sh $pkgdir/usr/bin/$_upstreamname
    install -m644 -t $pkgdir/usr/share/applications/ $_upstreamname.desktop
}
