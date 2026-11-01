# Maintainer: Pavel Pavlov <pakx86 at gmail dot com>
# Based on qc71-laptop-dkms-git by jomp16 <root at rwx dot ovh>.

_modname=qc71_laptop
pkgname=qc71-laptop-lapac71-dkms-git
pkgver=r83.54a5299
pkgrel=1
pkgdesc='QC71 laptop platform driver with LAPAC71G/H battery, keyboard RGB and fan support (DKMS)'
arch=('x86_64')
url='https://github.com/PaveLiArcH/qc71_laptop'
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build for the linux kernel'
            'linux-lts-headers: build for the linux-lts kernel')
provides=("qc71-laptop-dkms=${pkgver}" "${_modname}=${pkgver}")
conflicts=('qc71-laptop-dkms' 'qc71-laptop-dkms-git' "${_modname}")
options=('!strip' '!debug' '!lto')
source=("${_modname}::git+https://github.com/PaveLiArcH/qc71_laptop.git#branch=master"
        'dkms.conf')
sha256sums=('SKIP'
            '197fafccad3ac400880112fbc1035e231fe3e0c7b678762261197ced9ddfe1a3')

pkgver() {
    cd "${srcdir}/${_modname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_modname}"

    local destination="${pkgdir}/usr/src/${_modname}-${pkgver}"
    install -dm755 "$destination"
    install -m644 Makefile LICENSE *.c *.h "$destination/"
    sed "s/@PKGVER@/${pkgver}/g" "${srcdir}/dkms.conf" > "$destination/dkms.conf"
    chmod 644 "$destination/dkms.conf"
}
