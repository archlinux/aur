# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
pkgname=git-cola
pkgver=4.19.0
pkgrel=2
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.gitlab.io"
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
  'python-rst.linker'
  'python-setuptools-scm'
  'python-sphinx'
  'python-sphinx-furo'
  'python-wheel'
  'rsync'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
  'garden-tools'
  'python-pytest'
)
optdepends=(
  'aspell: Aspell based spell checking support'
  'hunspell: Hunspell based checking support'
  'python-notify2: Enables desktop notifications'
  'python-pygments: Syntax highlighting'
  'python-pyinotify: Enable file system change monitoring'
  'python-pyqt6-webengine'
  'python-send2trash: Enables "Send to Trash" functionality'
  'tk: Fallback built-in ssh-askpass handler'
  'x11-ssh-askpass: Default askpass credential helper'
)
source=("git+https://github.com/git-cola/git-cola.git#tag=v$pkgver?signed")
sha256sums=('36138d4ef4c71a60137465b246a8afdd987d1f035352282024eb8d0880e590f6')
validpgpkeys=('FA41BF59C1B48E8C5F3DA61C8CE26BF4A9F606B0') # David Aguilar <davvid@gmail.com>

prepare() {
  cd "$pkgname"
  git clean -dfx
  make clean

  # Remove vendorized polib.py
  rm -rv cola/polib.py extras/polib

  # Remove vendored qtpy
  rm -rv qtpy extras/qtpy
}

build() {
  cd "$pkgname"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  # Limit to 1 job to avoid build failure
  make -j1 doc
}

check() {
  cd "$pkgname"
  desktop-file-validate share/applications/*.desktop
  appstreamcli validate --no-net share/metainfo/*.appdata.xml || :

  # Use local git config
  export GIT_CONFIG_GLOBAL="$PWD/git.config"
  git config --global init.defaultBranch main
  git config --global user.name "Git Cola"
  git config --global user.email "git-cola@localhost"
  make test
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  make prefix=/usr DESTDIR="$pkgdir" \
    install-desktop-files \
    install-icons \
    install-htmldocs \
    install-metainfo

  # Don't rebuild man pages & docs
  make -C docs -o man prefix=/usr DESTDIR="$pkgdir" install-man
  make -C docs -o html prefix=/usr DESTDIR="$pkgdir" install-html

  install -Dm644 "contrib/_${pkgname}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "contrib/$pkgname-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
