# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snd-hdspe-dkms-git
_pkgname=snd-hdspe
pkgver=r289.abf9146
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

    # Generate dkms.conf with the upstream Makefile (dkms.conf.in template),
    # then align PACKAGE_VERSION with the pacman pkgver so the DKMS source-tree
    # directory name and dkms.conf stay consistent (upstream hardcodes
    # '<version>+develop'; DKMS resolves module/version from the directory name).
    make dkms.conf
    sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" dkms.conf

    # Generate the version header with the real git revision. DKMS cannot do
    # this: its build command runs the kernel build system directly
    # (-C kbuild M=build), bypassing this top-level Makefile, and /usr/src is
    # not a git tree (a DKMS-side 'make modules' would leave GIT_HASH unknown).
    make "sound/pci/hdsp/hdspe/hdspe_version.h"

    # Install only the necessary files for DKMS compilation
    install -Dm644 Makefile "${pkgdir}/usr/src/${pkgname}-${pkgver}/Makefile"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
    # Ship the template as well: upstream's 'make clean' target removes the
    # generated dkms.conf, so it must be regenerable from /usr/src.
    install -Dm644 dkms.conf.in "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf.in"
    install -Dm644 sound/pci/hdsp/hdspe/*.{c,h} -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/sound/pci/hdsp/hdspe"
    install -Dm644 sound/pci/hdsp/hdspe/hdspe_version.h "${pkgdir}/usr/src/${pkgname}-${pkgver}/sound/pci/hdsp/hdspe/hdspe_version.h"
    
    # Install documentation and license
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r doc "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim: ts=2 sw=2 et:
