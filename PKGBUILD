# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

pkgname=antsword
pkgver=2.1.12
pkgrel=7
pkgdesc="AntSword is a cross-platform webshell management toolkit."
arch=('any')
url="https://www.yuque.com/antswordproject"
license=('MIT')
depends=('electron4')
makedepends=('imagemagick' 'nodejs')
provides=('antsword')
options=('strip')
source=("https://github.com/AntSwordProject/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-$pkgver.patch"
        "$pkgname.desktop"
        "$pkgname.png"
        "$pkgname")
sha256sums=("e590e98deea1130932e702056ad13ed7a6805e45c0f3695ae6e76f1088c356f9"
        "7a9d56dad4d5df8968aed7aec76c6c983a0f6141334ca07e1d5ae80f0829531e"
        "f3cff3ac504b8ff4bd48c9086e49ae978b6f13a3a60dc80b4dfca584c6995f69"
        "94894700d63d1c94f8e8d1fade1df936e1fee32d42f886ea32a6e6b29d40a866"
        "93fb7eb6f00647f0f2bdb82a86176a8413d0a986a37ce7972799fb95d4f02b01")

prepare() {
	# Regulate package dir name
	find . -depth -type d -iname "$pkgname-$pkgver" -exec mv {} "$pkgname-$pkgver" \;

	cd "$pkgname-$pkgver"
	# Patch out blacklist
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"

	# Convet icons
	local res
	for res in 32x32 256x256; do
		convert "$srcdir/$pkgname.png" -resize 512x512 "$srcdir/$res.png"
	done
}

package() {
	# Place files
	install -d "$pkgdir/usr/lib"
	cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/lib/$pkgname"

	# Place launcher script
	install -Dm 755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

	# Place desktop entry and icon
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
	local res
	for res in 32x32 256x256; do
		install -DT "$srcdir/$res.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
	done
}
