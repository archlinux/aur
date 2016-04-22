# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=mylar-git
pkgver=r632.8082a61
pkgrel=1
pkgdesc="automated Comic Book downloader for use with SABnzbd, NZBGet and torrents"
arch=('i686' 'x86_64')
url="https://github.com/evilhero/mylar"
license=('GPL3')
groups=()
depends=('python2')
makedepends=('git')
provides=("mylar")
conflicts=("mylar")
replaces=()
backup=()
options=()
install=mylar.install
source=('mylar-git::git+https://github.com/evilhero/mylar.git' 'mylar.service')
noextract=()
md5sums=('SKIP'
         '08513f5d6eebd4d2beba454361cd55ac')
sha256sums=('SKIP'
            '35d90980145bb8665e2b8bb8e9d196fbeaab881ea98b92b7eaa73277f429ae16')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	# this would be in prepare() but prepare is run before pkgver and that needs to not happen
	cd "$srcdir/$pkgname"

	rm -rf "$srcdir/$pkgname/.git" # remove unneeded git info
	rm -r "screens" # the screenshots for the GitHub page
	rm README.md # not needed
	rm API_REFERENCE # look it up on github if you want to use it

	cd "$pkgdir"
	# copy stuff over
	mkdir -p "$pkgdir/usr/share/"
	cp -r "$srcdir/mylar-git/" "$pkgdir/usr/share/mylar/"
	rm -rf "$pkgdir/usr/share/mylar/.git"

	# fix permissions
	chmod -R 755 "$pkgdir/usr/share/mylar"

	# install everything else
	install -D -m644 "$srcdir/mylar.service" "$pkgdir/usr/lib/systemd/system/mylar.service"
	mkdir -p "$pkgdir/etc/mylar"
	mkdir -p "$pkgdir/var/lib/mylar"

}
