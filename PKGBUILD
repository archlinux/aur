# Maintainer: Drew Nutter <dnut@users.noreply.github.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=icecast
pkgver=2.5.0
pkgrel=1
pkgdesc='Streaming audio over the Internet'
arch=('x86_64')
license=('GPL-2.0-only')
url="https://www.icecast.org/"
depends=('glibc' 'libxml2' 'libxslt' 'openssl' 'rhash' 'speex' 'libtheora' 'libigloo')
makedepends=('autoconf' 'automake' 'curl' 'libogg' 'libtool' 'libvorbis')
optdepends=('libmaxminddb: GeoIP support')
backup=('etc/icecast.xml'
        'etc/logrotate.d/icecast')
source=(
  "https://downloads.us.xiph.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.logrotate"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha512sums=('d92ce5d8ae1cd011eaa8c7424adea744f35e5c2d3e8244d362743be1c6bbc8fc44d76d7a212cf1eebe79da9b7d83b2ed5ab8659fb97929af316674b5ddf590b5'
            '1727ec4e66ce2939a6b66c23b2f0938e2e6c717d2753f4d8c05eb31ff211d50f7ce3d38b8fca93b8cb98c1b755a5d8e3baf381fe8eb0624e7e4fe9c7486ad14a'
            '89f65693cd59e6f6450e018e370d48935555d6e31dfda93c6bb06786df99d1ca4b5569455b7a5543bcdd6270009011286390c23dafd1729d71a245d6ebd878b5'
            'ca0c6e81e84910ac5bcd573aa280224426201b4aa8580f974b17daea6f95472e3ba47b3319ea1291d6762e858a3f7e9120f05357fe02aa83f01bb767862a04c8'
            'db3cf00e5ff1e2f5636288992212964f068f94ee98a880c27f00afda44f048e608636a34f2ae551f3cf24f7c43ebd2f40ab8a9bcc5d8057901d4a871c6b79f13')
b2sums=('0eb3166c6025b095760694ad5e9c7cac7fef8a1d195896b0848eec20b495663890df9dcfb06475eadecc736394c0884b4b5dd444066d19fd78dfcbe71f694985'
        '9d4897d84c4be355b04c542fcf5242d5341634eefb0ca8233f8bf944e208f4ba3a2855a922639979541ec55280cdbebbebedb2a3b8a59289d19803bf7d3cdc11'
        '42d2c7bdcd0e970f5750175e6e766e6dcecdc616819d36195b8025920d1997c6e74961aa8ed124f4c09d2391bd3f6f2b55282d2fff623c61d4dba7a22d2e3ac6'
        '61c3194a0ca86f19bd4d8153eb3589f0b400549605b588418bc60a5f8a70198d1532f53ca48070385012ef8346bed69b5e1b53d2cf2b803da921414365394224'
        'b17bf9b34daa89e32a41be3364ca74f8d2403bc8f6a103e4db51c637b42f9cd0841553b2838ce9dcdb91c3561249f13fca39359636c07f163c90de3945bf1784')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  depends+=('libcurl.so' 'libogg.so' 'libvorbis.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # logrotate
  install -vDm 644 "../${pkgname}.logrotate" \
    "${pkgdir}/etc/logrotate.d/${pkgname}"
  # systemd unit
  install -vDm 644 "../${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -vDm 644 "../${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm 644 "../${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
