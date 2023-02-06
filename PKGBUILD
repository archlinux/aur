# Maintainer: Andrea Cattaneo <aur at runme dot sh>
# Contributor: Bart De Vries <bart at mogwai dot be>

pkgname=snapcast-git
_pkgname_snapos=snapos-git
pkgver=v0.27.0.r0.g54a3d862
pkgrel=2
pkgdesc="Synchronous multi-room audio player"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/badaix/snapcast"
license=('GPL')
depends=(alsa-lib avahi libvorbis flac opus expat libsoxr libpulse)
makedepends=(cmake alsa-utils boost)
provides=("snapcast")
conflicts=("snapcast")
install="snapcast.install"
backup=('etc/default/snapserver' 'etc/default/snapclient' 'etc/snapserver.conf')
source=("${pkgname}::git+$url.git#branch=develop"
        "${_pkgname_snapos}::git+https://github.com/badaix/snapos.git#branch=develop"
        "snapcast.sysusers"
        "snapcast.tmpfiles"
        "snapcast.install")
sha256sums=('SKIP'
            'SKIP'
            '9fe6e9e07adb77f555a617b772e6d01e098e1dfaad1e8075e03a7d7ba76141de'
            'e8c3441c4ca646a9b66d61355e90862fd3481562ae3b4e0a4bc1c978464ae2c7'
            '87945989ce215c3720e12e9d53642d7b1112f8276cd02d999fd7e27517aea126')

pkgver() {
    cd ${pkgname}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    cmake -B build -S . \
          -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -Wno-dev
    make -C build
}

package() {
    cd "${pkgname}"

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
        do install -Dm 755 ${file} -t "${pkgdir}/usr/share/snapserver/plug-ins/";
    done

    install -Dm755 bin/snapclient "${pkgdir}/usr/bin/snapclient"
    install -Dm644 client/snapclient.1 "${pkgdir}/usr/share/man/man1/snapclient.1"

    install -Dm644 "${srcdir}/${_pkgname_snapos}/debian/snapserver.service" "${pkgdir}/usr/lib/systemd/system/snapserver.service"
    install -Dm644 "${srcdir}/${_pkgname_snapos}/debian/snapserver.default" "${pkgdir}/etc/default/snapserver"
    install -Dm644 "${srcdir}/${_pkgname_snapos}/debian/snapclient.service" "${pkgdir}/usr/lib/systemd/system/snapclient.service"
    install -Dm644 "${srcdir}/${_pkgname_snapos}/debian/snapclient.default" "${pkgdir}/etc/default/snapclient"

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
