# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Contributor: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>

_pkgname=betterlockscreen
pkgname=${_pkgname}-git
pkgver=v4.0.4.r0.ge6c5530
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/pavanjadhaw/${_pkgname}"
_git_branch="main"
license=('MIT')
depends=('i3lock-color>=2.13.c.3-1' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
optdepends=('feh: Allows setting wallpaper')
conflicts=("betterlockscreen")
source=("${_pkgname}::git+${url}.git#branch=$_git_branch")
md5sums=('SKIP')
install=${_pkgname}.install

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	_srcdir="$srcdir/$_pkgname"
	install -Dm 755 "$_srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	if [[ $(pidof systemd) ]]; then
		_serviceloc="$pkgdir/usr/lib/systemd/system"
		_servicename="$_pkgname@.service"
        sed -i 's,usr/local,usr,' "$_srcdir/system/$_servicename"
		install -Dm 644 "$_srcdir/system/$_servicename" "$_serviceloc/$_servicename"
	fi
	install -Dm 644 "$_srcdir/examples/${_pkgname}rc" "$pkgdir/usr/share/doc/$_pkgname/examples/${_pkgname}rc"
}
