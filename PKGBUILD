# Mantainer: Alessio <alessio@linux.com>
# Contributor: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=archivebox-git
pkgver=0.5.4.r749.40ddd33
pkgrel=1
pkgdesc="Create a local, staticm browsable archive of websites."
arch=('x86_64' 'i686')
url="https://github.com/pirate/ArchiveBox/"
depends=('python' 'git' 'wget' 'curl' 'youtube-dl' 'chromium')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("archivebox::git+${url}#branch=dev")
noextract=()
sha256sums=('SKIP')
license=('MIT')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/-rc./rc/;s/\([^-]*-\)g/r\1/;s/-/./g'

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	set -x
	DST="/usr/lib"
	install -dDm 755 "$pkgdir$DST"
	cp -r "$srcdir/${pkgname%-git}/" "$pkgdir$DST"
	chmod -R 755 "$pkgdir$DST"

	SHFILE="$srcdir/archivebox.sh"
	echo "#!/usr/bin/sh
OUTPUT_DIR=\"\${OUTPUT_DIR:=\$HOME/.archivebox}\" \"${DST}/${pkgname%-git}/bin/archivebox\" \$@" > "$SHFILE"
	install -Dm 755 "$SHFILE" "$pkgdir/usr/bin/archivebox"
	set +x

	install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
