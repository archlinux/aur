# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainers: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#      and: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi
pkgver=4.2.13
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64' 'aarch64')
url="http://w1hkj.org"
license=('GPL-2.0-or-later')
depends=('cty' 'fltk' 'libsamplerate' 'flxmlrpc>=1.0.1' 'libsndfile'
         'portaudio' 'libpulse' 'libgpiod' 'hamlib' 'hamradio-menus')
optdepends=('pulseaudio: pulseaudio support')
source=(http://w1hkj.org/files/$pkgname/$pkgname-$pkgver.tar.gz
#	diff.wayland.fix)
	flarq.wayland.patch)

prepare () {
	cd $srcdir/$pkgname-$pkgver

#	patch -p0 < ../diff.wayland.fix
	patch -p0 < ../flarq.wayland.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgver

# fldigi 4.2.13 is not compatible with _GLIBCXX_ASSERTIONS
# when creating ComboBoxes.
CFLAGS="${CFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
export CFLAGS CXXFLAGS

	./configure --prefix=/usr \
		--enable-tls --with-flxmlrpc --without-asciidoc
#		--enable-tls --without-flxmlrpc --without-asciidoc
#			(^^^ temporary, until flxmlrpc is updated)
	make ASCIIDOC_ICONS_DIR=/etc/asciidoc/images/icons/
}

check() {
	cd "$srcdir"/$pkgname-$pkgver

	make -k check
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('bec4586a08983f53f01c9a722895c8a8'
         'c180f454288d495ecbc65b364818530d')
sha256sums=('a1e8d990359ce9c0cce3ceb5116fd0cf72c95528969766898640ca6ca2dba8d4'
            '3bdbd3fe1b8d7864f46418606e1ab98ca45b48fecd2338a573074c4185dbf380')
