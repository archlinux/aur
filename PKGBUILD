# Maintainer: Mohd Shahril Zainol Abidin <mohd_shahril_96@yahoo.com>

pkgname=brother-dcpt510w
pkgver=1.0.1
pkgrel=0
pkgdesc="Driver for the Brother DCP-T510W wifi multifuncional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother')
install="brother-dcpt510w.install"
arch=('i686' 'x86_64')
optdepends=('sane: scanning support'
            'brscan4: making dcpt510w available to sane'
            'brscan-skey: scankey support if connected via usb')

if [[ "$CARCH" == "x86_64" ]] ; then
    depends=('a2ps' 'cups' 'lib32-glibc')
elif [[ "$CARCH" == "i686" ]] ; then
    depends=('a2ps' 'cups')
fi

source=(
    "http://download.brother.com/welcome/dlf103621/dcpt510wpdrv-$pkgver-$pkgrel.i386.rpm" \
    "fix_lp.patch"
)
sha256sums=(
    '8072709a7ff3845fd96b8c6b70b13c3af996a905422af1b80c5b991cf1fc38cb'
    '288d5b0cf42d6db004d612bfb7162021df8e62cf6a32a9b0daedc1118556c92f'
)

build() {
  cd "$srcdir"
	patch -Np0 < fix_lp.patch
}

post_install() {
	/opt/brother/Printers/dcpt510w/cupswrapper/cupswrapperdcpt510w
}

package()
{
    install -d $pkgdir/usr/bin
	install -d $pkgdir/var/spool/lpd
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpt510w "$pkgdir"/usr/bin/
	cp -R $srcdir/opt $pkgdir/opt
}
