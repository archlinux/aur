# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola-git
_pkgname=git-cola
pkgver=4.3.2.r117.g51c241a8
pkgrel=1
pkgdesc="A powerful GUI for Git"
arch=('any')
url="http://git-cola.github.com/"
license=('GPL')
depends=('git' 'hicolor-icon-theme' 'python-numpy' 'python-polib' 'python-pyqt5' 'python-qtpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm'
             'python-sphinx' 'python-jaraco.packaging' 'python-rst.linker'
             'rsync')
checkdepends=('python-pytest' 'desktop-file-utils' 'appstream-glib')
optdepends=('python-pyinotify: for inotify support'
            'python-pygments: syntax highlighting'
            'python-send2trash: enables "Send to Trash" functionality'
            'tk: to use the built-in ssh-askpass handler')
provides=('git-cola')
conflicts=('git-cola')

source=("$_pkgname::git+https://github.com/git-cola/git-cola.git"
        "0001-Unvendorize-polib.py.patch")
sha512sums=('SKIP'
            '4cf5664dab0fe10ad46bf98cd31874e5e03da8b9c35caa86e080e8c8e4814f2b0aab666bd9798f533765c69b8de4fbaf8d7c7bedf9f3b7435c9e3e9bfd814fb1')

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

    make prefix=/usr doc
}

check() {
    cd "$_pkgname"

    # Run the unit tests
    GIT_CONFIG_NOSYSTEM=true LC_ALL="C.UTF-8" \
        make test \
            flags="-k 'not test_stash_info'"  # failing tests

    desktop-file-validate share/applications/*.desktop
    appstream-util validate-relax --nonet share/metainfo/*.appdata.xml
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    make prefix=/usr DESTDIR="$pkgdir" install-doc

    install -Dm644 "contrib/_${_pkgname}" -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 "contrib/${_pkgname}-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
