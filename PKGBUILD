# Maintainer: Leo von Klenze <devel@leo.von-klenze.de>
pkgname=qooxdoo-sdk
pkgver=5.0
pkgrel=1
dirname=qooxdoo
pkgdesc="Framework for creating rich internet applications."
arch=(i686 x86_64)
url="http://qooxdoo.org"
license=('LGPL' 'EGPL')
depends=(python2)
options=('!strip')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/qooxdoo/$dirname-$pkgver-sdk.zip)
md5sums=('8de6e4d71e2a9036bc1212cf6fec3869')
provides=('qooxdoo')

build() {
  cd "$srcdir/$dirname-$pkgver-sdk"
  
  msg "Changing links to python2"
  for file in `find "$srcdir/qooxdoo-$pkgver-sdk" -name '*.py'`; do
     sed -i '1s|^#!/usr/bin/env[ \t]\+python\b|#!/usr/bin/env python2|' "$file"
  done
}

package() {
  mkdir -p "$pkgdir/opt/qooxdoo/$pkgver"
  mkdir -p "$pkgdir/var/lib/qooxdoo/cache"
  chmod u=rwX,g=rwXs "$pkgdir/var/lib/qooxdoo/cache"
  chown root:users "$pkgdir/var/lib/qooxdoo/cache"
  cp -R "$srcdir/$dirname-$pkgver-sdk/"* "$pkgdir/opt/qooxdoo/$pkgver"
  ln -s /var/lib/qooxdoo/cache "$pkgdir/opt/qooxdoo/$pkgver/tool/cache"

  ln -s /opt/qooxdoo/$pkgver "$pkgdir/opt/qooxdoo/current"

  msg "Creating link: qx-create-application"
  mkdir -p "$pkgdir/usr/bin/"
  cat > "$pkgdir/usr/bin/qx-create-application" <<END_TEXT 
#!/bin/sh
/opt/qooxdoo/current/create-application.py \$@
END_TEXT
  chmod a+x "$pkgdir/usr/bin/qx-create-application"
}

# vim:set ts=2 sw=2 et:
