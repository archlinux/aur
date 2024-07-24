# Contributor: Antonis G. <capoiosct at gmail dot com>

_pkgname='xpad'
pkgname='xpad-dkms-git'
pkgver=0.4.93.3a21582
pkgrel=1
pkgdesc="Driver for the Xbox/ Xbox 360/ Xbox 360 Wireless/ Xbox One Controllers"
arch=('i686' 'x86_64')
url="https://github.com/paroj/xpad"
license=('GPL2')
install="${pkgname}.install"
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgname}-dkms")
source=("${pkgname}::git+https://github.com/paroj/xpad.git"
        "xpad.conf"
        "${pkgname}.install")
md5sums=('SKIP'
         '4218c9543d551377825392295544c3c2'
         '75cad51dc48d8fa879f926432beabf66')
pkgver() {
  cd "$pkgname"
  printf "0.4.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
package() {
    # install depmod config file so our driver gets higher priority than the intree module
    install -dm 755 "$pkgdir/etc/depmod.d"
    install -m 644 "$srcdir/xpad.conf" "$pkgdir/etc/depmod.d"

    cd "$srcdir/$pkgname"
    install -dm 755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -m 644 -T xpad.c "${pkgdir}/usr/src/${_pkgname}-${pkgver}/xpad.c"
    install -m 644 -T Makefile "${pkgdir}/usr/src/${_pkgname}-${pkgver}/Makefile"
    install -m 644 -T dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
}
