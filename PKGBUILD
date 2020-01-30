# Maintainer: Thomas Kiss <thokis@gmail.com>

pkgname=sane-airscan-git
pkgver=0.9.12
pkgrel=1
pkgdesc='SANE - Apple AirScan (eSCL) driver'
url='https://github.com/alexpevzner/sane-airscan'
arch=('aarch64' 'x86_64')
license=('GPLv2')
depends=('libjpeg-turbo' 'sane' 'glib2' 'libsoup' 'libxml2' 'avahi' 'gcc' 'make' 'pkgconf')
makedepends=('git')
source=('git://github.com/alexpevzner/sane-airscan.git')
sha1sums=('SKIP')
provides=("sane-airscan")


pkgver() {
    cd "${srcdir}/sane-airscan"
    git describe --long --tags | cut -f1 -d'-'
}

build() {
    cd "${srcdir}/sane-airscan"

    make -j $(nproc)
}

package() {
    cd "${srcdir}/sane-airscan"
    
    mkdir -p "${pkgdir}/etc/sane.d"
    mkdir -p "${pkgdir}/etc/sane.d/dll.d"
    cp -n airscan.conf "${pkgdir}/etc/sane.d"
    cp -n dll.conf "${pkgdir}/etc/sane.d/dll.d/airscan"
    install -Dm644 libsane-airscan.so.1 "${pkgdir}/usr/lib/sane/libsane-airscan.so.1"
    mkdir -p "${pkgdir}/usr/share/man/man5"
    tar -cpf "${pkgdir}/usr/share/man/man5/sane-airscan.5.gz" sane-airscan.5
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
