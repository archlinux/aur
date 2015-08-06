# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=artillery
pkgver=git
pkgrel=3
pkgdesc="A combination of a honeypot, file-system monitoring, system hardening, and overall health of a server to create a comprehensive way to secure a system"
arch=('any')
url=('https://www.trustedsec.com/downloads/artillery/')
license=('BSD')
makedepends=('git')
depends=('python2')
source=('git+https://github.com/trustedsec/artillery/')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/artillery"

  # Ensure setup script installs to $pkgdir
  # and not directly into the system.
  sed -i "s|/var|$pkgdir/var|g" setup.py
  sed -i "s|/etc|$pkgdir/etc|g" setup.py
}

package() {
  cd "$srcdir/artillery"

  # Install script is interactive, run install
  # passing responses.
  python2 setup.py <<< $'y\nn\nn'

  rm "$pkgdir/var/artillery/setup.py"

  install -dm755 "$pkgdir/usr/bin"

  cat > "$pkgdir/usr/bin/artillery" <<EOF
#!/bin/sh
cd /var/artillery
if test \$EUID != 0 ; then
  echo 'Must be run as root.'
  exit 1
fi
python2 artillery.py "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/artillery"
}
