# Contributor: Jens Adam <jra@byte.cx>
# Maintainer: Steven Allen <steven@stebalien.com>

pkgname=ndyndns
pkgver=2.3.1
pkgrel=1
pkgdesc="Update client for the dynamic DNS services from DynDNS and Namecheap"
url="https://github.com/niklata/ndyndns"
license=('GPL3')
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
depends=('curl')
install="${pkgname}.install"
backup=('etc/ndyndns.conf')
source=("https://github.com/niklata/ndyndns/archive/v${pkgver}.tar.gz"
        'ndyndns.service'
        'ndyndns.sysusers'
        'ndyndns.conf'
        "${pkgname}.install")
sha256sums=('b610579adfb89505439c4f69e6633cec632b8abe8de4ceecb16c01746d5debb4'
            'f59f189536536f4ee55f8c38a5df537bbc9ce5f9fb52d15ea3ecc6ae9c610221'
            '47b3b368a43a42fb9ca7cad4c6a3d95f5eae978b8654d55e5b82a6859c5fc7cf'
            'c71c313a08cdd9261a331f1dace91d423d63c506582f69dac6f52d4b73d25ed7'
            '8cda5abbbeeb4e8af44fb0fb7ec683bea775e617c1a8c08715a28ee00db28c40')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoconf
  ./configure --prefix="${pkgdir}/usr" --sbindir="${pkgdir}/usr/bin"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
