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
    "virtlyst.service"
    "virtlyst.rules")
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
  install -D -m644 "${srcdir}/virtlyst.rules" -t "${pkgdir}/usr/share/polkit-1/rules.d/51-virtlyst.rules"
  install -d "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/${_projectname}-${pkgver}/root/static/" "${pkgdir}/usr/share/${pkgname}/static"
  cp -r "${srcdir}/${_projectname}-${pkgver}/root/src/" "${pkgdir}/usr/share/${pkgname}/templates"
}

sha256sums=('5f1b121a90bfe8fcb608913306478dc8d68c4132aea11ffbd57a76d12bb32ce8'
            '372cf5d94a8117b0ad167d9edd7487f81f9440376d6b485e6fbe51b417324a39'
            'e2c573630bc79d92d77202c54fbcb73720f97fce5606ca7d83640f455bb7f80b'
            'fb13f116e9b8268b642082ab8aac40fe2104dbb33e98ab925ab3633986c5fdca')
