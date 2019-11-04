# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=nostromo
pkgver=1.9.7
pkgrel=1
pkgdesc='A simple, fast, and secure HTTP server'
arch=('i686' 'x86_64')
url='http://www.nazgul.ch/dev_nostromo.html'
license=('custom:ISC')
depends=('openssl')
makedepends=('openssl')
backup=("etc/${pkgname}/conf/nhttpd.conf"
        "etc/${pkgname}/conf/mimes"
        "etc/logrotate.d/${pkgname}")
install=${pkgname}.install
source=("http://www.nazgul.ch/dev/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.logrotate"
        "${pkgname}.patch"
        "${pkgname}.install"
        "LICENSE")
sha256sums=('33c635f317fb441e10d5297bb4218ae0ea62c48f2fc3029c08f5d2167c6cdfca'
            'b630392d6501f963a4405b3737d65facb7b60fce28b46edf3dc0e23efce8ab0d'
            '56d3a07205a8d2c6c06851694ffebf2a5a6a64089eb78c13b0e00f9071a1efbc'
            'b1b52ac532b46217245dbf79403fcb64e1b62fb0151349e364eb6fb8f67f3731'
            '79501227e4129c6ee54fe9a5572ca79f0122eab812ed868d08ec16284909b53b'
            'cd16e1ab175c9ecbaca1a1f0d555930005b120769a1ebad242f4daf17b0b9a47')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../${pkgname}.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/man/man8"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
