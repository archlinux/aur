pkgname=novnc-git
pkgver=20150218.65
pkgrel=1
pkgdesc="javascript vnc client"
arch=(i686 x86_64)
url="http://kanaka.github.com/noVNC/"
license=('GPL')
depends=()
provides=('novnc')
conflicts=('novnc')
source=("novnc::git://github.com/kanaka/noVNC.git")
md5sums=('SKIP')
optdepends=(
	'websockify: for vnc servers without websocket support'
)

pkgver() {
  cd   "$srcdir"/novnc
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

prepare() {
  cd $srcdir/novnc
  rm -f utils/*.o
  rm -rf .git
}

build() {
  cd $srcdir/novnc
  #make -C utils
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
