# Maintainer: Shawn Nock <nock@nocko.se>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: simo <simo@archlinux.org>

pkgname=tor-unstable
pkgver=0.2.7.2_alpha
pkgrel=1
pkgdesc='Anonymizing overlay network.'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.torproject.org/'
license=('BSD')
depends=('libevent' 'bash' 'libseccomp')
optdepends=('torsocks: for torify')
makedepends=('ca-certificates')
conflicts=(tor)
provides=(tor)
backup=('etc/tor/torrc'
        'etc/tor/torrc-dist')
install='tor.install'
source=("https://www.torproject.org/dist/${pkgname/-unstable/}-${pkgver/_/-}.tar.gz"{,.asc}
        'torrc'
        'tor.service')
md5sums=('f102c23727ce9fbbb5c58495bdfdba64'
         'SKIP'
         'c1dd4004c63edaeaa829e01be5413cfc'
         'a396657e6f6df21d319ad586500c04b1')
validpgpkeys=('B35BF85BF19489D04E28C33C21194EBB165733EA')
build() {
  cd "${srcdir}/${pkgname/-unstable/}-${pkgver/_/-}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname/-unstable/}-${pkgver/_/-}"

  make DESTDIR="${pkgdir}" install

  install -dm0700 "${pkgdir}/var/lib/tor"

  mv "${pkgdir}/etc/tor/torrc.sample" "${pkgdir}/etc/tor/torrc-dist"
  install -Dm0644 "${srcdir}/torrc" "${pkgdir}/etc/tor/torrc"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm0644 "${srcdir}/tor.service" "${pkgdir}/usr/lib/systemd/system/tor.service"
}
