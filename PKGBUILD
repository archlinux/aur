# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>
# Contributor: Alessio Sergi <sergi.alessio {at} gmail.com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_pkgname=amule
pkgname=${_pkgname}-gtk3
epoch=1
pkgver=2.3.3
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network (GTK3)"
arch=(x86_64)
url="http://www.amule.org"
license=(GPL)
depends=('wxgtk3' 'gd' 'geoip' 'libupnp' 'crypto++')
makedepends=('boost')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(https://download.sourceforge.net/project/amule/aMule/$pkgver/aMule-$pkgver.tar.gz
        amuled.systemd amuleweb.systemd amule.sysusers amule.tmpfiles)
sha256sums=('fa85a054153c9787fce2d35a5c5590a3d390429b8fa0c5d8f9ea69e9904c7b72'
            '20ac6b60c5f3bf49c0b080dfc02409da3c9d01b154344188008c6a75ca69681e'
            'f4f43b1154ddccc9036a4291a58c6715f097b171fec62ea7aead0c9d9fa654f2'
            'c4ca658ab4105b3b90e0bb3efcc8121eca1c4d873787db1ed4f637925c16d502'
            'e9d1b7019c7075b0f8616c6507a767b87de8f899936680e9ff5829d8cbba224d')

build() {
  cd aMule-$pkgver
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-cas \
              --enable-wxcas \
              --enable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --enable-alc \
              --enable-alcc \
              --enable-webserver \
              --disable-debug \
              --enable-optimize \
              --enable-geoip \
              --enable-upnp \
              --enable-fileview \
              --with-boost \
              --with-wx-config=/usr/bin/wx-config-gtk3
  make
}

package() {
  cd aMule-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/amuled.systemd "$pkgdir"/usr/lib/systemd/system/amuled.service
  install -Dm644 "$srcdir"/amuleweb.systemd "$pkgdir"/usr/lib/systemd/system/amuleweb.service
  install -Dm644 "$srcdir"/amule.sysusers "$pkgdir"/usr/lib/sysusers.d/amule.conf
  install -Dm644 "$srcdir"/amule.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/amule.conf
}
