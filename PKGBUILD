# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Paul Weingardt <paulweingardt@web.de>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola-git
_pkgname=git-cola
pkgver=4.19.0.r99.ged6845a6
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
  'python-pyqt6'
  'python-qtpy'
  'qt6-svg'
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
  #'appstream-glib'
  'desktop-file-utils'
  'garden-tools'
  'python-pytest'
  'python-msgpack'
  'python-websockets'
)
optdepends=(
  'python-notify2: desktop notifications'
  'python-pygments: syntax highlighting'
  'python-pyinotify: file system change monitoring'
  'python-send2trash: "Send to Trash" functionality'
  'python-msgpack: server functionality'
  'python-websockets: server functionality'
  'tk: to use the built-in ssh-askpass handler'
)
provides=(
  'git-cola'
)
conflicts=(
  'git-cola'
)
source=(
  "${_pkgname}::git+https://github.com/git-cola/git-cola.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$_pkgname"

  # Remove vendorized polib.py
  git rm -rf cola/polib.py extras/polib
  # Remove vendored qtpy
  git rm -rf qtpy extras/qtpy
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation

  # sphinx (or, rather, rtd.linker) races against itself, leading to a spurious ENOENT
  make -j1 doc
}

check() {
  cd "$_pkgname"

  desktop-file-validate share/applications/*.desktop
  appstreamcli validate --no-net share/metainfo/*.appdata.xml || :
  #appstream-util validate-relax --nonet share/metainfo/*.appdata.xml

  # Run the unit tests
  (
  unset "${!GIT_@}"
  GIT_CONFIG_SYSTEM=/dev/null \
  GIT_CONFIG_GLOBAL=/dev/null \
  LC_ALL="C.UTF-8" make test V=2
  )
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  make prefix=/usr DESTDIR="$pkgdir" install-desktop-files
  make prefix=/usr DESTDIR="$pkgdir" install-icons
  make prefix=/usr DESTDIR="$pkgdir" install-htmldocs
  make prefix=/usr DESTDIR="$pkgdir" install-metainfo
  # `make -C docs` is used here to be able to specify `-o {man,html}`
  # (do not remake docs, we just built them)
  #make prefix=/usr DESTDIR="$pkgdir" install-man
  #make prefix=/usr DESTDIR="$pkgdir" install-html
  make -C docs -o man prefix=/usr DESTDIR="$pkgdir" install-man
  make -C docs -o html prefix=/usr DESTDIR="$pkgdir" install-html

  install -Dm644 "contrib/_${_pkgname}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "contrib/${_pkgname}-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
}
