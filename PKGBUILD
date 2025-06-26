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

pkgver=4.5.0
pkgrel=1
url="https://github.com/gene-git/iwinfo"

arch=(x86_64)
license=(MIT)

install='iwinfo.install'

# To build docs uncomment sphinx/texlive
# Note libcap_ng >= 0.6 provides python bindings
depends=('python>=3.13' 'libcap-ng>=0.6' 'python-capng' 'iwd')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-hatch' 'rsync'
             'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
            )
_mkpkg_depends=('python>minor' 'libcap-ng>minor')

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
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
