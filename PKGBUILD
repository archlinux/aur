# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-ehforwarderbot-git
_provide=${pkgname%-git}
_name=${_provide#python-}
pkgver=r449.70d29ce
pkgrel=2
pkgdesc='An extensible message tunneling chat bot framework. Delivers messages to and from multiple platforms and remotely control your accounts.'
arch=('any')
url='https://github.com/blueset/ehForwarderBot'
license=('AGPL-3')
groups=('efb')
depends=('python-ruamel-yaml' 'python-bullet' 'python-cjkwrap' 'python-typing-extensions')
makedepends=('git' 'python-setuptools')
provides=($_provide)
conflicts=($_provide)
source=("$_provide"::"git+${url}.git"
	ehforwarderbot@.service)
md5sums=('SKIP'
	'e5acd5cc51ffb0ff891d56c9fa7dcb10')

pkgver() {
	cd "$srcdir/$_provide"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

install=ehforwarderbot.install

build() {
	cd "$srcdir/$_provide"
	python setup.py clean --all
	python setup.py build
	cd "build/lib/${_name//-/_}/locale/"
	for _locale in $(ls); do
		(cd "$_locale/LC_MESSAGES/"; msgfmt "${_name//-/_}.po" -o "${_name//-/_}.mo")
	done
}

package() {
	cd "$srcdir/$_provide"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 "$srcdir/ehforwarderbot@.service" "$pkgdir/usr/lib/systemd/system/ehforwarderbot@.service"
	install -Dm644 "$srcdir/$_provide/LICENSE.md" "$pkgdir/usr/share/licenses/$_provide/LICENSE.md"
}

