pkgname=ntfs3-dkms-git
pkgver=6.5.r0.g44b4494
pkgrel=1
epoch=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver. The driver works with NTFS versions up to 3.1."
arch=('any')
_repo='linux-ntfs3'
url="https://github.com/Paragon-Software-Group/${_repo}"
license=('GPL2')
depends=('dkms')
makedepends=('git')
provides=('NTFS3-MODULE' 'ntfs3')
conflicts=('ntfs3')
options=('!strip' '!emptydirs')

source=(
    "git+${url}"
    "dkms.conf"
    "Makefile.patch"
)

sha256sums=(
    'SKIP'
    '1f44f85635ecfb08f8d99fcd8a4e2e7991865fc7d1431ea1e5af69a2a5fec4e3'
    '89f89a217af207091534ffe14db2634604809397f1a65420ce6048e7d87e834f'
)

pkgver() {
    cd "${_repo}"
    git describe --long --tags --abbrev=7 | sed 's/^ntfs3_for_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_repo}"
    patch -p0 -i "${srcdir}/Makefile.patch"
}

package() {
    local dest="${pkgdir}/usr/src/ntfs3-${pkgver}"
    install -Dm644 -t "${dest}" "dkms.conf"
    sed -i "s/@PKGVER@/${pkgver}/" "${dest}/dkms.conf"

    cd "${_repo}"
    cp -rpT "fs/ntfs3" "${dest}"
}
