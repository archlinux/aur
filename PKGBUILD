# Maintainer: Peter Lamby <peterlamby at web.de>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname="murmur-static"
pkgver=1.3.0rc1
_pkgver=1.3.0-rc1
pkgrel=2
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
sha512sums=('07e52e8d47384dbd6222434eece10f96b17f01f15af2ac95cd249373c3c968df21e985b0309060397152b3a9112dd08c4b100cce2cdc6eaf78e0d5dc3684a20e'
            'fc230c3d7119afed34485eeb84fd935968dc69e4a00cbdbebc3a4f4d4ce155613b4581e43c07208d513a6ba4d240ba84058a85f04b2188bfa406f70256f13f65'
            'e41ed656cc7c1d60e77a108631adaab1f623d12883990731ac80b5c2a780ba17641859d12cfd7d708aa5a69965d0f82011db83f6b1bbf7f18a48483669f2a090'
            '98bcb96e98b3cdbd07be20774978bd309e7cbc3279e0bbf5682794689d7ad5aeb09bb332540c965f5d93be61bdbd9e23fd9074d9b1a4ff2d55c6176365f69142')

package() {
	cd "${srcdir}/${pkgname}_x86-${_pkgver}"

	sed -e "s|database=|database=/var/lib/murmur/murmur.sqlite|" \
	    -e "s|dbus=session|#dbus=session|" \
	    -e "s|#logfile=murmur.log|logfile=|" \
	    -e "s|#uname=|uname=murmur|" \
	    -i murmur.ini

	install -dm755 ${pkgdir}/var/lib/murmur
	install -Dm755 murmur.x86 ${pkgdir}/usr/bin/murmurd
	install -Dm644 murmur.ini ${pkgdir}/etc/murmur.ini
	install -Dm644 README ${pkgdir}/usr/share/doc/murmur/README
	install -Dm644 ${srcdir}/murmurd.1 ${pkgdir}/usr/share/man/man1/murmurd.1
	install -Dm644 ${srcdir}/murmur.service ${pkgdir}/usr/lib/systemd/system/murmur.service
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
        install -Dm644 "${srcdir}"/murmur.sysusers "${pkgdir}"/usr/lib/sysusers.d/murmur.conf
        install -Dm644 ice/Murmur.ice ${pkgdir}/usr/share/murmur/Murmur.ice
}
