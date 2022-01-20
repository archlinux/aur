# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=3.12.0
pkgrel=1
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'hicolor-icon-theme' 'python-qtpy')
makedepends=('asciidoc' 'docbook-xsl' 'python-sphinx' 'rsync' 'xmlto')
checkdepends=('appstream-glib' 'desktop-file-utils' 'python-mock' 'python-pyqt5'
              'python-pytest-flake8')
optdepends=('python-pygments: syntax highlighting'
            'python-pyinotify: for inotify support'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tcl: to use the built-in ssh-askpass handler')
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('ec1167ea9a472214bf18f5537d96e137c724f3d28a85b3642f07dba35f04b24a')

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
