# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=4.5.0
pkgrel=1
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL-2.0-or-later')
depends=(
  'git'
  'hicolor-icon-theme'
  'python-numpy'
  'python-polib'
  'python-pyqt5'
  'python-qtpy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-rst.linker'
  'python-setuptools-scm'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
  'rsync'
)
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=(
  'python-pygments: syntax highlighting'
  'python-pyinotify: file system change monitoring'
  'python-send2trash: enables "Send to Trash" functionality.'
  'tk: to use the built-in ssh-askpass handler'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz"
        '0001-Unvendorize-polib.py.patch')
sha256sums=('f8baaf6e168d605bf087e6ef77137089d9f01ea13f7947bb31cc7ac58e5aa248'
            'ffeaafbf1495931d3ab5cee439a82bef340d9cb15d4d555a57e93aed47695fc9')

prepare() {
  cd "$pkgname-$pkgver"

  # Remove vendorized polib.py
  patch -Np1 -i ../0001-Unvendorize-polib.py.patch
  rm cola/polib.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation

#  make prefix=/usr doc
  make prefix=/usr man
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate share/applications/*.desktop
  appstream-util validate-relax --nonet share/metainfo/*.appdata.xml

  # Run the unit tests
#  GIT_CONFIG_NOSYSTEM=true LC_ALL="C.UTF-8" make test V=2
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

#  make prefix=/usr DESTDIR="$pkgdir" install-doc
  make prefix=/usr DESTDIR="$pkgdir" install-man

  install -Dm644 "contrib/_${pkgname}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "contrib/$pkgname-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
