# Maintainer: Barna Csorogi <barnacs@justletit.be>
pkgname=repro
pkgver=1.10.2
pkgrel=1
pkgdesc="An open-source, free SIP server"
arch=('any')
url="https://www.resiprocate.org/About_Repro"
license=('custom')
depends=('c-ares' 'asio' 'openssl' 'boost')
makedepends=('git' 'autoconf')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('repro::git+https://github.com/resiprocate/resiprocate.git' 'repro.service')
install='repro.install'
md5sums=('SKIP' 'c74998764639fb1ca7b49aa85d2709dd')

build() {
  cd "$srcdir/${pkgname}"
  git checkout "resiprocate-${pkgver}"
  autoreconf --install
  ./configure --prefix=/usr --sbindir=/usr/bin --with-repro --with-c-ares --with-ssl --enable-ipv6 --enable-dtls --disable-dependency-tracking CPPFLAGS="-I`pwd`/contrib/cajun/include"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "repro/repro.config" "$pkgdir/etc/repro/repro.config"
  install -Dm644 "${srcdir}/repro.service" "${pkgdir}/usr/lib/systemd/system/repro.service"
}
