# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org>

pkgname=i3pystatus-git
pkgdesc="i3status replacement written in python for the i3 window manager"
pkgver=3.35.r407.gf3c539a
pkgrel=5
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
        "buds_tests.patch::https://github.com/enkore/i3pystatus/pull/869.patch"
        "notmuch2.patch::https://github.com/enkore/i3pystatus/pull/876.patch")
sha256sums=('SKIP'
            'ca84c6744ba14aac4c526d785f0ce1296ae3b34fd1f8a307649f111c18e97eeb'
            'b2c2906f4277a3378baa29f9c96965613a94e0d47890f2e41e7dcba6bd86481e')
b2sums=('SKIP'
        'e7df6ecd4f0adc20f1de39ce13dbcc565a19436d9de3f06e663cc165be575d58e02660bfe623fdd1b0004c050b75ca95be5d3f3f2518ac232bb8a0dbaff41b36'
        'bb6feb5957de752d6a7656b81221f72d34caa7b6e83c26f4ceca75d0c7864903abd5470314a6278e496ce63b0170cebcb06becc3ec23372803b7b07941c9ba79')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare () {
        cd "$pkgname"
        patch -Np1 -i ../buds_tests.patch
        patch -Np1 -i ../notmuch2.patch
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	python -m pytest
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 MIT-LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst CONTRIBUTORS -t "$pkgdir/usr/share/doc/$pkgname/"
}
