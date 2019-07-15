# Maintainer: Jeff M. Hubbard <jeffmhubbard@gmail.com>
_pkgname=mpnotd
pkgname=${_pkgname}-git
pkgver=r25.878ab88
pkgrel=1
pkgdesc="MPD Notification Daemon"
arch=('any')
url="https://github.com/jeffmhubbard/mpnotd"
license=('MIT')
depends=('mpd' 'python' 'python-mpd2' 'python-notify2' 'python-beautifulsoup4' 'python-pillow' 'python-colormath' 'python-colorthief')
makedepends=('git' 'python-setuptools')
optdepends=('dunst: display notifications')
conflicts=()
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')
install=${_pkgname}.install

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"

	# python setuptools
	python setup.py install --root="$pkgdir/"

	# systemd unit 
	_serviceloc="$pkgdir/usr/lib/systemd/user"
	_servicename="$_pkgname.service"
	mkdir -p "$_serviceloc"
	cp "$srcdir/$_pkgname/$_servicename" "$_serviceloc/$_servicename"

	# docs
	_docloc="$pkgdir/usr/share/doc/$_pkgname"
	mkdir -p $_docloc
	cp "$srcdir/$_pkgname/README.md" $_docloc
	cp "$srcdir/$_pkgname/LICENSE.md" $_docloc
}
