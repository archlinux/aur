# Maintainer: Peter Lamby <peterlamby at web.de>
# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname="murmur-static"
pkgver=1.3.3
pkgrel=1
pkgdesc="The voice chat application server for Mumble (static version)"
arch=("i686" "x86_64")
url="https://www.mumble.info/"
license=("GPL")
depends=(lsb-release)
optdepends=("zeroc-ice: remote scripting support")
provides=(murmur)
conflicts=(murmur murmur-git murmur-ice)
options=("!strip")
backup=("etc/murmur.ini")
install="murmur.install"
source=(https://dl.mumble.info/stable/murmur-static_x86-${pkgver}.tar.bz2{,.sig}
        "murmur.service"
        "murmur.sysusers"
        "murmurd.1")
sha512sums=('e9ce005f925376bd702959adaad025b04b31ed071d67c268e2233122ed6dfe2aa432c047ad8725cbfa7582a3c0d243205ecedddcf7044a15b3f4d556f2ce8e82'
            'SKIP'
            'fc230c3d7119afed34485eeb84fd935968dc69e4a00cbdbebc3a4f4d4ce155613b4581e43c07208d513a6ba4d240ba84058a85f04b2188bfa406f70256f13f65'
            '5af28d0c2b2b072cfbd500b5f63549e88a86cf3fc15e4d2df89e787c4d2bafdecbe078a518e0d1b25d82f9873cb06838ec1c9ebed625ffb7e8c80fcd942ebf74'
            '98bcb96e98b3cdbd07be20774978bd309e7cbc3279e0bbf5682794689d7ad5aeb09bb332540c965f5d93be61bdbd9e23fd9074d9b1a4ff2d55c6176365f69142')
validpgpkeys=('76B50270322F0E3D78DCE8298AA328A315175AE3') # Mumble Automatic Build Infrastructure 2020 <mumble-auto-build-2020@mumble.info>

package() {
    cd "${pkgname}_x86-${pkgver}"

    sed -e "1i; vi:ft=cfg" \
        -e "s|database=|database=/var/db/murmur/murmur.sqlite|" \
        -e "s|^ice=|;ice=|" \
        -e "s|;logfile=murmur.log|logfile=|" \
        -e "s|;uname=|uname=murmur|" \
        -i murmur.ini

    install -dm755 "$pkgdir"/var/db/murmur
    install -dm755 "$pkgdir"/var/lib             # compatibility with
    ln -s ../db/murmur "$pkgdir"/var/lib/murmur  # murmur-static <= 1.3.0rc1-2
    install -Dm755 murmur.x86 "$pkgdir"/usr/bin/murmurd
    install -Dm644 murmur.ini "$pkgdir"/etc/murmur.ini
    install -Dm644 README "$pkgdir"/usr/share/doc/murmur/README
    install -Dm644 "$srcdir"/murmurd.1 "$pkgdir"/usr/share/man/man1/murmurd.1
    install -Dm644 "$srcdir"/murmur.service "$pkgdir"/usr/lib/systemd/system/murmur.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 "$srcdir"/murmur.sysusers "$pkgdir"/usr/lib/sysusers.d/murmur.conf
    install -Dm644 ice/Murmur.ice "$pkgdir"/usr/share/murmur/Murmur.ice
}
