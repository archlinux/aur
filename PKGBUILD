# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Imported from Arch Strike
# Maintainer: ArchStrike <team@archstrike.org>

pkgname=loki
pkgver=0.2.7
pkgrel=1
pkgdesc="Python based framework implementing many packet generation and attack modules for Layer 2 and 3 protocols"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://c0decafe.de/loki.html"
license=('BSD')
depends=('python2' 'pygtk' 'python2-ipy' 'pylibpcap' 'libdnet' 'python2-dpkt' 'libglade' 'autoconf' 'automake')
source=("http://c0decafe.de/loki/loki-$pkgver.tar.gz" "loki.desktop")
options=('!emptydirs')
sha512sums=('c2f722e63024526f139dc182b5deb1779becd8f53a557c303daf4c6b02059cefb90636a7389e1267cb56e769925b4eeed4cee4c7895291462ae43ca88b097908'
            '8ddc7d629994455e4ba311cef34015a68d2c19b5e6b59cc19111c90dca449cf519ec87ab175170675a5b696fa9acde14e2d565da423197c4483507518beaed68')

prepare() {
  cd "$srcdir/loki-$pkgver"

  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "$srcdir/loki-$pkgver/src/loki.py"
  grep -rl 'python-config' "$srcdir/loki-$pkgver" | xargs sed -i 's|python-config|python2-config|g'
}

build() {
  cd "$srcdir/loki-$pkgver"

  aclocal
  automake --add-missing
  autoconf
  ./configure --prefix=/usr PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/loki-$pkgver"

  # Base directories.
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/loki"
  install -dm755 "$pkgdir/usr/share/doc/loki"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/licenses/loki"

  make "DESTDIR=$pkgdir/" install

  install -m644 LICENSE "$pkgdir/usr/share/licenses/loki"
  install -m644 AUTHORS "$pkgdir/usr/share/licenses/loki"
  install -m644 COPYING "$pkgdir/usr/share/licenses/loki"
  install -m644 "${srcdir}/loki.desktop" "$pkgdir/usr/share/applications/loki.deskop"

  for doc in ChangeLog README REQUIREMENTS; do
    install -m644 $doc "$pkgdir/usr/share/doc/loki/$doc"
  done
}
