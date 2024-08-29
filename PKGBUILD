# Maintainer: Ayushmaan Padhi
# Contributor: Sergey Kolesov <cucullus at mail dot ru>
# Contributor: Chris Severance <aur.severach aATt spamgourmet dott com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on hplip from [extra]

pkgname='hplip-minimal'
pkgver=3.24.4
pkgrel=1
pkgdesc='Only printer drivers from HPLIP with proprietary binary plugin'
arch=('x86_64')
url='https://developers.hp.com/hp-linux-imaging-and-printing/'
license=('GPL-2' 'MIT' 'BSD' 'GPL-3' 'custom:HPLIP')
depends=(libjpeg-turbo libcups)
makedepends=(python libusb)
conflicts=('hplip')
provides=('hplip')
backup=('etc/hp/hplip.conf')
optdepends=('cups: for printing support')
source=("https://downloads.sourceforge.net/hplip/hplip-${pkgver}.tar.gz"
        "https://developers.hp.com/sites/default/files/hplip-${pkgver}-plugin.run")
sha256sums=('5d7643831893a5e2addf9d42d581a5dbfe5aaf023626886b8762c5645da0f1fb'
            '1f3c6bdd25661a8a2e18153655d6f06f028c1d9c308d69c8ecfd7767a2d0c5aa')
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>

prepare() {
 sh "hplip-$pkgver-plugin.run" --target "$srcdir/hplip-$pkgver-plugin" --noexec
 cd "hplip-$pkgver"
 sed -i 's/static column/static int column/' prnt/hpps/pserror.c
}

build() {
 cd "hplip-$pkgver"
 ./configure -q --prefix=/usr \
        --enable-lite-build \
        --disable-scan-build \
        --disable-network-build \
        --disable-imageProcessor-build \
        --disable-gui-build \
        --disable-fax-build \
        --disable-doc-build
  make -j $(($(nproc) - 1))
}

package() {
 cd "hplip-$pkgver"
 make DESTDIR="$pkgdir/" install
 libtool --finish /usr/lib
 install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
 cd ..
 cd "hplip-$pkgver-plugin"
 install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 license.txt
}
