# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=4.0.2
pkgrel=4
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'hicolor-icon-theme' 'python-numpy' 'python-pyqt5' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-jaraco.packaging'
             'python-rst.linker' 'python-setuptools-scm' 'python-sphinx' 'python-wheel')
#checkdepends=('appstream-glib' 'desktop-file-utils' 'python-pytest-flake8')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('python-pygments: syntax highlighting'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tcl: to use the built-in ssh-askpass handler')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
        'https://github.com/git-cola/git-cola/commit/8f0f22e2adc7dfb09a75879fab9bb5404d33d561.patch')
sha256sums=('b5692841002895bfb2a42be5c8352dbeb454b26f267f56e15d9888e57de0a1b4'
            'SKIP'
            'a0599494f83316bcdd5af2fd7620f10079248a0a061a009e7456579732ee46ce')
validpgpkeys=('FA41BF59C1B48E8C5F3DA61C8CE26BF4A9F606B0') # David Aguilar <davvid@gmail.com>

prepare() {
  cd "$pkgname-$pkgver"

  # https://github.com/git-cola/git-cola/issues/1263
  patch -Np1 -i ../8f0f22e2adc7dfb09a75879fab9bb5404d33d561.patch
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation

#  make prefix=/usr doc man
  make prefix=/usr man
}

check() {
  cd "$pkgname-$pkgver"

  # Run the unit tests
#  GIT_CONFIG_NOSYSTEM=true LC_ALL="C.utf8" \
#    make test

  desktop-file-validate share/applications/*.desktop
  appstream-util validate-relax --nonet share/metainfo/*.appdata.xml
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

#  make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-man}
  make prefix=/usr DESTDIR="$pkgdir" install-man
}
