# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=imagej2
_ver=2.0.0-rc-69
pkgver=${_ver//-/}
pkgrel=1
pkgdesc="Image manipulation software for scientists"
arch=('any')
url="https://imagej.net"
license=('Public Domain')
depends=('java-runtime>=8')
makedepends=('maven' 'java-environment=8')
source=("https://github.com/imagej/imagej/archive/imagej-$_ver.tar.gz"
        "imagej2.desktop")
md5sums=('c5a2a829b871a708c67a29757bae5589'
         'db18ac6d6ed799e04bc23b635b35e673')

build() {
	cd imagej-imagej-$_ver

	# only building with Java 8 is supported
	# https://github.com/imagej/imagej/issues/197#issuecomment-403531162
	export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
	mvn -Papp -Ppopulate-app
}

package() {
	mkdir -p $pkgdir/usr/share
	cp -r $srcdir/imagej-imagej-$_ver/ImageJ.app $pkgdir/usr/share/imagej2
	rm -r $pkgdir/usr/share/imagej2/{Contents,ImageJ-win{32,64}.exe}

	mkdir -p $pkgdir/usr/bin
	ln -s /usr/share/imagej2/ImageJ-linux64 $pkgdir/usr/bin/imagej2

	cd $srcdir
	install -Dm644 imagej2.desktop $pkgdir/usr/share/applications/imagej2.desktop
	install -Dm644 imagej-imagej-$_ver/logo/imagej.png $pkgdir/usr/share/icons/hicolor/512x512/apps/imagej2.png
}
