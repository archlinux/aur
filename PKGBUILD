# vim: noai:ts=4:sw=4
# Maintainer: jzbor <zborof at posteo dot de>
# Contributors:
# AwesomeHaircut <jesusbalbastro@gmail.com>
# jbouter <aur@kn0x.org>
# dreieck
_pkgname=touchegg
pkgname="${_pkgname}-nosystemd"
pkgver=2.0.14
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
sha512sums=('da0162abfb4f6b2d27406e3446d6829d30eb17187308045dd6c846570aedb786a5e2f84d764e9eb8a2b549e1087e624a901ef44777899ff56fc75b91b068c477')

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


