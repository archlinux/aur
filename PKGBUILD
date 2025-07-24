# Maintainer:  Michael           (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi             <me@brodi.space>
# shellcheck disable=SC2034,SC2154

_plugin=file-sharing
_pkgrel=3
pkgname="cockpit-${_plugin}"
pkgver="4.2.13"
pkgrel=1
pkgdesc="A Cockpit plugin to easily manage samba and NFS file sharing."
arch=("any")
url="https://github.com/45Drives/cockpit-file-sharing"
license=("GPL-3.0-only")
depends=("cockpit" "python")
optdepends=("samba" "nfs-utils")
makedepends=(
    "git"
    "jq"
    "make"
    "moreutils"
    "yarn"
)
provides=("$pkgname")
#source=("${url}/archive/refs/tags/v${pkgver}-${_pkgrel}.tar.gz")
source=(
    "git+https://github.com/45Drives/cockpit-file-sharing.git#commit=d4c26106fc875a700343abbd45f56fcbfe5c3103"
    "git+https://github.com/45Drives/houston-common.git#commit=b550603ae3df6e8d884f2d748298a172e7d47257"
)
b2sums=('da6f9d6918c3d7a46439d49ec3f7c566977c92e032e02a0668cebc10de71a130f184d4eb7c85e46091bf6bd4fc4b2a2e08f7bde9018c021be126704ea3186a42'
        '5f16cded4b5c6fcfd11cb2e743f050356f9abfd0681e654d576ab3038d648313e05f28cfac6909f941a03878229c0755eaa782a05c8afab1f8b4ebaf6d6f2dd7')

prepare() {
    cd "$pkgname" || exit 1
    git submodule init
    git config submodule.houston-common.url "$srcdir/houston-common"
    git -c protocol.file.allow=always submodule update
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    make DESTDIR="$pkgdir/" install RESTART_COCKPIT=1
}

