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
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "scancache.cxx.patch"
        "clamfs.rc.d")
md5sums=('e1528c48d3b2340b6c3ee83cfb427820'
         'a672569c2caab2cc855cc7df1c9536d8'
         '4fd3f09866fb4bd20098f1da5d011a42')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/scancache.cxx.patch" || return 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install

  # copy sample config file
  install -D -m644 doc/clamfs.xml "${pkgdir}/etc/clamav/clamfs.xml"
  # adjust path to socket
  sed -i -e 's#clamd socket="/var/run/clamav/clamd.ctl"#clamd socket="/var/lib/clamav/clamd.sock"#g' \
            "${pkgdir}/etc/clamav/clamfs.xml"
  # install startup script
  install -D -m755 "${srcdir}/clamfs.rc.d" "${pkgdir}/etc/rc.d/clamfs"
}

# vim:set ts=2 sw=2 et:
