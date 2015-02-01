pkgname=novnc
epoch=1
pkgver=0.5.1
pkgrel=2
pkgdesc="javascript vnc client"
arch=(i686 x86_64)
url="https://github.com/kanaka/noVNC"
license=('GPL')
depends=('bash' 'python')
source=("https://github.com/kanaka/noVNC/archive/v${pkgver}.tar.gz")
md5sums=('ac55b2316b2164b6e09ae3bd89c37cb6')

prepare() {
  cd $srcdir/noVNC-${pkgver}
  rm -f utils/*.o
  rm -rf .git
}

build() {
  cd $srcdir/noVNC-${pkgver}
  make -C utils clean rebind.so
}

package() {
  cd $srcdir/noVNC-${pkgver}
  mkdir -p $pkgdir/usr/share/novnc $pkgdir/usr/share/doc/novnc $pkgdir/usr/bin
  cp -a include utils images images/favicon.ico vnc.html vnc_auto.html \
	$pkgdir/usr/share/novnc/
  cp -a LICENSE.txt README.md $pkgdir/usr/share/doc/novnc
  cat >$pkgdir/usr/bin/novnc <<EOF
#!/bin/sh

cd /usr/share/novnc || exit 1
exec ./utils/launch.sh \$*
EOF
  chmod 0755 $pkgdir/usr/bin/novnc
}
