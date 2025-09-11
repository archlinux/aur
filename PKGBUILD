# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snd-hdspe-dkms-git
_pkgname=snd-hdspe
pkgver=r227.e0d2b60
pkgrel=1
pkgdesc='A linux kernel module for RME HDSPe sound cards and extension modules (development branch)'
url='https://github.com/Schroedingers-Cat/snd-hdspe'
arch=('any')
license=('GPL-3.0-or-later')
depends=('dkms')
makedepends=('git')
provides=("snd-hdspe-dkms")
conflicts=("snd-hdspe-dkms")
source=(
  "git+https://github.com/Schroedingers-Cat/snd-hdspe.git#branch=develop"
)
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    
    # Generate dkms.conf using upstream Makefile
    make dkms.conf
    
    # Install only the necessary files for DKMS compilation
    install -Dm644 Makefile "${pkgdir}/usr/src/${pkgname}-${pkgver}/Makefile"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
    install -Dm644 sound/pci/hdsp/hdspe/*.{c,h} -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/sound/pci/hdsp/hdspe"
    
    # Install documentation and license
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r doc "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=2 sw=2 et:
