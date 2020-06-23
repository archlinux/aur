# Maintainer: masuke5 <s dot zerogoichi at gmail dot com>

pkgname=brother-dcpj968n
pkgver=1.0.0_0
pkgrel=1
pkgdesc="Driver for the Brother DCP-J968N wifi multifuncional printer"
arch=('i686' 'x86_64')
url="https://support.brother.co.jp/j/b/producttop.aspx?c=jp&lang=ja&prod=dcpj968n"
license=('GPL2' 'custom:brother')
depends=('a2ps' 'cups' 'lib32-glibc')
install="brother-dcpj968n.install"
source=(
    "https://download.brother.com/welcome/dlf102835/dcpj968nlpr-${pkgver/_/-}.i386.rpm"
    "https://download.brother.com/welcome/dlf102843/dcpj968ncupswrapper-${pkgver/_/-}.i386.rpm"
    'eula.txt'
    'fix_lp.patch'
)
md5sums=(
    'a7fbbaa67ccbaa17a81f2f6db0be660e'
    '545e8cdcd598cd2d21e3c3e1dd990033'
    '8f3fd8004f2345afe1e009bfb9d36f00'
    '0eeafd97723bd243e0c8bdc0e49f7dc9'
)

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

post_install() {
    /opt/brother/Printers/dcpj968n/cupswrapper/cupswrapperdcpj968n
}

package() {
    # Licenses
    install -Dm644 ${srcdir}/eula.txt ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
	ln -s /usr/share/licenses/GPL2/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/cupswrapper-license.txt

    install -d $pkgdir/usr/bin
    install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj968n "$pkgdir"/usr/bin/
    cp -R $srcdir/opt $pkgdir/opt
}
