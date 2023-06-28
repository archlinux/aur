# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=telegram-tg
pkgname=$_pkgname-git
pkgver=0.19.0.r3.2b0c0cf
pkgrel=2
pkgdesc="terminal telegram client that really works"
arch=(any)
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
depends=('python-telegram>=0.15.0' 'python3' 'python-setuptools')
makedepends=('git' 'python-build' 'python-poetry' 'python-installer' 'python-wheel')
optdepends=(
	'libnotify: for notifications, you could also use other programs: see config'
	'ffmpeg: to record voice msgs and upload videos correctly'
	'urlview: to choose urls when there is multiple in message, use URL_VIEW in config file to use another app, it should accept urls in stdin'
	'ranger: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
	'nnn: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
	'fzf: to create groups and secret chats, used for single and multiple user selection'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/paul-nameless/tg.git"
	"0001-Allow-newer-python-telegram.patch")
md5sums=('SKIP'
         'd036364babd1f2cb63693c7df6b4946e')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/\(v\)\(.*\)/\2/')"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -p1 -i "${srcdir}/0001-Allow-newer-python-telegram.patch"
}

build() {
	cd "$srcdir/$_pkgname"

	python setup.py bdist_wheel
}

package() {
	cd "$srcdir/$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
