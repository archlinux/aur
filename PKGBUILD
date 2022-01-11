# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='nuxhash-venv-git'
pkgver=v1.0.0b2.r33.g33e9a09
pkgrel=1
pkgdesc="A NiceHash cryptocurrency mining client for Linux - Python 3.9 venv, fixes GUI problems."
arch=('x86_64')
url="https://github.com/YoRyan/nuxhash"
license=('GPL3')
depends=('python39' # https://github.com/YoRyan/nuxhash/issues/119
         'curl'
         'nvidia'
         'opencl-nvidia'
         'cuda')
source=("git+https://github.com/YoRyan/nuxhash.git"
        "fix-wx-issues.patch"
        "fix-404.patch"
        "nuxhashd.sh"
        "nuxhash-gui.sh"
        "nuxhash-gui.desktop")
sha256sums=('SKIP'
            '79c56a0fcc373cc76d5b627514103cb4914f7a45780f131ac4a81946b0371bbd'
            '55d410a61aa080e0680091fbf3dd3e54837c11b60c13257d2c7e6b75395b20c6'
            'c6bc0d3c707091469ce2a91e906131a3b799afa46451ff21547b780cfac4cd0c'
            '62d2c21495b5b0e3ff9354b585adc75816752ab2d9a5cc3e9af89ed77ed7e1c1'
            '779c28c990c97b6c6fb2b2ad1cf84ff99dcdf5c1b72f034750994fdc8a645055')
conflicts=('nuxhash-git')
provides=('nuxhash-git')

pkgver() {
	cd nuxhash
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch -p1 < fix-wx-issues.patch
	patch -p1 < fix-404.patch
}

package() {
	export PIP_DISABLE_PIP_VERSION_CHECK=1
	cd nuxhash
	mkdir -p "$pkgdir"/opt/nuxhash
	python3.9 -m venv "$pkgdir"/opt/nuxhash
	source "$pkgdir"/opt/nuxhash/bin/activate
	pip install wheel pypubsub
	pip install wxpython .
	install -Dm644 nuxhash/gui/icons/nuxhash.svg "$pkgdir"/usr/share/pixmaps/nuxhash.svg
	install -Dm644 ../nuxhash-gui.desktop "$pkgdir"/usr/share/applications/nuxhash-gui.desktop
	install -Dm755 ../nuxhashd.sh "$pkgdir"/usr/bin/nuxhashd
	install -Dm755 ../nuxhash-gui.sh "$pkgdir"/usr/bin/nuxhash-gui
}
