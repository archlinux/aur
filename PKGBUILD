# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org>

pkgname=i3pystatus-git
pkgdesc="i3status replacement written in python for the i3 window manager"
pkgver=3.35.r407.gf3c539a
pkgrel=3
arch=('any')
url="https://github.com/enkore/i3pystatus"
license=('MIT')
depends=('python>=3.6')
optdepends=(
	'python-pyalsaaudio: For the alsa module.',
	'python-dbus: For the thunderbird or now_playing modules.',
	'python-psutil: For the mem, membar or network_traffic modules.',
	'python-netifaces: For the network or wireless modules.',
	'python-beautifulsoup4: For the parcel module.',
	'python-cssselect: For the parcel module.',
	'python-lxml: For the parcel module.',
	'python-pywapi: For the weather module.',
	'python-basiciw: For the wireless module.'
	'python-colour: For the pulseaudio module.')
makedepends=('git' 'python-setuptools')
checkdepends=('python-colour' 'python-pytest-runner' 'python-mock')
provides=('i3pystatus')
conflicts=('i3pystatus')
source=("$pkgname::git+$url"
        "buds_tests.patch::https://github.com/enkore/i3pystatus/pull/869.patch")
md5sums=('SKIP'
         'cc131e013287c8864620a19d55d99d70')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare () {
        cd "$pkgname"
        patch -Np1 -i ../buds_tests.patch
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	python setup.py pytest
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 MIT-LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst CONTRIBUTORS -t "$pkgdir/usr/share/doc/$pkgname/"
}
