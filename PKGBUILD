# Maintainer: Markus Tacker <m@coderbyheart.de>
# Based on the QL-700 PKGBUILD -> Jacob Alexander <triplehaata@gmail.com>
pkgname=brother-ql720nw-cupswrapper
_pkgname=ql720nwcupswrapper
pkgver=1.0.2
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother P-Touch QL-720nw labelprinter (metric)"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("GPL2")
if [ "$CARCH" = "x86_64" ]; then
  depends=('cups' 'ghostscript' 'lib32-glibc' 'brother-ql720nw-lpr')
else
  depends=('cups' 'ghostscript' 'glibc' 'brother-ql720nw-lpr')
fi
makedepends=('rpmextract' 'cpio')
source=("http://download.brother.com/welcome/dlfp002205/$_pkgname-$pkgver-0.i386.rpm")
sha256sums=('c5fc46d1b70cf627f079cba109cccae8ddec3b7bbf49144d7f0566cb7fb5ac73')
noextract=("$_pkgname-$pkgver-0.i386.rpm")
install='cupswrapper.install'

build() {
        cd $srcdir
        rpmextract.sh "$_pkgname-$pkgver-0.i386.rpm"

        rm -f $_pkgname-$pkgver-0.i386.rpm

        mkdir -p usr/share/ || return 1
        mv opt/brother/PTouch/ql720nw usr/share/brother || return 1
        rmdir opt/brother/PTouch || return 1

        sed -i 's|/opt/brother/PTouch/ql720nw|/usr/share/brother|g' `grep -lr ./` || return 1
}

package() {
	mv usr $pkgdir/. || return 1
}

