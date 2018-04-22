# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=virtlyst
_projectname=Virtlyst
pkgver=1.0.0
pkgrel=1
pkgdesc="Web interface to manage virtual machines with libvirt"
arch=('x86_64')
url="https://github.com/cutelyst/Virtlyst"
license=('AGPL3')
depends=('cutelyst' 'libvirt')
makedepends=()
source=("https://github.com/cutelyst/${_projectname}/archive/v${pkgver}.tar.gz"
    "virtlyst.ini"
    "virtlyst.service")
backup=("etc/uwsgi/virtlyst.ini")


build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      "${srcdir}/${_projectname}-${pkgver}"
  make
}

package() {
  #make DESTDIR="$pkgdir/" install
  install -D -m755 "${srcdir}/build/src/libVirtlyst.so" -t "${pkgdir}/usr/lib/uwsgi/"
  install -D -m644 "${srcdir}/virtlyst.ini" -t "${pkgdir}/etc/uwsgi/"
  install -D -m644 "${srcdir}/virtlyst.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -d "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/${_projectname}-${pkgver}/root/static/" "${pkgdir}/usr/share/${pkgname}/static"
  cp -r "${srcdir}/${_projectname}-${pkgver}/root/src/" "${pkgdir}/usr/share/${pkgname}/templates"
}

sha256sums=('5f1b121a90bfe8fcb608913306478dc8d68c4132aea11ffbd57a76d12bb32ce8'
            '372cf5d94a8117b0ad167d9edd7487f81f9440376d6b485e6fbe51b417324a39'
            'b7f96b90e7e7aeae0fb0cbe4c62e63c1418439d83d587e2afb40ab28f12b704f')
