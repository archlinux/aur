# Contributor: Jonathan Liu <net147@hotmail.com>
pkgname=clamfs
pkgver=1.0.1
pkgrel=4
pkgdesc="A user-space anti-virus protected file system"
arch=('i686' 'x86_64')
url="http://clamfs.sourceforge.net/"
license=('GPL2')
depends=('clamav' 'commoncpp2' 'fuse' 'poco' 'rlog')
makedepends=('boost>=1.33')
backup=('etc/clamav/clamfs.xml')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "scancache.cxx.patch"
        "clamfs.service")
md5sums=('e1528c48d3b2340b6c3ee83cfb427820'
         'a672569c2caab2cc855cc7df1c9536d8'
         '04c1ffa3c132ccfddc2d83c43c4f4bd7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/scancache.cxx.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # copy sample config file
  install -D -m644 doc/clamfs.xml "${pkgdir}/etc/clamav/clamfs.xml"
  # adjust path to socket
  sed -i -e 's#clamd socket="/var/run/clamav/clamd.ctl"#clamd socket="/var/lib/clamav/clamd.sock"#g' \
            "${pkgdir}/etc/clamav/clamfs.xml"
  # install startup script
  install -D -m644 "${srcdir}/clamfs.service" "${pkgdir}/usr/lib/systemd/system/clamfs.service"
}

# vim:set ts=2 sw=2 et:
