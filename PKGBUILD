# Maintainer: AronYoung <tfk6fkt at gmail dot com>
pkgname=simpletex
pkgver=0.2.5
pkgrel=1
pkgdesc="A free and convenient formula recognition software."
arch=(x86_64 aarch64)
url="https://simpletex.cn/"
license=('unknown')
depends=(electron13 bash)
makedepends=(asar imagemagick)
provides=(simpletex)
source=("https://gitee.com/$pkgname/simple-tex-download/releases/download/v$pkgver/SimpleTex%20Setup%20$pkgver.zip"
	$pkgname.desktop
)
sha256sums=('60ad5c9eb4ae3be9d8822782f2f28a9978a164f9f9698cb02490b546c7b004a0'
            '4584142e974889a9759ebdb49b7f40afb710342a7f29e0c2d742854fdb636d42')

prepare() {
	bsdtar -xvf *.exe
	# to get simpletex.ico
	asar e resources/app.asar ./app-unpacked
}

package() {
	find . -name "app.asar" -exec install -D {} -t "$pkgdir/opt/$pkgname/" \;
	echo -e "#!/bin/bash\nelectron13 /opt/$pkgname/app.asar" | install -Dm755 /dev/stdin $pkgdir/usr/bin/simpletex
	install -Dm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
	# install icon
	find . -name "$pkgname.ico" -exec convert {} "$pkgname.png" \;
	find . -name "$pkgname.png" -exec install -Dm644 {} -t "$pkgdir/usr/share/pixmaps/" \;
}
