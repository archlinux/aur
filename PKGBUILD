pkgname=digimend-dkms-git
_pkgbase=digimend
pkgver=v6.24.g81f8c71
pkgrel=1
pkgdesc='DIGImend graphics tablet drivers for the Linux kernel'
url='https://digimend.github.io/'
license=('GPL2')
arch=('any')
source=(
    'digimend::git+https://github.com/DIGImend/digimend-kernel-drivers.git'
    'dkms.conf'
)
sha256sums=('SKIP'
            '6e15b683ec7d3bf109df77db693c2327e06f8501b6c0a47a50ad31999da2ddfd')
depends=('dkms')

pkgver() {
    cd "${srcdir}/digimend"
    git describe --tags | sed 's/-/./g'
}

package() {
    install -dm755 "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    
    # Remove dkms.conf that comes with the repo
    rm -r "${srcdir}/digimend/dkms.conf"
    # Copy the source
    cp -r "${srcdir}/digimend/"* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

    sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}
