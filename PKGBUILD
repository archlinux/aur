# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=phantun-dkms
pkgver=0.4.2
pkgrel=1
pkgdesc='Kernel module re-implementation of phantun, transform UDP streams into fake-TCP streams'
arch=('any')
url='https://github.com/bjin/phantun-dkms'
license=('GPL-2.0-or-later')
depends=('dkms')
source=("https://github.com/bjin/phantun-dkms/releases/download/v${pkgver}/phantun-dkms_${pkgver}.tar.gz")
sha256sums=('47ce5c2d10700a04d582d025a7cd0d8003b3a08a5f929108f07e913f49adf40c')

_extract_source_tree() {
    local dest=$1
    install -d "${dest}"
    bsdtar -xf "${srcdir}/phantun-dkms_${pkgver}.tar.gz" --owner 0 --group 0 -C "${dest}"
}

check() {
    local krel kdir checkdir
    krel=$(uname -r)
    kdir="/usr/lib/modules/${krel}/build"

    if [[ ! -d ${kdir} ]]; then
        warning "Skipping kernel build verification because ${kdir} is missing"
        return 0
    fi

    checkdir="${srcdir}/check-phantu-${pkgver}"
    rm -rf "${checkdir}"
    _extract_source_tree "${checkdir}"

    pushd "${checkdir}" >/dev/null
    make KDIR="${kdir}"
    popd >/dev/null
}

package() {
    local module_dir
    module_dir="${pkgdir}/usr/src/phantun-${pkgver}"
    _extract_source_tree "${module_dir}"
}
