# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

_pkgname=smictrl
pkgname="${_pkgname}-git"
pkgver=r13.7aa1eae
pkgrel=1
pkgdesc="SMI enable register manipulation tool"
arch=('x86_64')
url='https://github.com/zultron/smictrl'
depends=('pciutils')
makedepends=('linux-headers')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
license=('GPL2')
source=("git+https://github.com/zultron/smictrl.git"
        'pci_fill_info_fix.diff')
sha256sums=('SKIP'
            '322fddbe6f5995f5cf8ef3ebb3307cd89f9015a0f26bf87036307f8e23aa697a')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    patch -d "${srcdir}/${_pkgname}" -Np1 -i "${srcdir}/pci_fill_info_fix.diff"
}

build() {
    local libpci_flags="$(pkg-config --cflags --libs libpci)"
    eval "${CC:-gcc} ${CFLAGS} -I/usr/src/linux/include ${libpci_flags} \"\${srcdir}/\${_pkgname}/smictrl.c\" -o \"\${srcdir}/\${_pkgname}/smictrl\""
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/smictrl" "$pkgdir/usr/bin/smictrl"
}
