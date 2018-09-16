# Maintainer: F Carpano < gmail-com: daert781 >

# NOTE: This PKGBUILD provides mediainfo-gui with default html view

pkgname=(mediainfo-gui-hv)
pkgver=18.08.1
pkgrel=1
pkgdesc="Supplies technical and tag information about a video or audio file (GUI interface, html view)"
url="https://mediaarea.net/"
arch=('x86_64')
license=('BSD')
depends=('libmediainfo=18.08.1' 'wxgtk3')
provides=('mediainfo-gui')
conflicts=('mediainfo-gui')
source=("https://mediaarea.net/download/source/mediainfo/$pkgver/mediainfo_$pkgver.tar.xz"
        "default-to-html-view.patch"
)

sha512sums=('ff807138a253dfe8ea79d568a0c742e9391709e1e0ae3c5d0ce0e5345f2306057b541e5eb2bdd6bf0032f287b2387dfc21a506698ccd2c81a9f70679cf518480'
            '55d33e781e46d6348280b733a19f0727d27a1deff20c96df5aa59547b63aae53767421fd34876eea6518641803d85c8793f6bd83a96f89a70c6bad08a76b9f2f'
)

prepare() {
  cd "$srcdir/MediaInfo/Source/GUI/WxWidgets"
  patch --ignore-whitespace --binary < "$srcdir/default-to-html-view.patch"
}

build() {
  cd "$srcdir/MediaInfo/Project/GNU/GUI"
  ./autogen.sh
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-gtk3
  make
}

package() {
	cd "$srcdir/MediaInfo/Project/GNU/GUI"
  make DESTDIR="$pkgdir" install

  install -D -m 644 "$srcdir"/MediaInfo/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

