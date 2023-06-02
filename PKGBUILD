# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="sysinfo"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="sysinfo shows system information like the hardware configuration and resource usage in a compact, clearly arranged and
visually pleasing style."
arch=("any")
url="https://github.com/IngoMeyer441/sysinfo"
license=("MIT")
depends=("bash" "gawk")
source=("https://github.com/IngoMeyer441/sysinfo/archive/v${pkgver}.tar.gz"
        "version.sh_no_phony.patch")
sha256sums=("e0bc83f0bb67cb2e2612ac63016e84ce8819f75ef7991e8bdb78e496707be8be"
            "022e579806fc6090f066489ee40a38010f7c26d9f874554e7eb7d7f5236d257f")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    patch -p1 -i "${srcdir}/version.sh_no_phony.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    sed \
        -e "s/^\(SCRIPT_VERSION=\).*$/\1\"${pkgver}\"/" \
        "src/version.template.sh" > "src/version.sh" && \
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
