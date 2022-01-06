# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.11.0
pkgrel=1
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'python-qtpy' 'hicolor-icon-theme')
makedepends=('asciidoc' 'docbook-xsl' 'python-sphinx' 'rsync' 'xmlto')
optdepends=('python-pygments: syntax highlighting'
            'python-pyinotify: for inotify support'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tcl: to use the built-in ssh-askpass handler')
checkdepends=('appstream-glib' 'desktop-file-utils' 'python-mock' 'python-pyqt5'
              'python-pytest-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('5f14ab41508ee9c8756097d6fa81f471fce58089b178317cc25d948d42620994')

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
  make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-man}
}
