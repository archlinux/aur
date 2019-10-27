# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-efb-wechat-slave-git
_provide=${pkgname%-git}
_name=${_provide#python-}
pkgver=r152.d6a3be6
pkgrel=1
pkgdesc='EFB WeChat Slave, a channel for EH Forwarder Bot.'
arch=('any')
url='https://github.com/blueset/efb-wechat-slave'
license=('AGPL-3')
groups=('efb')
depends=(
	'python-ehforwarderbot' 'python-itchat' 'python-magic-ahupp' 'python-pillow' 'libwebp' 'python-pyqrcode' 'python-xmltodict' 'python-yaml' 'python-requests' 'python-typing-extensions' 'python-bullet' 'python-cjkwrap')
makedepends=('git'  'python-setuptools')
provides=($_provide)
conflicts=($_provide)
source=("$_provide"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_provide"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
	install -Dm644 "$srcdir/$_provide/LICENSE.md" "$pkgdir/usr/share/licenses/$_provide/LICENSE.md"
}

