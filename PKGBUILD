# Maintainer: Koutheir Attouchi <koutheir@gmail.com>
# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=52.0
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
    sha256sums+=('ed846e6393856f071fd98e6244ac4624cb972f57f1fb6d4518508c6f136c08c0'
                'd4e8709ed3ef8ba5c66d98770342a2d7c3c96174cfa9c5ae9e3e55de999869a3'
                '829af01ff075bb96c4f183905134c453a88d68cbabdc6b87df21098842581ee9')

elif [[ "$CARCH" == 'aarch64' ]]; then
    source+=(
        "ch-remote-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
        "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
    )
    sha256sums+=('94d1dbcae65df9be8e5a2ec6ded9c6f8cbc1b3a0b95f199450146cdb9fb1b5bb'
                'bf004ddc1a148f47caa87ac49a783b8dbd6bf9bc27abe522ed197df7b982d3b1')
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
