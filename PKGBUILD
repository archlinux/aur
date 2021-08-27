# Maintainer: Maciej Łoziński <maciej@robotix-lozinski.pl>
pkgname="red-nightly-bin"
pkgver=0.6.4.nightly
pkgrel=1
pkgdesc="Red is a next-generation programming language strongly inspired by Rebol"
arch=(x86_64)
url="https://www.red-lang.org"
license=('custom:BSD-3-Clause' 'custom:BSL-1.0')
depends=(lib32-curl lib32-gtk3 lib32-gdk-pixbuf2)
makedepends=(wget)
optdepends=(
	'openssh: for X11 forwarding on headless machines'
	'xorg-xhost: for X11 forwarding on headless machines'
	'xorg-xauth: for X11 forwarding on headless machines')
provides=(red red-nightly)
conflicts=(red red-nightly red-bin ed)
options=(!strip)
source=(
	"https://static.red-lang.org/dl/auto/linux/red-latest"
	"https://raw.githubusercontent.com/red/red/master/BSL-License.txt"
	"https://raw.githubusercontent.com/red/red/master/BSD-3-License.txt")
md5sums=(
	SKIP
	'e4224ccaecb14d942c71d31bef20d78c'
	'8a643e34f08f7b9c9b480ad58fb4db3d')


prepare() {
	cd "$srcdir"
	wget https://static.red-lang.org/download.html
	_date=$( grep -P 'linux/red-latest">red-\K(.{7})(?=-.*</a)' -o download.html )
	_commit=$( grep -P 'linux/red-latest">red-(.{7})-\K(.*)(?=</a)' -o download.html )
	_sha256=$( grep -Pz '(?s)linux/red-latest.*?\K([0-9a-f]{64})' -o download.html )
	rm download.html
}

pkgver() {
	cd "$srcdir"

	# days from Red's first commit
	_days=$( expr \( `date --date="$_date" "+%s"` - `date --date="07mar11" "+%s"` \) \/ 86400 )

	printf "r%s.%s" "$_days" "$_date.$_commit"
}

check() {
	cd "$srcdir"
	echo "$_sha256 red-latest" | sha256sum -c --quiet -
	[ $? -eq 0 ] || exit 1
}

package() {
	cd "$srcdir"

	install -Dm755 red-latest "$pkgdir/usr/bin/red"

	install -dm755 "${pkgdir}/usr/share/licenses/$pkgname"
	install -Dm644 BSL-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSL-License.txt"
	install -Dm644 BSD-3-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSD-3-License.txt"
}
