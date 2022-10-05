pkgname=ntfs3-dkms-git
pkgver=6.0.r0.gf76349c
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
    "Makefile.patch"
    "dkms.conf"
)

sha256sums=(
    'fd4cf0e2dc160efecc55d4ea99667669b870599e4e81be435ec2201381b7e2ac'
    '87ec3e1fdd50c2218eb93aa73fbcaa018275c12ea2ee6648b815e57207d2e132'
)

_ver="6.0"
_since="1664139662"

# The whole kernel history is very huge, so downloading it is a pain.
# Also commits count is insane and we don't want to see all that in pkgver.
# Here is a tricky workaround.
# Make a shallow clone since the specified timestamp.

pkgver() {
    cd "${srcdir}/repo"

    local rev
    rev=$(("$(git rev-list --count HEAD)" - 1))
    local sha
    sha="$(git rev-parse HEAD)"

    echo "${_ver}.r${rev}.g${sha:0:7}"
}

prepare() {
    cd "${srcdir}"

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
    local src="${pkgdir}/usr/src"
    install -dm755 "${src}"

    cd "${srcdir}"
    local dest="${src}/ntfs3-${_ver}"
    cp -r "repo/fs/ntfs3" "${dest}"
    install -Dm644 -t "${dest}" "dkms.conf"
}
