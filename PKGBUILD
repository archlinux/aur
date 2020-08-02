# Maintainer: gardenapple <gardenapple@posteo.net>
# Contributor: katt <magunasu.b97@gmail.com>

pkgname=fahcontrol-gtk3-git
pkgver=r156.7ae5c23
pkgrel=1
pkgdesc='Graphical monitor and control utility for the Folding@home client (python3/GTK3 fork)'
url='https://foldingathome.org'
arch=('any')
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3')
makedepends=('python-setuptools' 'git')
optdepends=('fahviewer: 3D simulation viewer')
provides=('fahcontrol')
conflicts=('fahcontrol')
source=("${pkgname}::git+https://github.com/cdberkstresser/fah-control.git"
        "fahcontrol-icon-path-linux.patch")
sha256sums=('SKIP'
            '1ca22992df83904d8a3a1049138a3022409ab877d73be0eaedf77c40e55d4c39')

pkgver() {
	cd "$pkgname"

	# Number of revisions since beginning of the history: 
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# This patch is a hack, not cross-platform at all
	# (I know nothing about Python or GTK so this is the best I can do for now)
	patch "${pkgname}/fah/FAHControl.py" fahcontrol-icon-path-linux.patch || true
}

build() {
	cd "${pkgname}"
	python setup.py build
}

package() {
	cd "${pkgname}"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 FAHControl.desktop -t "${pkgdir}"/usr/share/applications
}
