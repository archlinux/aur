pkgname=ntfs3-dkms-git
pkgver=6.4.r0.g6995e2d
pkgrel=1
epoch=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS versions up to 3.1."
arch=('any')
url="https://github.com/Paragon-Software-Group/linux-ntfs3"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('NTFS3-MODULE' 'ntfs3')
conflicts=('ntfs3')
options=('!strip' '!emptydirs')

source=(
    "dkms.conf"
    "Makefile.patch"
)

sha256sums=(
    '5c9b5ff6732f562e1bd7bbca8b662a162e8d6e177bfd9d66378a541ba8c078ea'
    'fd4cf0e2dc160efecc55d4ea99667669b870599e4e81be435ec2201381b7e2ac'
)

_ver="6.4"
_since="1687735798"

# The whole kernel history is very huge, so downloading it is a pain.
# Also commits count is insane and we don't want to see all that in pkgver.
# Here is a tricky workaround.
# Make a shallow clone since the specified timestamp.

pkgver() {
    cd "repo"

    local rev sha
    rev=$(("$(git rev-list --count HEAD)" - 1))
    sha="$(git rev-parse HEAD)"

    echo "${_ver}.r${rev}.g${sha:0:7}"
}

prepare() {
    if [ ! -d "repo" ]; then
        git clone --shallow-since="${_since}" --filter=tree:0 --no-checkout --single-branch "${url}" "repo"
    fi

    cd "repo"
    git fetch -f
    git sparse-checkout set --no-cone "/fs/ntfs3"
    git reset --hard FETCH_HEAD

    cd "fs/ntfs3"
    patch -i "${srcdir}/Makefile.patch"
}

package() {
    local dest="${pkgdir}/usr/src/ntfs3-${_ver}"
    install -Dm644 -t "${dest}" "${source[0]}"
    cp -rpT "repo/fs/ntfs3" "${dest}"
}
