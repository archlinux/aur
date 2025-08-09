# Maintainer: Ayushmaan Padhi

pkgname='hplip-minimal'
pkgver=3.25.6
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
source=(https://downloads.sourceforge.net/hplip/hplip-$pkgver.tar.gz
		    hplip-pserror-c99.patch
        hplip-missing-drivers.patch)    
sha256sums=('SKIP'
			      'SKIP'
            'SKIP')
options=(!makeflags)

prepare() {
  curl -A "Mozilla/0.0 (Linux x86_64) Chromium/0.0.0.0" -O https://developers.hp.com/sites/default/files/2025-08/hplip-$pkgver-plugin.run
  sh "hplip-$pkgver-plugin.run" --target "$srcdir/hplip-$pkgver" --noexec
  
  cd "hplip-$pkgver"
  patch -Np1 -i ../hplip-pserror-c99.patch
  patch -Np1 -i ../hplip-missing-drivers.patch
  export AUTOMAKE='automake --foreign'
  autoreconf --force --install
}

build() {
  cd "$srcdir/hplip-$pkgver"
  ./configure -q --prefix=/usr \
                 --enable-lite-build \
                 --disable-network-build \
                 --disable-scan-build \
                 --disable-doc-build
  make
}

package() {
  cd "hplip-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
  install -Dt "$pkgdir/usr/share/hplip" -m644 plugin.spec
  install -Dt "$pkgdir/usr/share/hplip/data/firmware" -m644 hp_laserjet_*.fw.gz
  install -Dt "$pkgdir/usr/share/hplip/prnt/plugins" -m644 hbpl1-x86_64.so
  install -Dt "$pkgdir/usr/share/hplip/prnt/plugins" -m644 lj-x86_64.so
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 license.txt

  echo -e "[plugin]\ninstalled = 1\neula = 1\nversion = $pkgver" | tee hplip.state
  install -Dm644 -t "$pkgdir/var/lib/hp" hplip.state

  find "$pkgdir/usr/share/hplip" -type f -name "*.so" | while read -r f; do
    lib_dir="${f%/*}"
    lib_name="${f##*/}"
    ln -vsf "$lib_name" "$lib_dir/${lib_name%%-*}.so"
  done
}