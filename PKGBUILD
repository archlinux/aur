# Maintainer: robertfoster

pkgname=coova-chilli-arch
pkgver=1.6
pkgrel=1
pkgdesc='An open-source software access controller'
arch=('i686' 'x86_64')
url="https://coova.github.io/"
license=('GPL')
depends=('curl' 'libpcap' 'openssl')
makedepends=('gengetopt')
optdepends=('python2')
options=(!libtool)
replaces=(coova-chilli)
source=("https://github.com/coova/coova-chilli/archive/$pkgver.tar.gz"
  chilli.service
)
backup=('etc/chilli.conf')
install=chilli.install

prepare() {
  cd "${srcdir}/coova-chilli-${pkgver}"

  ./bootstrap
  ./configure --prefix=/usr --sbindir=/usr/bin/ \
    --sysconfdir=/etc --localstatedir=/var \
    --enable-statusfile \
    --disable-static \
    --enable-shared \
    --enable-largelimits \
    --enable-miniportal \
    --enable-chilliredir \
    --enable-chilliproxy \
    --enable-chilliscript \
    --with-poll \
    --with-openssl \
    --enable-chilliradsec
}

build() {
  cd "${srcdir}/coova-chilli-${pkgver}"
  make
}

package() {
  cd "${srcdir}/coova-chilli-${pkgver}"
  make DESTDIR="${pkgdir}" install

  msg2 "Installing systemd unit for ${pkgname}"
  install -Dm0644 ../chilli.service \
    "${pkgdir}/usr/lib/systemd/system/chilli.service"

  rm -rf "${pkgdir}/etc/init.d"
}

sha256sums=('26b2bead6fd9c18eb736fb0a0f8709922de4e4fedee1122193f82706eb2b9305'
  'cf4e9d610b22729a4dd6257b732d7ed4b01367cde6a330205a5f5c33cdbee578')
