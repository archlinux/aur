# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=icecast
pkgver=2.4.4
pkgrel=5
pkgdesc='Streaming audio over the Internet'
arch=('x86_64')
license=('GPL2')
url="https://www.icecast.org/"
depends=('glibc' 'libkate' 'libxml2' 'libxslt' 'openssl' 'speex' 'libtheora')
makedepends=('curl' 'libogg' 'libvorbis')
backup=('etc/icecast.xml'
        'etc/logrotate.d/icecast')
source=(
  "https://downloads.us.xiph.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.logrotate"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha512sums=('e9ffb478cac2570891787455591d881a59185e067bb36f51706a7070cd9d82d80425ec8cf151f5ebb17d1b75654449fc760f8b82a1bb05f020b47ec09e46b4d0'
            '1727ec4e66ce2939a6b66c23b2f0938e2e6c717d2753f4d8c05eb31ff211d50f7ce3d38b8fca93b8cb98c1b755a5d8e3baf381fe8eb0624e7e4fe9c7486ad14a'
            '89f65693cd59e6f6450e018e370d48935555d6e31dfda93c6bb06786df99d1ca4b5569455b7a5543bcdd6270009011286390c23dafd1729d71a245d6ebd878b5'
            'ca0c6e81e84910ac5bcd573aa280224426201b4aa8580f974b17daea6f95472e3ba47b3319ea1291d6762e858a3f7e9120f05357fe02aa83f01bb767862a04c8'
            'db3cf00e5ff1e2f5636288992212964f068f94ee98a880c27f00afda44f048e608636a34f2ae551f3cf24f7c43ebd2f40ab8a9bcc5d8057901d4a871c6b79f13')
b2sums=('fd4034749feb4bf38c684ac6d8de572fdebce875843dc1be286264c8fe8d38feb24ea889b07ec79aada34cf16dae46eb21a8c5470f67c08f2dd56dc04c12130f'
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
