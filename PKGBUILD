# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=fsniper-git
_pkgname=fsniper
pkgver=r240.8bec021
pkgrel=2
pkgdesc='Daemon to run scripts based on changes in files monitored by inotify (git)'
url='https://github.com/projectivemotion/fsniper'
license=('GPL3')
depends=('pcre' 'file')
provides=(fsniper)
conflicts=(fsniper)
makedepends=('git')
install=fsniper.install
source=("git+https://github.com/projectivemotion/fsniper" "fsniper.service")
sha256sums=('SKIP'
            'ad278b76022482be1fd2d6836fde450142ff76505b8fd81ab924fc92dba07345')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/${_pkgname}"
  aclocal
  autoconf
  autoheader
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/${_pkgname}/README \
                 ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 ${srcdir}/${_pkgname}/example.conf \
                 ${pkgdir}/usr/share/doc/${pkgname}/example.conf
  install -Dm644 ${srcdir}/fsniper.service ${pkgdir}/usr/lib/systemd/user/fsniper.service
  install -Dm644 doc/* ${pkgdir}/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 ft=sh et:
