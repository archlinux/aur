pkgname=novnc
epoch=1
pkgver=0.5
pkgrel=2
pkgdesc="javascript vnc client"
arch=(i686 x86_64)
url="https://github.com/kanaka/noVNC"
license=('GPL')
depends=('bash' 'python')
makedepends=('git')
source=("$pkgname::git+https://github.com/kanaka/noVNC.git#tag=v0.5")
md5sums=('SKIP')

prepare() {
  cd $srcdir/novnc
  rm -f utils/*.o
  rm -rf .git
}

build() {
  cd $srcdir/novnc
  make -C utils clean rebind.so
}

package() {
  cd $srcdir/novnc
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
