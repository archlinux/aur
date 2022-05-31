# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='nuxhash-git'
pkgver=v1.0.0b2.r33.g33e9a09
pkgrel=6
pkgdesc="A NiceHash cryptocurrency mining client for Linux."
arch=('x86_64')
url="https://github.com/YoRyan/nuxhash"
license=('GPL3')
depends=('python' 'python-requests' 'curl' 'nvidia' 'opencl-nvidia' 'cuda')
makedepends=('python-setuptools' 'git')
optdepends=('python-wxpython: GUI support'
            'python-pypubsub: GUI support')
source=("git+https://github.com/YoRyan/nuxhash.git"
        "fix-wx-issues.patch"
        "fix-404.patch"
        "p310-compliance.patch"
        "nuxhash-gui.desktop")
sha256sums=('SKIP'
            '79c56a0fcc373cc76d5b627514103cb4914f7a45780f131ac4a81946b0371bbd'
            '55d410a61aa080e0680091fbf3dd3e54837c11b60c13257d2c7e6b75395b20c6'
            '794ac3d36cbff363d80ca82b3d9c42fb29be6a7afd3e9712223407161b4198ef'
            '779c28c990c97b6c6fb2b2ad1cf84ff99dcdf5c1b72f034750994fdc8a645055')

pkgver() {
	cd nuxhash
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch -p1 < fix-wx-issues.patch
	patch -p1 < fix-404.patch
	patch -p1 < p310-compliance.patch
}

package() {
	cd nuxhash
	python3 setup.py install --optimize=1 --root "$pkgdir"
	install -Dm644 nuxhash/gui/icons/nuxhash.svg "$pkgdir/usr/share/pixmaps/nuxhash.svg"
	install -Dm644 ../nuxhash-gui.desktop "$pkgdir/usr/share/applications/nuxhash-gui.desktop"
}
