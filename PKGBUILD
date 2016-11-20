# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Tom Wizetek <tom@wizetek.com>

pkgname=jxplorer
pkgver=3.3.1.2
pkgrel=2
pkgdesc='Java LDAP client'
url='http://jxplorer.org/'
license=('custom')
arch=('any')
depends=('java-runtime')
makedepends=('setconf')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/version%20${pkgver}/$pkgname-$pkgver-linux-installer.run")
sha256sums=('7ff5ff0a124d8e16d7688ae093cfcd859f4be3104f3455cc59d4b15d55a61ffa')

prepare() {
  cat > "$pkgname.run" << EOF
#!/bin/sh
cd "/opt/$pkgname"
sh jxplorer.sh "\$@"
EOF

  chmod +x *.run
  ./"$pkgname-$pkgver-linux-installer.run" \
    --mode unattended \
    --prefix "$srcdir/$pkgname"

  cd "$pkgname"
  setconf JXplorer.desktop Version "$pkgver"
  setconf JXplorer.desktop Comment "$pkgdesc"
  setconf JXplorer.desktop Icon "/opt/jxplorer/images/logo_32_trans.gif"
  setconf JXplorer.desktop Exec "/opt/jxplorer/jsxplorer.sh"
}

package() {
  install -d "$pkgdir/opt"

  cp -r "$pkgname" "$pkgdir/opt"
  chmod +x "$pkgdir/opt/$pkgname/jxplorer.sh"
  touch "$pkgdir/opt/$pkgname/"{gssapi.conf,jxconfig.txt}

  # No user settings, only global. Bah.
  chmod 666 "$pkgdir/opt/$pkgname/"{gssapi.conf,jxconfig.txt}
  chmod 777 "$pkgdir/opt/$pkgname/plugins/"

  install -Dm755 "$pkgname.run" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname/JXplorer.desktop" \
    "$pkgdir/usr/share/applications/JXplorer.desktop"

  # Cleanup
  rm -f "$pkgdir/opt/$pkgname/"{uninstall,*.desktop,*.bat}
}

# vim:set ts=2 sw=2 et:
