# Maintainer: Shawn Nock <nock@nocko.se>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: simo <simo@archlinux.org>

pkgname=tor-unstable
pkgver=0.2.8.5_rc
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
sha256sums=('715c15230f1160c170c61286b02620a1d99a8476dd9c4f80a2e66779be63780a'
         'SKIP'
         '44093eaf790c6c1cad8690ee002829481fb9b22ca58663f524f5792521222406'
         '05383ab3c9879b7d77eadeeb8e9824c471ff7a5a7501996efaa573a7547fa4da')
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
