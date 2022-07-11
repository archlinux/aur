# Maintainer: Isho Antar <0xisho@proton.me>

pkgname=mueller-dict
pkgver=3.1.1
pkgrel=1
pkgdesc="English -> Russian dictionary for dictd et al."
arch=('any')
url="http://mueller-dict.sourceforge.net"
license=('GPL2')
optdepends=('dictd: dict client and server')
# install="$pkgname.install"
source=(
    "http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
    "mueller-dict-"{install,remove}{,.hook}
)
sha1sums=(
    '6aebd3fdbe8f921e0011630d35137caf523fd40a'
    'e4464f3d3d39f50dda1320b61dabf3b175383dda' # install
    '11df4a93d604553edb1136317391af519ef8837c' # install hook
    '742adff8597df5372ca130ad6665841f94fb97a7' # remove
    '10a018ad44990a5ca7fd4fb56ec639866d248d23' # remove hook
)

prepare()
{
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
}


build()
{
    make -C "$pkgname-$pkgver"
}


package()
{
    DESTDIR="$pkgdir" make -C "$pkgname-$pkgver" install
    mv "$pkgdir/usr/share/dict"{,d}

    install -m 0644 -Dt "$pkgdir/usr/share/doc/$pkgname/" \
        "$pkgname-$pkgver/"{AUTHORS,ChangeLog,INSTALL,NEWS,README,README.koi8r}

    install -m 0644 -Dt "$pkgdir/usr/share/libalpm/hooks" \
        "mueller-dict-"{install,remove}.hook
    install -m 0755 -Dt "$pkgdir/usr/share/libalpm/scripts" \
        "mueller-dict-"{install,remove}
}
