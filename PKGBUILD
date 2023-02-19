# Maintainer: kyndair <kyndair at gmail dot com>
pkgname=devilscalw-flasher-git
_pkgname=flasher
pkgver=r22.864b3ee
pkgrel=1
pkgdesc="LG CD/DVD/BluRay drive firmware dumping and flashing software"
arch=('i486' 'i686' 'pentium4' 'armv7h' 'aarch64' 'x86_64')
url="https://github.com/devilsclaw/flasher"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('devilscalw-flasher')
conflicts=('devilscalw-flasher')
source=('git+https://github.com/devilsclaw/flasher.git')
sha256sums=('SKIP')

# update the package version to the current git version
pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

build() {
    if [ -e "${srcdir}/${_pkgname}/build/Makefile" ]; then
        cd "${srcdir}/${_pkgname}/build"
        make clean
    else
        mkdir -p "${srcdir}/${_pkgname}/build"
        cd "${srcdir}/${_pkgname}/build"
    fi
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/build/bin/dcdate/dcdate" "${pkgdir}/usr/bin/dcdate"
    install -Dm755 "${srcdir}/${_pkgname}/build/bin/flasher/flasher" "${pkgdir}/usr/bin/flasher"
    install -Dm644 "${srcdir}/${_pkgname}/build/lib/liblibcmdh.a" "${pkgdir}/usr/lib/liblibcmdh.a"
    install -Dm644 "${srcdir}/${_pkgname}/build/lib/liblibmmc.a" "${pkgdir}/usr/lib/liblibmmc.a"
}
