# Maintainer: robertfoster

pkgname=coova-chilli-arch
pkgver=1.9
pkgrel=1
pkgdesc='An open-source software access controller'
arch=('x86_64')
url="https://coova.github.io/"
license=('GPL')
depends=('curl' 'libpcap' 'openssl')
makedepends=('gengetopt')
optdepends=('python: for chilli helper scripts')
replaces=('coova-chilli')
provides=('coova-chilli')
conflicts=('coova-chilli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/coova/coova-chilli/archive/$pkgver.tar.gz"
  chilli.service
)
backup=('etc/chilli.conf')
install=chilli.install

prepare() {
  cd "${srcdir}/coova-chilli-${pkgver}"

  ./bootstrap
}

build() {
  cd "${srcdir}/coova-chilli-${pkgver}"

  ./configure --prefix=/usr --sbindir=/usr/bin \
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

  make
}

package() {
  cd "${srcdir}/coova-chilli-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm0644 ../chilli.service \
    "${pkgdir}/usr/lib/systemd/system/chilli.service"

  rm -rf "${pkgdir}/etc/init.d"
}

sha256sums=('78b58189a3f031ab7b6346fe814bd64337940fe1fdbb7e45e32a32f146e7d421'
  'f93473100b7c09898f2450cdddc1a2f9cd2317fb5943f7dd4962c4fde2ba8865')
