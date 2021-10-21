# vim: noai:ts=4:sw=4
# Maintainer: jzbor <zborof at posteo dot de>
# Contributors:
# AwesomeHaircut <jesusbalbastro@gmail.com>
# jbouter <aur@kn0x.org>
# dreieck
_pkgname=touchegg
pkgname="${_pkgname}-nosystemd"
pkgver=2.0.12
pkgrel=2
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
sha512sums=('ee56d81adfced97473f6fcaf641b569aaadc926b613556f8e9b732f95d35c45aa1c18dfab6467d063a5f2e7138960acc115079b458047422a2e8801a4e0a4825')

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


