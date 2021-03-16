# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=telegram-tg
pkgname=$_pkgname-git
pkgver=0.7.0.r7.1cd023a
pkgrel=1
pkgdesc="terminal telegram client that really works"
arch=(any)
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
depends=('python-telegram' 'python3')
makedepends=('git' 'python-setuptools')
optdepends=(
	'libnotify: for notifications, you could also use other programs: see config'
	'ffmpeg: to record voice msgs and upload videos correctly'
	'urlview: to choose urls when there is multiple in message, use URL_VIEW in config file to use another app, it should accept urls in stdin'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/paul-nameless/tg.git"
	"0001-Change-setup.py-to-accept-new-python-telegram-ver.patch"
	"0002-Fix-compatibility-with-new-libtd-version.patch")
md5sums=('SKIP'
         '7b9a556ce7d2203fbee32442a96d73bc'
         '13f56d00337b141c270906f0df49e872')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/\(v\)\(.*\)/\2/')"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	
	patch -p1 -i ${srcdir}/0001-Change-setup.py-to-accept-new-python-telegram-ver.patch
	patch -p1 -i ${srcdir}/0002-Fix-compatibility-with-new-libtd-version.patch
}

build() {
	cd "$srcdir/$_pkgname"

	python3 setup.py build
}

package() {
	cd "$srcdir/$_pkgname"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
