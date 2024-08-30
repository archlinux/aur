# Maintainer: Ayushmaan Padhi
# Contributor: Sergey Kolesov <cucullus at mail dot ru>
# Contributor: Chris Severance <aur.severach aATt spamgourmet dott com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname='hplip-minimal'
pkgver=3.24.4
pkgrel=3
pkgdesc='Only printer drivers from HPLIP with proprietary binary plugin'
arch=('x86_64')
url='https://developers.hp.com/hp-linux-imaging-and-printing/'
license=('GPL-2.0-only' 'MIT' 'BSD-3-Clause' 'GPL-3.0-or-later' 'LicenseRef-HPLIP')
depends=(libjpeg-turbo libcups)
makedepends=(python libusb)
conflicts=('hplip' 'hplip-lite' 'hplip-plugin')
provides=('hplip')
backup=('etc/hp/hplip.conf')
optdepends=('cups: for printing support')
source=("https://downloads.sourceforge.net/hplip/hplip-${pkgver}.tar.gz"
        "https://downloads.sourceforge.net/hplip/hplip-${pkgver}.tar.gz.asc"
        "https://developers.hp.com/sites/default/files/hplip-${pkgver}-plugin.run"
        "https://developers.hp.com/sites/default/files/hplip-${pkgver}-plugin.run.asc)
sha256sums=('5d7643831893a5e2addf9d42d581a5dbfe5aaf023626886b8762c5645da0f1fb'
            'SKIP'
            '1f3c6bdd25661a8a2e18153655d6f06f028c1d9c308d69c8ecfd7767a2d0c5aa'
            'SKIP')
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>
options=(!makeflags)

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
  make
}

package() {
 cd "hplip-$pkgver"
 make DESTDIR="$pkgdir/" install
 libtool --finish /usr/lib
 install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
 cd ..
 cd "hplip-$pkgver-plugin"
 install -Dt "$pkgdir/usr/share/hplip" -m644 plugin.spec
 install -Dt "$pkgdir/usr/share/hplip/data/firmware" -m644 hp_laserjet_*.fw.gz
 install -Dt "$pkgdir/usr/share/hplip/prnt/plugins" -m644 hbpl1-x86_64.so
 install -Dt "$pkgdir/usr/share/hplip/prnt/plugins" -m644 lj-x86_64.so
 install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 license.txt

 cat << EOF > hplip.state
[plugin]
installed = 1
eula = 1
version = $pkgver
EOF
 install -Dm644 -t "$pkgdir/var/lib/hp" hplip.state

 find "$pkgdir/usr/share/hplip" -type f -name "*.so" | while read -r f; do
   lib_dir="${f%/*}"
   lib_name="${f##*/}"
   ln -vsf "$lib_name" "$lib_dir/${lib_name%%-*}.so"
 done
}