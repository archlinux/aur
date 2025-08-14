# Maintainer:  Michael           (https://aur.archlinux.org/account/michael_wzq)
# Contributor: noideaman         (https://aur.archlinux.org/account/noideaman)
# Contributor: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi             <me@brodi.space>
# shellcheck disable=SC2034,SC2154

_plugin=file-sharing
_pkgrel=1
pkgname="cockpit-${_plugin}"
pkgver="4.2.14"
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
    "git+https://github.com/45Drives/cockpit-file-sharing.git#commit=b1b03296792f5c86f6cd77fbd172d82e8101e0e3"
    "git+https://github.com/45Drives/houston-common.git#commit=b550603ae3df6e8d884f2d748298a172e7d47257"
)
b2sums=('e706f3397639516b957cff03a0156fca13c3ddfd82f729f262f82ed3fef7f1575d3f92ac42b160c52cbd163598028a594e9bb4024ff47d29cf138ee580017a7f'
        '5f16cded4b5c6fcfd11cb2e743f050356f9abfd0681e654d576ab3038d648313e05f28cfac6909f941a03878229c0755eaa782a05c8afab1f8b4ebaf6d6f2dd7')

prepare() {
    cd "$pkgname" || exit 1
    git submodule init
    git config submodule.houston-common.url "$srcdir/houston-common"
    git -c protocol.file.allow=always submodule update
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    make DESTDIR="$pkgdir/"
    make DESTDIR="$pkgdir/" install RESTART_COCKPIT=1
}

