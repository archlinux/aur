#
# Arch Linux PKGBUILD for wg-client
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='wg-client'
pkgdesc='Linux Wireguard client (command line and gui)'
_gitname='wg-client'

pkgver="7.3.0"
pkgrel=1
url="https://github.com/gene-git/wg-client"

arch=(x86_64)
license=(GPL-2.0-or-later)

install='wg-client.install'

# To build docs uncommont sphinx/texlive
depends=(
    'python>=3.13' 
    'python-psutil' 
    'python-dateutil' 
    'pyconcurrent'
    'libcap' 
    'python-pynotify' 
    'openssl>=3.0'
    'bash'
    'glibc'
)
makedepends=(
    'git'
    'uv'
    'python-uv-build'
    'rsync'
    #'python-sphinx' 'python-myst-parser' 'texlive-latexextra'
)
# Used by package : mkpkg
_mkpkg_depends=(
    'python>minor'
    'libcap>minor'
    'openssl>minor'
    'python-psutil>minor'
    'python-pynotify>minor'
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C <arch@sapience.com>

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

changelog="Changelog"

prepare() {
    cd "${_gitname}"
}

build() {
    cd "${_gitname}"

    echo 'Building python'
    /usr/bin/rm -f dist/*
    /usr/bin/uv build --wheel --no-build-isolation

    echo 'Building C-code'
    pushd ./src/c-code/fix-resolv/ >/dev/null
    make
    popd >/dev/null

    echo 'Building Docs'
    #    pdf='wg-client.pdf'
    #    cd ./Docs
    #    make latexpdf >/dev/null 2>&1
    #    make latexpdf >/dev/null
    #    /usr/bin/rm -f $pdf
    #    /usr/bin/cp _build/latex/$pdf .
    #    make html
    #    make html
    #    /usr/bin/rm -rf _build/doctrees _build/latex
}

package() {
    cd "${_gitname}"
    depends+=(
        'python-pyqt6' 
        'hicolor-icon-theme'
    )
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:

