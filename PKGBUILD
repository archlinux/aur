# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Paul Weingardt <paulweingardt@web.de>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola-git
_pkgname=git-cola
pkgver=4.9.0.r0.g69f06128
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
)
makedepends=(
  'rsync'
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
)
optdepends=(
  'python-notify2: desktop notifications'
  'python-pygments: syntax highlighting'
  'python-pyinotify: file system change monitoring'
  'python-send2trash: "Send to Trash" functionality'
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
  '0001-Unvendorize-polib.py.patch'
)
sha256sums=('SKIP'
            '8b03cf1cfc283917b6926d9d829d1f48b659c749cf118a357a1e653f1335f831')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$_pkgname"

  # Remove vendorized polib.py
  git apply -3 ../0001-Unvendorize-polib.py.patch
  git rm -rf cola/polib.py extras/polib
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
  GIT_CONFIG_NOSYSTEM=true LC_ALL="C.UTF-8" make test V=2
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
