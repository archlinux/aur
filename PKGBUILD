# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=snapcast
_pkgname_snapos=snapos
pkgver=0.27.0
pkgrel=4
pkgdesc="Synchronous multi-room audio player"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/badaix/snapcast"
license=('GPL')
depends=(alsa-lib avahi libvorbis flac opus expat libsoxr libpulse)
optdepends=("python-websocket-client: stream plugin script"
            "python-websocket-client: stream plugin script"
            "python-musicbrainzngs: stream plugin script")
makedepends=(cmake alsa-utils boost)
install="snapcast.install"
backup=('etc/default/snapserver' 'etc/default/snapclient' 'etc/snapserver.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badaix/snapcast/archive/v${pkgver}.tar.gz"
        "snapos-${pkgver}.tar.gz::https://github.com/badaix/snapos/archive/v${pkgver}.tar.gz"
        "snapcast.sysusers"
        "snapcast.tmpfiles"
        "snapcast.install")
sha256sums=('c662c6eafbaa42a4797a4ed6ba4a7602332abf99f6ba6ea88ff8ae59978a86ba'
            '5f4f59dd6f39059c22687b29231e2c007a7d0ea0f920af6092f18eeba9a5e208'
            '9fe6e9e07adb77f555a617b772e6d01e098e1dfaad1e8075e03a7d7ba76141de'
            'e8c3441c4ca646a9b66d61355e90862fd3481562ae3b4e0a4bc1c978464ae2c7'
            '87945989ce215c3720e12e9d53642d7b1112f8276cd02d999fd7e27517aea126')

build() {
    cd "${pkgname}-${pkgver}"
    cmake -B build -S . \
          -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -Wno-dev
    cmake --build build
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 bin/snapserver "${pkgdir}/usr/bin/snapserver"
    install -Dm644 server/snapserver.1 "${pkgdir}/usr/share/man/man1/snapserver.1"
    install -Dm644 server/etc/snapserver.conf "${pkgdir}/etc/snapserver.conf"
    # install snapweb
    for file in server/etc/snapweb/*\.*; 
        do install -Dm 644 ${file} -t "${pkgdir}/usr/share/snapserver/snapweb/"; 
    done
    for file in server/etc/snapweb/3rd-party/*\.*;
        do install -Dm 644 ${file} -t "${pkgdir}/usr/share/snapserver/snapweb/3rd-party/";
    done
    for file in server/etc/plug-ins/*\.*; 
        do install -Dm 644 ${file} -t "${pkgdir}/usr/share/snapserver/plug-ins/"; 
    done

    install -Dm755 bin/snapclient "${pkgdir}/usr/bin/snapclient"
    install -Dm644 client/snapclient.1 "${pkgdir}/usr/share/man/man1/snapclient.1"

    install -Dm644 ${srcdir}/${_pkgname_snapos}-${pkgver}/debian/snapserver.service "${pkgdir}/usr/lib/systemd/system/snapserver.service"
    install -Dm644 ${srcdir}/${_pkgname_snapos}-${pkgver}/debian/snapserver.default "${pkgdir}/etc/default/snapserver"
    install -Dm644 ${srcdir}/${_pkgname_snapos}-${pkgver}/debian/snapclient.service "${pkgdir}/usr/lib/systemd/system/snapclient.service"
    install -Dm644 ${srcdir}/${_pkgname_snapos}-${pkgver}/debian/snapclient.default "${pkgdir}/etc/default/snapclient"

    install -Dm644 "${srcdir}/snapcast.sysusers" "${pkgdir}/usr/lib/sysusers.d/snapclient.conf"
    install -Dm644 "${srcdir}/snapcast.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/snapclient.conf"

    # install documentation
    install -d "${pkgdir}/usr/share/doc/${pkgname}/control"
    cp -R doc/* "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "changelog.md" "${pkgdir}/usr/share/doc/${pkgname}"

    find "${pkgdir}"/usr/share/doc/${pkgname} -type f -exec chmod 0644 {} \;
    find "${pkgdir}"/usr/share/doc/${pkgname} -type d -exec chmod 0755 {} \;

    # example control scripts
    cp -R control/* "${pkgdir}/usr/share/doc/${pkgname}/control/"
}

