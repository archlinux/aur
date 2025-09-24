# Maintainer:  Michael           (https://aur.archlinux.org/account/michael_wzq)
# Contributor: noideaman         (https://aur.archlinux.org/account/noideaman)
# Contributor: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi             <me@brodi.space>
# shellcheck disable=SC2034,SC2154

_plugin=file-sharing
_pkgrel=2
pkgname="cockpit-${_plugin}"
pkgver="4.3.2"
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
    "git+https://github.com/45Drives/cockpit-file-sharing.git#commit=1b65cafc9592f556d28740fbdaf6324a899c7539"
    "git+https://github.com/45Drives/houston-common.git#commit=efc71c7f15af30e1e7d5c06dadc8b12ccc76206c"
)
b2sums=('4f55a54123d0a35f16128fdb45070cdc92c08ddffcaf2826a053114c1c41d3f2ad6d43fbdb46b23c603b451b5a7a55ec698071c1c6c3b0e3e6d7d585f02b5c42'
        'a5a568cd5aa23bb9772266643d4b5a2546c5193b2759bd95ae8c0100c2c1b22a81d5f2e9e355b684be386dd8566ce420fd9f45ba944a0cddb77bcd266d2e4663')

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

