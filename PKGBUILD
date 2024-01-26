# Maintainer: aksr <aksr at t-com dot me>
pkgname=irssi-scripts-git
pkgver=r2225.b6e5be94
pkgrel=1
pkgdesc='Scripts for Irssi "http://scripts.irssi.org"'
arch=('i686' 'x86_64')
url='https://github.com/irssi/scripts.irssi.org'
license=('various')
depends=('irssi' 'perl')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p tmp
	tmpfile=$(TMPDIR="$srcdir/$pkgname/tmp" mktemp)
	pacman -Ql irssi|awk '$2~/usr\/share\/irssi\/scripts\/.*\.pl/{print $2}' > $tmpfile
	mkdir -p "$pkgdir/usr/share/irssi/scripts"
	cp -a scripts/*.pl "$pkgdir/usr/share/irssi/scripts"
	find "$pkgdir" -name "*.pl" | grep -f $tmpfile | xargs -n1 rm
}
