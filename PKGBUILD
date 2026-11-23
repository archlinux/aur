# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Nicolas Pouillard [https://nicolaspouillard.fr]
# Contributor: seschwar -- contact via Arch Linux forum or AUR
# Contributor: Ian Denhardt <ian@zenhack.net>
# Contributor: Joakim Reinert <mail+aur@jreinert.com>
# Contributor: Dylan Baker <dylan@pnwbakers.com>
# Maintainer: thegala <thegala at disroot dot org>

_gitname=alot
pkgname=alot-git
pkgrel=1
pkgver=r4055.cded4c37
pkgdesc="terminal-based MUA for the notmuch mail system"
arch=(any)
url="https://github.com/pazz/alot"
license=('GPL-3.0-or-later')
depends=(notmuch
         python
         python-gpgme
         python-magic
         python-configobj
         python-urwid
         python-urwidtrees
         python-standard-mailcap)
makedepends=(python-build python-installer python-wheel python-setuptools python-setuptools-scm python-sphinx git)
optdepends=(python-service-identity)
provides=(alot)
conflicts=(alot)
options=(!emptydirs !strip libtool staticlibs zipman)
source=('git+https://github.com/pazz/alot.git')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"

    # The archlinux package python-magic's egg calls itself
    # "file-magic", as opposed to the python-magic on pypi. The
    # result is that the alot executable can't find the module, so we patch
    # setup.py to fix the dependency:
    sed -i -e 's/python-magic/file-magic/' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_gitname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    PYTHONPATH="$pkgdir$(python -c 'import site; print(site.getsitepackages()[0])')" \
        make SPHINXBUILD=sphinx-build PYTHON=python -C docs man html

    # Delete tests
    rm -rvf "$pkgdir/usr/lib/python3.6/site-packages/tests"

    # Install extra data
    install -Dm644 extra/completion/alot-completion.zsh \
        "$pkgdir/usr/share/zsh/functions/_alot"
    install -dm755 "$pkgdir/usr/share/alot/themes"
    install -Dm644 extra/themes/{mutt,solarized_light,solarized_dark,sup,tomorrow} \
        "${pkgdir}/usr/share/alot/themes"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a docs/build/html/* "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 docs/build/man/alot.1 "$pkgdir/usr/share/man/man1/alot.1"
}
