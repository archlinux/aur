# Maintainer:  Michael           (https://aur.archlinux.org/account/michael_wzq)
# Contributor: noideaman         (https://aur.archlinux.org/account/noideaman)
# Contributor: Bradley O'Connell <bradleyocon@gmail.com>
# Contributor: Brodi             <me@brodi.space>
# shellcheck disable=SC2034,SC2154

_plugin=file-sharing
_pkgrel=2
pkgname="cockpit-${_plugin}"
pkgver="4.3.1"
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
    "git+https://github.com/45Drives/cockpit-file-sharing.git#commit=0a954dde193b7d192ccb41ea60fe232908853b09"
    "git+https://github.com/45Drives/houston-common.git#commit=ce261b32117d1b483f3677d328c51807510bcd1e"
)
b2sums=('647bb113a7ba9bb4c5ab6923d80e84f51b192dfc837d50a49eaeb41d303dcd3509df2da37d9e57f3268c2daf0cf5cf377d2c24d3c4bee0905075b94e158a525f'
        '64770107f1d2c525d069a5e6204178b2fa2941a90d721c620323d174d2344c79a2da786dcc90f8206ad518298180ca5274a29f5c0754be905a2be9d22dc1d835')

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

