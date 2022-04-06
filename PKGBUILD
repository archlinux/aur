# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>
# Contributor: András Wacha <wacha dot andras at ttk dot mta dot hu>

pkgname=fsniper
pkgver=1.3.1
pkgrel=4
pkgdesc='Daemon to run scripts based on changes in files monitored by inotify'
url='http://projects.l3ib.org/fsniper/'
license=('GPL3')
depends=('pcre' 'file')
makedepends=('autoconf' 'automake' 'libtool' 'gcc')
provides=(fsniper)
conflicts=(fsniper-git)
install=fsniper.install
source=("http://web.archive.org/web/20180624104931/http://projects.l3ib.org/fsniper/files/${pkgname}-${pkgver}.tar.gz"
        "wait3_argument.patch"
        "fsniper.service")
sha256sums=('e65a34221fc05eb7ececcd2fb783e3418de032f89082e09be3a8f75f6b056e6b'
            '60e8390538728b463845c595cb035529fbaaa311a54b6a12eaee2c53688de55d'
            'ad278b76022482be1fd2d6836fde450142ff76505b8fd81ab924fc92dba07345')
arch=('i686' 'x86_64')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 <${srcdir}/wait3_argument.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  aclocal
  autoconf
  autoheader
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/README \
                 ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/example.conf \
                 ${pkgdir}/usr/share/doc/${pkgname}/example.conf
  install -Dm644 ${srcdir}/fsniper.service ${pkgdir}/usr/lib/systemd/user/fsniper.service
  install -Dm644 doc/* ${pkgdir}/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 ft=sh et:
