pkgname=lpcscrypt
pkgver=2.1.1.15
pkgrel=0
pkgdesc="Programming tool for LPC1800 and LPC4000 series microcontrollers"
arch=('x86_64')
url="https://www.nxp.com/design/microcontrollers-developer-resources/lpc-microcontroller-utilities/lpcscrypt-v2-1-1:LPCSCRYPT"
license=('proprietary')
makedepends=(libarchive unmakeself)
depends=(dfu-util libutil-linux)
optdepends=(bash)

_pkgver_main=${pkgver%.*}
_pkgver_rel=${pkgver##*.}
_pkgver_u=${_pkgver_main}_${_pkgver_rel}
_src="$pkgname-$_pkgver_u.x86_64.deb.bin"
source=("https://www.nxp.com/downloads/en/software/$_src")
sha384sums=('990a784e98b0cd00f9b1e308a3a4caab0458a0fb8d72214448a28a74e97966291176a3f579d173001e383aa21728e4b6')

prepare() {
    mkdir -p $pkgname-$_pkgver_u
    cd $pkgname-$_pkgver_u
    unmakeself ../$_src
    bsdtar xf "$pkgname-$_pkgver_u.x86_64.deb"
    tar xf data.tar.gz
}

package() {
    cd "$srcdir/$pkgname-$_pkgver_u"

    install -D -v -m644 ProductLicense.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    
    _s="usr/local/$pkgname-$_pkgver_u"

    _o="$pkgdir/opt/$pkgname"
    mkdir -p "$_o"
    cp -r "$_s/"* "$_o"

    install -D -v -m644 "$_s/scripts/99-lpcscrypt.rules" -t "$pkgdir/usr/lib/udev/rules.d"
    rm -f "$_o/scripts/99-lpcscrypt.rules"
    rm -f "$_o/scripts/install_udev_rules"
}
