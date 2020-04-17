# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=archivebox-git
pkgver=r969.737c5c3
pkgrel=6
pkgdesc="Create a local, static, browsable HTML clone of websites (it saves HTML, JS, media files, PDFs, images and more)."
arch=('x86_64' 'i686')
url="https://github.com/pirate/ArchiveBox/"
depends=('python' 'git' 'wget' 'curl' 'youtube-dl' 'chromium')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("archivebox::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git checkout master
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

}
