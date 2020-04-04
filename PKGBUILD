# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: jfperini <@jfperini>

pkgname=eviacam
pkgver=2.1.4
pkgrel=3
pkgdesc='Enable Viacam (eViacam) is a mouse replacement software that moves the pointer as you move your head'
arch=('any')
url='https://eviacam.crea-si.com/'
license=('GPL-3.0')
depends=('opencv' 'wxgtk' 'gtk3' 'libxext' 'libxtst')
makedepends=('libtool' 'automake' 'autoconf')
provides=('eviacam')
source=("https://github.com/cmauri/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('1da6f425254306f48a77abae560d5b66')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="../../0001-Patch-for-new-opencv-4.2.patch"
    # Dirty fix: 'cvCreateCameraCapture doesn't support legacy API anymore' issue
    sed -i '252s@1@0@' "${srcdir}/${pkgname}-${pkgver}"/src/viacamcontroller.cpp
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
  	./configure --with-wx-config=/usr/bin/wx-config-gtk3
  	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    mkdir -p "${pkgdir}"/usr/share/man/man1
    mv "${pkgdir}/usr/local/share/man/man1"/eviacam* "${pkgdir}"/usr/share/man/man1/
    rm -rf "${pkgdir}/usr/local/share/man"
}
# vim: ts=2 sw=2 et: