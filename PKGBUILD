# Maintainer: Peter Lamby <peterlamby at web.de>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname="murmur-static"
pkgver=1.3.0rc2
_pkgver=1.3.0-rc2
pkgrel=1
pkgdesc="The voice chat application server for Mumble (static version)"
arch=("i686" "x86_64")
url="http://www.mumble.info/"
license=("GPL")
optdepends=("zeroc-ice: remote scripting support")
conflicts=("murmur" "murmur-git" "murmur-ice")
options=("!strip")
backup=("etc/murmur.ini")
install="murmur.install"
source=("http://mumble.info/snapshot/murmur-static_x86-${_pkgver}.tar.bz2"
        "murmur.service"
        "murmur.sysusers"
        "murmurd.1")
sha512sums=('5fc9b959631f812629d5ba8307050f7e5f2346358d11761d87c4e60bab90dc58ce9ce0a8e15b2b66f2ba53027fedc710c3b71329189b8a1a672481249e23c706'
            'fc230c3d7119afed34485eeb84fd935968dc69e4a00cbdbebc3a4f4d4ce155613b4581e43c07208d513a6ba4d240ba84058a85f04b2188bfa406f70256f13f65'
            '5af28d0c2b2b072cfbd500b5f63549e88a86cf3fc15e4d2df89e787c4d2bafdecbe078a518e0d1b25d82f9873cb06838ec1c9ebed625ffb7e8c80fcd942ebf74'
            '98bcb96e98b3cdbd07be20774978bd309e7cbc3279e0bbf5682794689d7ad5aeb09bb332540c965f5d93be61bdbd9e23fd9074d9b1a4ff2d55c6176365f69142')

package() {
	cd "${srcdir}/${pkgname}_x86-${_pkgver}"

        sed -e "1i; vi:ft=cfg" \
            -e "s|database=|database=/var/db/murmur/murmur.sqlite|" \
            -e "s|^ice=|;ice=|" \
            -e "s|;logfile=murmur.log|logfile=|" \
            -e "s|;uname=|uname=murmur|" \
            -i murmur.ini

        install -dm755 ${pkgdir}/var/db/murmur
        install -dm755 ${pkgdir}/var/lib             # compatibility with
        ln -s ../db/murmur ${pkgdir}/var/lib/murmur  # murmur-static <= 1.3.0rc1-2
	install -Dm755 murmur.x86 ${pkgdir}/usr/bin/murmurd
	install -Dm644 murmur.ini ${pkgdir}/etc/murmur.ini
	install -Dm644 README ${pkgdir}/usr/share/doc/murmur/README
	install -Dm644 ${srcdir}/murmurd.1 ${pkgdir}/usr/share/man/man1/murmurd.1
	install -Dm644 ${srcdir}/murmur.service ${pkgdir}/usr/lib/systemd/system/murmur.service
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
        install -Dm644 "${srcdir}"/murmur.sysusers "${pkgdir}"/usr/lib/sysusers.d/murmur.conf
        install -Dm644 ice/Murmur.ice ${pkgdir}/usr/share/murmur/Murmur.ice
}
