# Maintainer: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=ndyndns
pkgver=2.2
pkgrel=1
pkgdesc="Update client for the dynamic DNS services from DynDNS and Namecheap"
url="http://code.google.com/p/ndyndns/"
license=('GPL3')
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
depends=('curl')
install="${pkgname}.install"
backup=('etc/ndyndns.conf')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2"
        'ndyndns.service'
        'ndyndns.sysusers'
        'ndyndns.conf'
        "${pkgname}.install")
md5sums=('d3ea7e5242ea340b230df3f959cda305'
         '6a6efc0c5744c5c8cb16d72cd2509cc0'
         'b7bd3d2f0473fd78555ed874eee3dd1b'
         'f0c69eb41db16a228ebf62c1561c89d6'
         '6665bdcd680e5e8c3dd4599d38ed8fb9')

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix="${pkgdir}/usr" --sbindir="${pkgdir}/usr/bin"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/man/"{man1,man5}
  install -dm700 "${pkgdir}/var/lib/ndyndns/var/"
  make install
  install -dm755 "${pkgdir}/var/lib/ndyndns/"
  install -dm700 "${pkgdir}/var/lib/ndyndns/var/"

  install -Dm600 "${srcdir}/ndyndns.conf" "${pkgdir}/etc/ndyndns.conf"
  install -Dm644 "${srcdir}/ndyndns.service" "${pkgdir}/usr/lib/systemd/system/ndyndns.service"
  install -Dm644 "${srcdir}/ndyndns.sysusers" "${pkgdir}/usr/lib/sysusers.d/ndyndns.conf"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README "${pkgdir}/usr/share/doc/ndyndns"
}
