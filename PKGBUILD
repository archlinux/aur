# vim: noai:ts=4:sw=4
# Maintainer: jzbor <zborof at posteo dot de>
# Contributors:
# AwesomeHaircut <jesusbalbastro@gmail.com>
# jbouter <aur@kn0x.org>
# dreieck
_pkgname=touchegg
pkgname="${_pkgname}-nosystemd"
pkgver=2.0.13
pkgrel=1
pkgdesc="Multitouch gesture recognizer (with systemd support disabled)"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/${_pkgname}/"
license=('GPL3')
depends=('cairo' 'glib2' 'gtk3' 'libinput' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml')
makedepends=('cmake')
provides=(
    "${_pkgname}=${pkgver}"
    "${_pkgname}-doc=${pkgver}"
    )
conflicts=("${_pkgname}")
optdepends=(
    "${_pkgname}-openrc: ${_pkgname} daemon OpenRC startup script."
    "touche: For a configuration GUI (warning, overwrites user config file without warning)."
    )
#" This is somehow necessary vor syntac highlighting to work with nvim
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('4db88b184da0363f35607655739b9b125f99261c3a65018258bb4adcb7f91fb0840b71044c7016245062865eecb7dcc04d05a9d1787c86f6074af26cadb53b0c')

build() {
    cd "${srcdir}"

    cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEMD=OFF \
    -Wno-dev
    make -C build
}

package() {
    cd "${srcdir}"

    make -C build DESTDIR="${pkgdir}" install

    [ -d "${pkgdir}/lib" ] && mv "{$pkgdir}/lib" "${pkgdir}/usr/lib"

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/installation/touchegg.desktop" "${pkgdir}/etc/xdg/autostart/touchegg.desktop"

    for _docfile in 'CHANGELOG.md' 'HACKING.md' 'README.md'; do
        install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
    done
}


