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
        https://developers.hp.com/system/files/2025-03/hplip-$pkgver-plugin_run.zip
        hplip-missing-drivers.patch
        hplip-pserror-c99.patch)
sha256sums=('cd214123a3560fa9fe745cf7ca504e7dc713f4beca8fd64718ef31a4650777c0'
            'SKIP'
            '0690b5ce0baa39cf3ac1be22e10292082fc2010f36c8c62d77245aadb4a5bd3f'
            'a8ba5021c68816b63654e328c2872cedf49fa9f8769631cfcb96c667055c7313'
            '33380f46f9e44cce1b6c5fcc10917cc363654ac157dca3cccf620d05ce7e3f19')
validpgpkeys=('4ABA2F66DBD5A95894910E0673D770CDA59047B9') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>
options=(!makeflags)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla/5.0' -o %o %u")

prepare() {
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
