# Maintainer: John Bergqvist <JohnLBergqvist at gmail dot com >

pkgname=tbs-dvb-drivers-git-dkms
pkgver=r11.8e731cd
pkgrel=1
pkgdesc="DKMS package for TBS DVB drivers, tracking tbsdtv/linux_media upstream"
arch=('x86_64')
url="https://github.com/JohnLBergqvist/tbs-dvb-drivers-git-dkms"
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('dkms' 'tbs-firmware')
conflicts=('tbsecp3-driver-git-dkms' 'tbs-dvb-drivers' 'tbs-linux_media-git-dkms' 'tbs-linux_media-git')
provides=('tbs-dvb-drivers')
source=("git+https://github.com/JohnLBergqvist/tbs-dvb-drivers-git-dkms.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    # Created (versioned) destination directory
    local destdir="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -dm755 "$destdir"

    # Copy dkms.conf into destination directory with version substituted
    install -Dm644 dkms.conf "${destdir}/dkms.conf"
    sed -i "s/@PKGVER@/${pkgver}/" "${destdir}/dkms.conf"

    # Copy Makefile, source & patch files into destination directory
    install -Dm644 Makefile "${destdir}/Makefile"
    cp -r src patches "$destdir/"

    # Copy UPSTREAM_VERSION into destination directory
    install -Dm644 UPSTREAM_VERSION "${destdir}/UPSTREAM_VERSION"

    # Skip version check for modules — without this, DKMS refuses to install
    # if a same-named module is already shipped by linux/linux-lts. We want
    # ours to win for cx24117, tda18212, etc. (the TBS-modified mainline drivers).
    install -dm755 "${pkgdir}/usr/share/dkms/modules_to_force_install"
    echo "${pkgname}_version-override" > "${pkgdir}/usr/share/dkms/modules_to_force_install/${pkgname}"
}

