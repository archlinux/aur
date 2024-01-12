# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Paul Weingardt <paulweingardt@web.de>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola-git
_pkgname=git-cola
pkgver=4.4.1.r58.g5a33a788
pkgrel=1
pkgdesc="The highly caffeinated Git GUI"
arch=('any')
url="https://git-cola.github.io"
license=('GPL2')
depends=('git' 'hicolor-icon-theme' 'python-numpy' 'python-polib' 'python-pyqt5'
         'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-jaraco.packaging'
             'python-rst.linker' 'python-setuptools-scm' 'python-sphinx'
             'python-sphinx_rtd_theme' 'python-wheel' 'rsync' 'git')
checkdepends=('appstream-glib' 'desktop-file-utils' 'python-pytest')
optdepends=('python-pygments: syntax highlighting'
            'python-pyinotify: file system change monitoring'
            'python-send2trash: enables "Send to Trash" functionality.'
            'tk: to use the built-in ssh-askpass handler')
provides=('git-cola')
conflicts=('git-cola')
source=("$_pkgname::git+https://github.com/git-cola/git-cola.git"
        '0001-Unvendorize-polib.py.patch')
sha256sums=('SKIP'
            '00db8356a4bc6f1d9dade64ab04b6f8bada2df22b246e21551ce925de9f95625')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$_pkgname"

  # Remove vendorized polib.py
  patch -Np1 -i ../0001-Unvendorize-polib.py.patch
  rm cola/polib.py
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation

  # sphinx (or, rather, rtd.linker) races against itself, leading to a spurious ENOENT
  make -j1 prefix=/usr doc
}

check() {
  cd "$_pkgname"

  desktop-file-validate share/applications/*.desktop
  appstream-util validate-relax --nonet share/metainfo/*.appdata.xml

  # Run the unit tests
  GIT_CONFIG_NOSYSTEM=true LC_ALL="C.UTF-8" make test V=2
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # `make -C docs` is used instead of `make install-doc` to specify
  # `-o man -o html` (do not remake docs, we just built them)
  #make install-doc
  make -C docs -o man -o html prefix=/usr DESTDIR="$pkgdir" install

  install -Dm644 "contrib/_${_pkgname}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "contrib/${_pkgname}-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
}
