# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.10.1
pkgrel=1
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'python-qtpy' 'python-pyqt5' 'hicolor-icon-theme')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx')
optdepends=('python-pygments: syntax highlighting'
            'python-pyinotify: for inotify support'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tcl: to use the built-in ssh-askpass handler')
checkdepends=('python-pytest-flake8' 'python-mock' 'desktop-file-utils' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('1d7a9be54e66fcaa49585cda3ec89b6b2448f6e38c6f41047e55ecaff2d809d3')

build() {
	cd "$pkgname-$pkgver"
	export USE_ENV_PYTHON=1
	export GIT_COLA_NO_PRIVATE_LIBS=1
	export GIT_COLA_NO_VENDOR_LIBS=1
	make prefix=/usr all doc man
}

check() {
	cd "$pkgname-$pkgver"

	# Run the unit tests
	make test

	desktop-file-validate share/applications/*.desktop
	appstream-util validate-relax --nonet share/metainfo/*.appdata.xml
}

package() {
	cd "$pkgname-$pkgver"
	export USE_ENV_PYTHON=1
	export GIT_COLA_NO_PRIVATE_LIBS=1
	export GIT_COLA_NO_VENDOR_LIBS=1
	export PYTHONHASHSEED=0
	make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-man}
}
