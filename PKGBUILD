#
# Arch Linux PKGBUILD for iwinfo 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='iwinfo'
pkgdesc='Provide wifi information about capabilities and network(s)'
_gitname='iwinfo'

pkgver=2.0.5
pkgrel=1
url="https://github.com/gene-git/iwinfo"

arch=(x86_64)
license=(MIT)

install='iwinfo.install'

# To build docs uncomment sphinx/texlive
depends=('python>3.10' 'libcap-ng' 'python-prctl')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-hatch' 'rsync'
             'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
            )
_mkpkg_depends=('python>minor' 'libcap-ng>minor')

source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

touch "Changelog.rst"
changelog="Changelog.rst"

build() {
    cd "${_gitname}"
    echo 'Building python'
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation

    echo 'Building C'
    cd src/ambient
    make

    # To build Docs
    # uncomment below  and sphinx makedepends above
    # -------------
    # echo "Build docs"
    # cd ./Docs
    # make html
    # make latexpdf
}

package() {
    cd "${_gitname}"
    git fetch --all
    git checkout origin/master -- Docs/Changelog.rst
    cp Docs/Changelog.rst ${startdir}

    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
