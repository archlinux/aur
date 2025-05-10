# Maintainer:  Michael           <https://aur.archlinux.org/account/michael_wzq>
# Contributor: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi             <me@brodi.space>
# shellcheck disable=SC2034,SC2154

_plugin=file-sharing
_pkgrel=3
pkgname="cockpit-${_plugin}"
pkgver="4.2.10"
pkgrel=2
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
    "git+${url}.git#commit=2e509cfc8b1ae16c7c7a0cdc8d6f51636505c779"
    "git+https://github.com/45Drives/houston-common.git#commit=7921c2120e992569307c14e4c9e0089df10ce686"
)
b2sums=('db143fbf598af868b13cd6c9d9a234b309585aea557f6e381d5815e8bdc82d1557a9538eda2dbc708df2b693c745fc25fdc9655badcdacf55b3634df58f36d35'
        '7371ec80b3afc7f347cf7c9c3217bdc3c5493fc2a1dd6a2883f6a86e9887612f662c7ad705875f07f60729d45a55fc37fe37b267888d91688e5656325b2ac9e8')

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

