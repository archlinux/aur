#
# Arch Linux PKGBUILD for wg-client
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg-client'
pkgdesc='Wireguard linux client (command line and gui)'
_gitname='wg-client'

pkgver=6.10.1
pkgrel=1
url="https://github.com/gene-git/wg-client"

arch=(x86_64)
license=(MIT)

install='wg-client.install'

# To build docs uncommont sphinx/texlive
depends=('python>=3.13' 'python-pyqt6' 'hicolor-icon-theme' 'python-psutil' 'python-dateutil' 
         'python-netifaces' 'libcap' 'python-pynotify' 'openssl>=3.0')
makedepends=('git' 'python-build' 'python-wheel'  'python-installer' 'python-hatch' 'rsync'
             #'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
            )
# Used by package : mkpkg
_mkpkg_depends=('python>minor')

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

changelog="Changelog"

prepare() {
    cd "${_gitname}"

    # To build Docs 
    # uncomment these and sphinx makedepends above
    # --------------
    # echo "Build docs"
    # cd ./Docs
    # make html
    # make latexpdf
}

build() {
    cd "${_gitname}"

    echo 'Building python'
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation

    echo 'Building C-code'
    cd ./src/wg_client/fix-resolv/
    make
}

package() {
    cd "${_gitname}"
    #cp Docs/Changelog.rst ${startdir}
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:

