# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=53.0
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
    sha256sums+=('5e393c0edcec8567ef664a8c4cc38ebd33d858b6376da36853b60ea51fcca572'
                 '13f32ba952e6791fd901f2279be2055fbacc64005f96c42a8e90d58860df84a7'
                 '448af3d4e59b22c2987f7df94c213ad40fb53a10d437e42b5ee6c4fce7c29ecc')

elif [[ "$CARCH" == 'aarch64' ]]; then
    source+=(
        "ch-remote-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
        "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
    )
    sha256sums+=('ade26617f74264467e1381f146fd1face6b8b0fb13c5ec84f4acedd72f972596'
                 'f192b510eea1c710cbc439d716bb0573c223fc463dbe3e6523788a2b7ef62850')
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
