# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

pkgname=antsword
pkgver=2.1.14
pkgrel=2
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
sha256sums=("1667e636b68ffde32b5faa76a40797a6efc63c78693e545598a44028b6a25b5b"
        "e0fcdd7048910f3e8fbaa73996566e8781d161be196b1e68403d9ad2af6dc21d"
        "f3cff3ac504b8ff4bd48c9086e49ae978b6f13a3a60dc80b4dfca584c6995f69"
        "94894700d63d1c94f8e8d1fade1df936e1fee32d42f886ea32a6e6b29d40a866"
        "977973b5628e6b7e12891049a13f0437013effa5b4e7c2de0fe56b4878add72b")

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
