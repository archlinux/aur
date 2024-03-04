# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=4.6.1
pkgrel=1
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL-2.0-or-later')
depends=(
  'git'
  'hicolor-icon-theme'
  'python-importlib-metadata'
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
  'python-sphinx-furo'
  'python-sphinx_rtd_theme'
  'python-wheel'
  'rsync'
)
checkdepends=('appstream' 'desktop-file-utils')
optdepends=(
  'python-pygments: syntax highlighting'
  'python-pyinotify: file system change monitoring'
  'python-send2trash: enables "Send to Trash" functionality.'
  'tk: to use the built-in ssh-askpass handler'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-cola/git-cola/archive/v$pkgver.tar.gz")
sha256sums=('665019bc23f794d4f9f796bb7ee8e666ed13c9c3a1848fe37fb3541a0a143a64')

prepare() {
  cd "$pkgname-$pkgver"

  # Remove vendorized polib.py
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
  appstreamcli validate --no-net share/metainfo/*.appdata.xml || :

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
