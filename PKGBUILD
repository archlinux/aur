# Maintainer: Frontier <frontier314@gmail.com>
# Submitter: Thermionix <thermionix@gmail.com>

pkgname=enhanceio-dkms-git
pkgver=108.01
pkgrel=2
pkgdesc="dkms module for EnhanceIO block device caching"
arch=('i686' 'x86_64')
url="https://github.com/stec-inc/EnhanceIO"
license=('GPL')
depends=('dkms' 'python2>=2.6.6')
makedepends=('git')
conflicts=()
install="${pkgname}.install"
source=("$pkgname"::'git+https://github.com/Frontier314/EnhanceIO'
'enhanceio-dkms-git.install')
sha256sums=('SKIP'
'198a30cb82934828d1e49aa13ba6c726b11ecfe4eb7d310e70b074be2524e2b8')
_modname=enhanceio

prepare() {
cd "${srcdir}/${pkgname}/Driver/enhanceio"
sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
}

build() {
sed -i -e '\|^#!/usr/bin/python$|s|python|python2|' "${srcdir}/${pkgname}/CLI/eio_cli"
cd "${srcdir}/${pkgname}/Driver/enhanceio"
warning "Please make sure the current kernel version matches the available linux-headers version"
make
}

package() {
install -D -m0755 "${srcdir}/${pkgname}/CLI/eio_cli" "${pkgdir}/usr/bin/eio_cli"
install -D -m0644 "${srcdir}/${pkgname}/CLI/eio_cli.8" "${pkgdir}/usr/share/man/man8/eio_cli.8"

install -d "${pkgdir}/usr/src/${_modname}-${pkgver}/"
install -m 644 ${srcdir}/${pkgname}/Driver/enhanceio/* "${pkgdir}/usr/src/${_modname}-${pkgver}/"

cd "${srcdir}/${pkgname}/Driver/enhanceio"
make DESTDIR="${pkgdir}/usr/" install
}
