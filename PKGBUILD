# Maintainer: F Carpano < gmail-com: daert781 >

# NOTE: This PKGBUILD provides mediainfo-gui with default html view

pkgname=(mediainfo-gui-hv)
pkgver=19.07
pkgrel=1
pkgdesc="Supplies technical and tag information about a video or audio file (GUI interface, html view)"
url="https://mediaarea.net/"
arch=('x86_64')
license=('BSD')
depends=('libmediainfo=19.07' 'wxgtk3')
provides=('mediainfo-gui')
conflicts=('mediainfo-gui')
source=("https://mediaarea.net/download/source/mediainfo/$pkgver/mediainfo_$pkgver.tar.xz"
        "default-to-html-view.patch"
)

sha512sums=('ef543b2b3fa61347adaa510fc3b051ff148e24ef6461e25b9f1d158f3c4b57ce96826d0c0e8ae46996092e0eb84e99308ba87d95dd0392b99f05b704438c5983'
            '55d33e781e46d6348280b733a19f0727d27a1deff20c96df5aa59547b63aae53767421fd34876eea6518641803d85c8793f6bd83a96f89a70c6bad08a76b9f2f')

prepare() {
	cd "$srcdir"/MediaInfo/Source/GUI/WxWidgets
	patch --ignore-whitespace --binary < "$srcdir"/default-to-html-view.patch
}

build() {
	cd "$srcdir"/MediaInfo/Project/GNU/GUI
	./autogen.sh
	./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-gtk3
	make
}

package() {
	cd "$srcdir"/MediaInfo/Project/GNU/GUI
	make DESTDIR="$pkgdir" install

	install -D -m 644 "$srcdir"/MediaInfo/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

