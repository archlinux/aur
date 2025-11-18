# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola
pkgver=4.16.1
pkgrel=2
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL-2.0-or-later')
depends=(
  'git'
  'hicolor-icon-theme'
  'python-numpy'
  'python-polib'
  'python-pyqt6'
  'python-qtpy'
)
makedepends=(
  'python-build'
  'python-installer'
#  'python-rst.linker'
  'python-setuptools-scm'
  'python-sphinx'
#  'python-sphinx-furo'
  'python-wheel'
#  'rsync'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
  'garden-tools'
  'python-pytest'
)
optdepends=(
  'python-notify2: Enables desktop notifications'
  'python-pygments: Syntax highlighting'
  'python-pyinotify: Enable file system change monitoring'
  'python-send2trash: Enables "Send to Trash" functionality'
  'tk: To use the built-in ssh-askpass handler'
)
source=("git+https://github.com/git-cola/git-cola.git#tag=v$pkgver?signed")
sha256sums=('40e5a4fd514391795c2eff4eca97fa2298e32726bd479b9fef0406b274f4ea27')
validpgpkeys=('FA41BF59C1B48E8C5F3DA61C8CE26BF4A9F606B0') # David Aguilar <davvid@gmail.com>

prepare() {
  cd "$pkgname"
  git clean -dfx
  make clean

  # Remove vendorized polib.py
  rm -v cola/polib.py
}

build() {
  cd "$pkgname"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

#  make doc
}

check() {
  cd "$pkgname"
  desktop-file-validate share/applications/*.desktop
  appstreamcli validate --no-net share/metainfo/*.appdata.xml || :

  # Run 'garden test'
  make test || :
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  make prefix=/usr DESTDIR="$pkgdir" \
    install-desktop-files \
    install-icons \
    install-htmldocs \
    install-metainfo \
    install-man

  install -Dm644 "contrib/_${pkgname}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "contrib/$pkgname-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
