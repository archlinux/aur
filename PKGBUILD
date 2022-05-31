pkgname=ntfs3-dkms-git
pkgver=5.18.r1.gf26967b
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
    '82e2d9cc730188973d6c5ed91736373e5afbba74f7a73003dd38761800ac8bd9'
)

_ver="5.18"
_since="1653249151"

# The whole kernel history is very huge, so downloading it is a pain.
# Also commits count is insane and we don't want to see all that in pkgver.
# Here is a tricky workaround.
# Make a shallow clone since the specified timestamp.

pkgver() {
    cd "${srcdir}/repo"
    local rev=$(git rev-list --count HEAD)
    local sha=$(git rev-parse HEAD)
    echo "${_ver}.r$((rev - 1)).g${sha:0:7}"
}

prepare() {
    cd "${srcdir}"

    if [ ! -d "repo" ]; then
        git clone --shallow-since="${_since}" --filter=tree:0 --no-checkout --single-branch "${url}" "repo"
    fi

    cd "repo"
    git fetch -f
    git sparse-checkout set "/fs/ntfs3"
    git reset --hard FETCH_HEAD

    cd "fs/ntfs3"
    patch -i "${srcdir}/Makefile.patch"
}

package() {
    local dest="${pkgdir}/usr/src/ntfs3-${_ver}"
    install -dm755 "${dest}"

    cd "${srcdir}"
    install -Dm644 -t "${dest}" "dkms.conf"

    cd "repo/fs/ntfs3"
    cp -rt "${dest}" *
}
