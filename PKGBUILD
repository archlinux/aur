# Maintainer: Filipe Laíns (FFY00) <fiilipe.lains@gmail.com>
# Contributor: Shameempk <mailtoshameempk@gmail.com>
pkgname=writefull-bin
_pkgname=${pkgname%-bin}
_rver=3.0.0
_bver=19
pkgver=${_rver}_beta$_bver
pkgrel=2
pkgdesc="App that gives feedback on your writing."
arch=('i686' 'x86_64')
url="http://writefullapp.com/"
license=('MIT' 'custom:Chromium')
makedepends=('imagemagick')
provides=('writefull')
conflicts=('writefull')
_ver=$_rver-beta$_bver
source_i686=("https://s3-eu-west-1.amazonaws.com/writefull-binaries/${_ver}/writefull_${_ver}_ia32.zip")
source_x86_64=("https://s3-eu-west-1.amazonaws.com/writefull-binaries/${_ver}/writefull_${_ver}_amd64.zip")
sha256sums_i686=('43e2237729e4b6eb267dd70ebb0aacc42a4a3ad6a97a5a5e38bab35b3eb7ad84')
sha256sums_x86_64=('6fdc2b8bcf93c972f4691c244c3a6bcc5ba6ee6bad76e163c889a1aacedc7c39')

if [ "$(uname -m)" = "x86_64" ]; then
        _arch=amd64
	_arch_dir=x64
elif [ "$(uname -m)" = "i686" ]; then
        _arch=ia32
	_arch_dir=ia32
fi

package() {
	install -dm 755 "$pkgdir"/opt/$_pkgname
	cp -dr --no-preserve=ownership "$srcdir"/Writefull-linux-$_arch_dir/* "$pkgdir"/opt/$_pkgname

	convert "$pkgdir"/opt/$_pkgname/Writefull.ico "$pkgdir"/opt/$_pkgname/Writefull.png
	install -Dm 644 "$pkgdir"/opt/$_pkgname/Writefull-0.png "$pkgdir"/opt/pixmaps/writefull.png

	sed -i 's|Icon=.*$|Icon=/opt/pixmaps/writefull.png|g' "$pkgdir"/opt/$_pkgname/writefull.desktop
	sed -i 's|Exec=.*$|Exec=writefull|g' "$pkgdir"/opt/$_pkgname/writefull.desktop
	install -Dm 755 "$pkgdir"/opt/$_pkgname/writefull.desktop "$pkgdir"/usr/share/applications/Writefull.desktop

	rm "$pkgdir"/opt/$_pkgname/Writefull.ico
	rm "$pkgdir"/opt/$_pkgname/Writefull-*.png
	rm "$pkgdir"/opt/$_pkgname/writefull.desktop

	install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
	ln -s "$pkgdir"/opt/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	ln -s "$pkgdir"/opt/$_pkgname/LICENSES.chromium.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSES.chromium.html

	install -dm 755 "$pkgdir"/usr/bin
	ln -s /opt/$_pkgname/Writefull "$pkgdir"/usr/bin/writefull
}
