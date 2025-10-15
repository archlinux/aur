#
# Arch Linux PKGBUILD for nginx-passwd 
# This builds the latest release tag.
# git HEAD is also well tested.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='nginx_passwd'
pkgdesc='Basic Auth Password File Manager for nginx'
_gitname='nginx_passwd'

pkgver=3.0.1
pkgrel=1
url="https://github.com/gene-git/nginx_passwd"

arch=(any)
license=(MIT)

depends=(
    'python>=3.13'
    'python-passlib'
    'python-bcrypt'
    'python-argon2_cffi'
    'python-cryptography'
)

# To build docs uncommont sphinx/texlive
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatch' 'rsync'
              #'python-sphinx' 'texlive-latexextra' 
            )
checkdepends=('python-pytest' 'python-pytest-asyncio')
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

build() {
    cd "${_gitname}"
    /usr/bin/rm -f dist/*
    /usr/bin/python -m build --wheel --no-isolation
    # To build Docs - uncomment these and sphinx makedepends above
#    echo "Build docs"
#    cd ./Docs
#    make html
#    make latexpdf
}

check() {
    cd "${_gitname}"/tests
    PYTHONPATH="../src/nginx_passwd" pytest
}

package() {
    cd "${_gitname}"
    ./scripts/do-install ${pkgdir}
}
# vim:set ts=4 sts=4 sw=4 et:
