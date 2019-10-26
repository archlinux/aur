# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=virtlyst
_projectname=Virtlyst
pkgver=1.2.0
pkgrel=4
pkgdesc="Web interface to manage virtual machines with libvirt"
arch=('x86_64')
url="https://github.com/cutelyst/Virtlyst"
license=('AGPL3')
depends=('cutelyst>=2.6.0' 'libvirt')
makedepends=('cmake' 'pkg-config')
optdepends=('nginx')
source=("https://github.com/cutelyst/${_projectname}/archive/v${pkgver}.tar.gz"
    "nginx-example.conf"
    "virtlyst.ini"
    "virtlyst.service"
    "virtlyst.socket"
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

  install -d "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/${_projectname}-${pkgver}/root/static/" "${pkgdir}/usr/share/${pkgname}/static"
  cp -r "${srcdir}/${_projectname}-${pkgver}/root/src/" "${pkgdir}/usr/share/${pkgname}/templates"

  install -D -m644 "${srcdir}/virtlyst.ini" -t "${pkgdir}/etc/uwsgi/"
  install -D -m644 "${srcdir}/virtlyst.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -D -m644 "${srcdir}/virtlyst.socket" -t "${pkgdir}/usr/lib/systemd/system/"

  install -d -m750 "${pkgdir}/usr/share/polkit-1/rules.d/"
  install -D -m644 "${srcdir}/virtlyst.rules" "${pkgdir}/usr/share/polkit-1/rules.d/51-virtlyst.rules"

  install -D -m644 "${srcdir}/nginx-example.conf" -t "${pkgdir}/usr/share/${pkgname}/"
}

sha256sums=('78c75877946bd3c6fd3b9f22d87fa5a1fd471573983bba2edbcedc192704ee1a'
            'c90df514f70a853d482ea2bf225eb684dd42a845fef39eb929f480187146afd5'
            '50e50b69331b9855a2277b716a885878eefdf60364d238dfcce2f033e7374886'
            '3636f7ec76debd8be54a02e02f74c247f19bb04f335355d4f6a26dbb222d1ea7'
            '9f8c34aadfdd9c374b70e2322d6e7684879df2be3e37bd31a050364504da01e9'
            'fb13f116e9b8268b642082ab8aac40fe2104dbb33e98ab925ab3633986c5fdca')
