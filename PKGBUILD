# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=telegram-tg
pkgname=$_pkgname-git
pkgver=v0.7.0.r3.06f7c5b
pkgrel=3
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
	"0001-Change-setup.py-to-accept-new-python-telegram-ver.patch")
md5sums=('SKIP'
         'b5128de4dab3dbe7aaea695ac0a0b1a8')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"	

	# We now have tags so this is not needed
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	
	patch -p1 -i ${srcdir}/0001-Change-setup.py-to-accept-new-python-telegram-ver.patch
}

build() {
	cd "$srcdir/$_pkgname"

	python3 setup.py build
}

package() {
	cd "$srcdir/$_pkgname"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
