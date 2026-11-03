# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=54.0
pkgrel=1
pkgdesc="A Virtual Machine Monitor for modern Cloud workloads"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=('x86_64' 'aarch64')
license=('Apache-2.0' 'BSD-3-Clause' 'CC-BY-4.0')
depends=('glibc' 'libgcc')
optdepends=(
    'virtiofsd: Rust implementation of virtiofsd'
)
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')
options=(!debug !strip)

source=(
    "https://github.com/cloud-hypervisor/cloud-hypervisor/raw/refs/tags/v${pkgver}/LICENSES/Apache-2.0.txt"
    "https://github.com/cloud-hypervisor/cloud-hypervisor/raw/refs/tags/v${pkgver}/LICENSES/BSD-3-Clause.txt"
    "https://github.com/cloud-hypervisor/cloud-hypervisor/raw/refs/tags/v${pkgver}/LICENSES/CC-BY-4.0.txt")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'a6d3ebd1c2f37d4fd83d0676621f695fc0cc2d8c6e646cdbb831b46e0650c208'
            '5de1515bbd239de392a34f9147d0b5293c6c3521be5ec2b485d6902714e01e6d')

if [[ "$CARCH" == 'x86_64' ]]; then
    source+=(
        "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
        "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static"
        "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
    )
    sha256sums+=('978dbc10deae6c83beb119b8187f968e4b2963b73ef7163cac791c8c1522dfee'
            'acd5be240d5c73373effbe818908fc03e313ec8486237904bff11d93b71b1c83'
            '4f4f98a3d661a40f3e5272627cc895a1b2e525f2f6bedf5f895f9cd21ba5c65b')

elif [[ "$CARCH" == 'aarch64' ]]; then
    source+=(
        "ch-remote-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
        "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
    )
    sha256sums+=('44521d7415eb45ac3188e1d90ab3b12f689e6548606df779ec87c4fcce297d9e'
                 'e8a6d9786ea678e739f1a386682846e93742dcb9c7b6e3e0c62e3bda6cff0ef3')
fi

package() {
    mkdir -p "${pkgdir}/usr"/{bin,share/licenses/${pkgname}}

    install -D --preserve-timestamps --mode=644 \
        "--target-directory=${pkgdir}/usr/share/licenses/${pkgname}" \
        "${srcdir}/"{Apache-2.0.txt,BSD-3-Clause.txt,CC-BY-4.0.txt}

    install -D --preserve-timestamps --mode=755 "--target-directory=${pkgdir}/usr/bin" \
        "${srcdir}/ch-remote-static" "${srcdir}/cloud-hypervisor-static"

    if [[ "$CARCH" == 'x86_64' ]]; then
        install -D --preserve-timestamps --mode=755 "--target-directory=${pkgdir}/usr/bin" \
            "${srcdir}/ch-remote"
    fi
}
