# Maintainer:  Michael           (https://aur.archlinux.org/account/michael_wzq)
# Contributor: noideaman         (https://aur.archlinux.org/account/noideaman)
# Contributor: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi             <me@brodi.space>
# shellcheck disable=SC2034,SC2154

_plugin=file-sharing
_pkgrel=2
pkgname="cockpit-${_plugin}"
pkgver="4.5.7"
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
    "git+https://github.com/45Drives/cockpit-file-sharing.git#commit=b76244460397de627ce8f39d5d2bebcb2a9e83e6"
    "git+https://github.com/45Drives/houston-common.git#commit=5322e0d91305fe9ebb2413e8913dfda120e1da5a"
)
b2sums=('fcb6de4a7c1d25a2abb79f0fbe34512d3e6b048885666bbcaf99d38e450cfd072fef3029abdd09c577f029a51be239d72c26719cd9d7524754c1544f5a97609d'
        '2dd753b7d8e676c6fe2ab948f161415708027f0c2095e552f9bc006e51bee2f8f29db8c5928b941b883d69194a3a2b44b9ef33b146f6985486e8b857c8de91e8')

prepare() {
    cd "$pkgname" || exit 1
    git submodule init
    git config submodule.houston-common.url "$srcdir/houston-common"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    make DESTDIR="$pkgdir/"
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    make DESTDIR="$pkgdir/" install RESTART_COCKPIT=1
}

