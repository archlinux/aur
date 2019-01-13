# Maintainer: Jeff M. Hubbard <jeffmhubbard@gmail.com>
_pkgname=mpnotd
pkgname=${_pkgname}-git
pkgver=r10.daf63c2
pkgrel=1
pkgdesc="MPD Notification Daemon"
arch=('any')
url="https://github.com/jeffmhubbard/mpnotd"
license=('MIT')
depends=('mpd' 'python' 'python-mpd2' 'python-notify2' 'python-beautifulsoup4' 'python-pillow')
makedepends=('git')
optdepends=('dunst: display notifications')
conflicts=()
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")
install=${_pkgname}.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -Dm 755 "$srcdir/$_pkgname/$_pkgname" $pkgdir/usr/bin/$_pkgname
	if [[ $(pidof systemd) ]]; then
		_serviceloc="$pkgdir/usr/lib/systemd/user"
		mkdir -p "$_serviceloc"
		_servicename="$_pkgname.service"
		cp "$srcdir/$_pkgname/$_servicename" "$_serviceloc/$_servicename"
	fi
    _docloc="$pkgdir/usr/share/doc/mpnotd"
    mkdir -p $_docloc
    cp "$srcdir/$_pkgname/README.md" $_docloc
    cp "$srcdir/$_pkgname/LICENSE" $_docloc
}
