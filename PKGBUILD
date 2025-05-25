# Maintainer: Ayushmaan Padhi
# Contributor: Sergey Kolesov <cucullus at mail dot ru>
# Contributor: Chris Severance <aur.severach aATt spamgourmet dott com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname='hplip-minimal'
pkgver=3.25.2
pkgrel=1
pkgdesc='Only printer drivers from HPLIP with proprietary binary plugin'
arch=('x86_64')
url='https://developers.hp.com/hp-linux-imaging-and-printing/'
license=('GPL-2.0-only' 'MIT' 'BSD-3-Clause' 'GPL-3.0-only' 'LicenseRef-HPLIP')
depends=(libcups)
makedepends=(python libusb cups)
conflicts=('hplip' 'hplip-lite' 'hplip-plugin')
provides=('hplip')
backup=('etc/hp/hplip.conf' 'var/lib/hp/hplip.state')
optdepends=('cups: for printing support')
source=(https://downloads.sourceforge.net/hplip/hplip-$pkgver.tar.gz{,.asc}
        hplip-missing-drivers.patch
        hplip-pserror-c99.patch)
sha256sums=('e872ff28eb2517705a95f6e1839efa1e50a77a33aae8905278df2bd820919653'
            'SKIP'
            '46fcf6398ee16d41f4976c4c4e1e1e483b30fe64bcabd8864077d3f2602c2ece'
            '02d5fd1a23f13f9879977c34d1c83364402995ef81c8ed04bca2dea5cb6e58cd')
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>
options=(!makeflags)

prepare() {
  curl -A "Mozilla/5.0 (Linux x86_64) Gecko/20100101" -O "https://developers.hp.com/system/files/2025-03/hplip-$pkgver-plugin_run.zip"
  bsdtar -xvf "hplip-$pkgver-plugin_run.zip"
  sh "hplip-$pkgver-plugin.run" --target "$srcdir/hplip-$pkgver-plugin" --noexec
 
  cd "hplip-$pkgver"

  patch -Np1 -i ../hplip-missing-drivers.patch
  patch -Np1 -i ../hplip-pserror-c99.patch

  export AUTOMAKE='automake --foreign'
  autoreconf --force --install
}

build() {
  cd "hplip-$pkgver"
  ./configure -q --prefix=/usr \
                 --enable-lite-build \
                 --disable-imageProcessor-build \
                 --disable-network-build \
                 --disable-scan-build \
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
