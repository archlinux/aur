# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.9
pkgrel=1
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'python-pyqt5' 'hicolor-icon-theme')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx')
optdepends=('python-pygments: syntax highlighting'
            'python-pyinotify: for inotify support'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tcl: to use the built-in ssh-askpass handler')
checkdepends=('python-pytest' 'python-mock' 'desktop-file-utils' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('66b62f479ad141322351d62aff76e4882719d08f8f29b35f97d30f355391a54e')

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
