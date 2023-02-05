# Maintainer: Andrea Cattaneo <aur at runme dot sh>
# Contributor: Bart De Vries <bart at mogwai dot be>

pkgname=snapcast-git
pkgver=v0.27.0.r0.g54a3d862
pkgrel=1
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
        "snapcast.sysusers"
        "snapcast.tmpfiles"
        "snapcast.install"
        "snapclient.service"
        "snapserver.service"
        "snapserver.default"
        "snapclient.default")
sha256sums=('SKIP'
            '9fe6e9e07adb77f555a617b772e6d01e098e1dfaad1e8075e03a7d7ba76141de'
            'e8c3441c4ca646a9b66d61355e90862fd3481562ae3b4e0a4bc1c978464ae2c7'
            '98cfdc3221270e3243f7dd0ca32f8c4b271258f32fc04fdb52a286f0986d7350'
            'b408170fde6862cf9bb5adb379d0a00314f9b68da20021496ea90332b599f440'
            '782f3ffc2707032c33ada827aa56c8e8c1703d222ed6654f0e59dadd6c48c6a5'
            '56a3eff304f0b43d31b4d8cf3f82e2c916bd3ec8c27a0d2f040e4299ac83e113'
            'dae9b4c36a9679904c45a5bf49cda6c1d164c39a497f5a7cccf6ac967947a8c4')

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

    install -Dm755 bin/snapclient "${pkgdir}/usr/bin/snapclient"
    install -Dm644 client/snapclient.1 "${pkgdir}/usr/share/man/man1/snapclient.1"

    install -Dm644 "${srcdir}/snapserver.service" "${pkgdir}/usr/lib/systemd/system/snapserver.service"
    install -Dm644 "${srcdir}/snapserver.default" "${pkgdir}/etc/default/snapserver"
    install -Dm644 "${srcdir}/snapclient.service" "${pkgdir}/usr/lib/systemd/system/snapclient.service"
    install -Dm644 "${srcdir}/snapclient.default" "${pkgdir}/etc/default/snapclient"

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
