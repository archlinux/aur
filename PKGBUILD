# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: sekret (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname="tupi"
_pkgver=0.2-git08
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A design and authoring tool for digital artists interested in 2D animation."
url="http://www.maefloresta.com/tupi"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt5-multimedia" "qt5-svg" "quazip" "ffmpeg" "shared-mime-info")
makedepends=("ruby" "zlib" "libgl")
source=("http://sourceforge.net/projects/tupi2d/files/Source%20Code/tupi-$_pkgver.tar.gz" 
        "quazip5.patch")
md5sums=('bcfd08a332c2336e9eb50217cfde1a96'
         'b5da9bd90ef57e6778f4e281572da3eb')

prepare() {
	cd tupi-$_pkgver
	patch -p1 -i ../quazip5.patch
#	sed -i 's|PIX_FMT_YUV420P|AV_PIX_FMT_YUV420P|g' 'src/plugins/export/libavplugin/tlibavmoviegenerator.cpp' 'configure.tests/libav/main.cpp'
}

build() {
	cd tupi-$_pkgver
	./configure \
		--libdir="/usr/lib" \
		--sharedir="/usr/share/tupi" \
		--without-debug
	make
}

package() {
	cd tupi-$_pkgver
	make DESTDIR="$pkgdir" install

	sed "s|$pkgdir||" -i "$pkgdir/usr/bin/tupi"
	mkdir -p "$pkgdir/etc/ld.so.conf.d"
	echo "/usr/lib/tupi" > "$pkgdir/etc/ld.so.conf.d/tupi.conf"
}
