# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=crowbar
pkgver=3.4
pkgrel=1
pkgdesc="A brute forcing tool that supports protocols that are not currently supported by thc-hydra and other popular brute forcing tools."
arch=('any')
url="https://github.com/galkan/crowbar"
license=('custom')
depends=('python2' 'openvpn' 'freerdp' 'tigervnc')
source=("https://github.com/galkan/crowbar/archive/v.${pkgver}.tar.gz")
sha512sums=('fe10fc7a4b897ef7344c4a147b172fb9b91caa2bb9dc626514f4af2877064fe8159ec7a250104cac57bf65101f87e821cfade59e5d2d071366a9436147538a15')

prepare(){
  grep -iRl 'python' "$srcdir/$pkgname-v.$pkgver" | xargs sed -i 's|#!.*/usr/bin/python|#!/usr/bin/python2|;s|#!.*/usr/bin/env python$|#!/usr/bin/env python2|'
}

package() {
  cd "$srcdir/$pkgname-v.$pkgver"
  install -dm755 "$pkgdir/usr/bin/"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/usr/share/$pkgname/lib"
  install -dm755 "$pkgdir/usr/share/$pkgname/lib/core"
  install -dm755 "$pkgdir/usr/share/$pkgname/images"
  install -Dm644 images/* "$pkgdir/usr/share/$pkgname/images/"
  install -Dm644 lib/*.py "$pkgdir/usr/share/$pkgname/lib/"
  install -Dm644 lib/core/*.py "$pkgdir/usr/share/$pkgname/lib/core/"
  install -Dm644 README.md "$pkgdir/usr/share/$pkgname/README.md"
  install -Dm755 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm755 crowbar.py  "$pkgdir/usr/share/$pkgname/crowbar.py"

cat >"$pkgdir/usr/bin/crowbar" <<EOF
#!/bin/sh
cd /usr/share/crowbar
python2 crowbar.py "\$@"
EOF

chmod +x "$pkgdir/usr/bin/crowbar"
}
