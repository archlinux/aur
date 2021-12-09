# Maintainer: Martin Cation <martincation@protonmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

_pkgname=xfce4-cpugraph-plugin
pkgname=xfce4-memgraph-plugin
pkgver=1.2.5
pkgrel=1
pkgdesc="Graphical representation of the MEM load"
arch=('x86_64')
license=('GPL' 'custom')
url="https://docs.xfce.org/panel-plugins/xfce4-cpugraph-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(
	https://archive.xfce.org/src/panel-plugins/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
	xfce4-memgraph-plugin-1.2.5.patch
)
sha256sums=(
	'c2f6dbd7f83c79b63b83c98232c79d050e18640e82464b9ec8d3643a92c3a1b0'
	'5b552b8382e89d70b53b513a8d81501ca9dfa38564ff5bcd3b4893949d16f195'
)

prepare() {
	mv "$srcdir/$_pkgname-$pkgver" "$srcdir/$pkgname-$pkgver"
	find "$srcdir/$pkgname-$pkgver" -type f -exec sed \
		's/cpu/mem/g;s/Cpu/Mem/g;s/CPU/MEM/g' -i {} +
	find "$srcdir/$pkgname-$pkgver" -type f -name '*cpu*' \
		| while read file; do
		rename cpu mem "$file"
	done
	patch -p2 < "$srcdir/xfce4-memgraph-plugin-1.2.5.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
