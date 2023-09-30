# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=4.3.2
pkgrel=2
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'hicolor-icon-theme' 'python-numpy' 'python-polib' 'python-pyqt5'
         'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-jaraco.packaging'
             'python-rst.linker' 'python-setuptools-scm' 'python-sphinx'
             'python-wheel' 'rsync')
checkdepends=('appstream-glib' 'desktop-file-utils' 'python-pytest')
optdepends=('python-pygments: syntax highlighting'
            'python-pyinotify: file system change monitoring'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tk: to use the built-in ssh-askpass handler')
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz"
        '0001-Unvendorize-polib.py.patch')
sha256sums=('8f4f91e3cf7a4dd951c8c7b3d10d4461e1b367c68136af87c34be6cf0f2825ab'
            '00db8356a4bc6f1d9dade64ab04b6f8bada2df22b246e21551ce925de9f95625')

prepare() {
  cd "$pkgname-$pkgver"

  # Remove vendorized polib.py
  patch -Np1 -i ../0001-Unvendorize-polib.py.patch
  rm cola/polib.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation

  make prefix=/usr doc
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate share/applications/*.desktop
  appstream-util validate-relax --nonet share/metainfo/*.appdata.xml

  # Run the unit tests
  GIT_CONFIG_NOSYSTEM=true LC_ALL="C.UTF-8" make test V=2
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  make prefix=/usr DESTDIR="$pkgdir" install-doc

  install -Dm644 "contrib/_${pkgname}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "contrib/$pkgname-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
