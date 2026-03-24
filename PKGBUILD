# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_pkgbase=snd-dante-pcie
pkgname=${_pkgbase}-dkms-git
pkgver=0.0.1.r0.g4775565
pkgrel=1
pkgdesc="ALSA kernel driver for Digigram LX-DANTE / Audinate Dante PCIe cards (git)"
arch=('x86_64')
url="https://github.com/chris-ritsen/snd-dante-pcie"
license=('GPL')
depends=('dkms')
makedepends=('git')
optdepends=('python-numpy: dante-live dashboard')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}-dkms" 'dante-pcie-dkms')
source=("git+https://github.com/chris-ritsen/snd-dante-pcie.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || printf "0.0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgbase}"

    install -Dm644 snd-dante-pcie.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/snd-dante-pcie.c"
    install -Dm644 Makefile "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    install -Dm755 dante-live.py "${pkgdir}/usr/bin/dante-live"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf" <<EOF
blacklist dante_pcie
EOF
}
