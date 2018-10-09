# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=imagej2
_ver=2.0.0-rc-68
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="Image manipulation software for scientists"
arch=('any')
url="https://imagej.net"
license=('Public Domain')
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment=8')
source=("https://github.com/imagej/imagej/archive/imagej-$_ver.tar.gz"
        "imagej2.desktop"
        "fix-launcher.patch")
md5sums=('8a1ebe7fbe111ad1de3ca8381fb4d259'
         'db18ac6d6ed799e04bc23b635b35e673'
         '7936077e9d108b000fb66e1b65ff19c0')

prepare() {
	cd imagej-imagej-$_ver
	# https://github.com/imagej/imagej/issues/204
	patch -Np1 -i ../fix-launcher.patch
}

build() {
	cd imagej-imagej-$_ver

	# only building with Java 8 is supported
	# https://github.com/imagej/imagej/issues/197#issuecomment-403531162
	export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
	mvn -Papp -Ppopulate-app \
	    -Dimagej-launcher.version=5.0.1-SNAPSHOT # https://github.com/imagej/imagej/issues/204
}

package() {
	mkdir -p $pkgdir/usr/share
	cp -r $srcdir/imagej-imagej-$_ver/ImageJ.app $pkgdir/usr/share/imagej2
	rm -r $pkgdir/usr/share/imagej2/{Contents,ImageJ-win64.exe}

	mkdir -p $pkgdir/usr/bin
	ln -s /usr/share/imagej2/ImageJ-linux64 $pkgdir/usr/bin/imagej2

	cd $srcdir
	install -Dm644 imagej2.desktop $pkgdir/usr/share/applications/imagej2.desktop
	install -Dm644 imagej-imagej-$_ver/logo/imagej.png $pkgdir/usr/share/icons/hicolor/512x512/apps/imagej2.png
}
