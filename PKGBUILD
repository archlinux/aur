# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-efb-telegram-master-git
_provide=${pkgname%-git}
_name=${_provide#python-}
pkgver=r235.8778f91
pkgrel=2
pkgdesc='EFB Telegram Master, a channel for EH Forwarder Bot.'
arch=('any')
url='https://github.com/blueset/efb-telegram-master'
license=('AGPL-3')
groups=('efb')
depends=(
	'python-ehforwarderbot' 'python-telegram-bot-git' 'python-urllib3>=1.25.3' 'python-magic-ahupp' 'python-moviepy' 'python-imageio-ffmpeg' 'python-peewee' 'python-requests' 'python-pydub' 'python-ruamel-yaml' 'python-language-tags' 'python-retrying'  'python-bullet' 'python-cjkwrap' 'python-humanize' 'python-tgs' 'python-cairosvg')
makedepends=('git' 'python-setuptools')
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
	python setup.py install --root="$pkgdir/" --skip-build --optimize=1
	install -Dm644 "$srcdir/$_provide/LICENSE.md" "$pkgdir/usr/share/licenses/$_provide/LICENSE.md"
}

