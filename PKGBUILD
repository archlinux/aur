# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=kanla
pkgver=1.5
pkgrel=3
pkgdesc="small-scale alerting daemon"
arch=('any')
url="http://kanla.zekjur.net/"
license=('bsd')
depends=('perl' 'perl-anyevent' 'perl-anyevent-xmpp' 'perl-anyevent-http' 'perl-config-general' 'perl-file-sharedir' 'perl-json-xs')
makedepends=('html-xml-utils' 'asciidoc')
source=("http://kanla.zekjur.net/downloads/${pkgname}-${pkgver}.tar.gz" "${pkgname}.sysusers")
install=${pkgname}.install
options=('!emptydirs')
backup=('etc/kanla/default.cfg' 'etc/kanla/default.d/http-example.cfg')
md5sums=('dbecd47dabd36149e59bf06b1b71cbd3'
         'd929f7d1c8885e3af4ca53d62c8707a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="$pkgdir/"

  install -Dm644 Changes \
    "${pkgdir}/usr/share/doc/kanla/Changes"
  install -Dm644 docs/contributions.html \
    "${pkgdir}/usr/share/doc/kanla/contributions.html"
  install -Dm644 docs/userguide.html \
    "${pkgdir}/usr/share/doc/kanla/userguide.html"
  install -Dm644 docs/installing-rhel.html \
    "${pkgdir}/usr/share/doc/kanla/installing-rhel.html"
  install -Dm644 docs/installing-wheezy.html \
    "${pkgdir}/usr/share/doc/kanla/installing-wheezy.html"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 ${pkgdir}/lib/systemd/system/kanla.service \
    "${pkgdir}/usr/lib/systemd/system/kanla.service"
  rm "${pkgdir}/lib/systemd/system/kanla.service"

  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  sed 's#ExecStart=/usr/bin/kanla#ExecStart=/usr/bin/vendor_perl/kanla#' -i \
    "${pkgdir}/usr/lib/systemd/system/kanla.service"
}

# vim:set ts=2 sw=2 sts=2 et:
