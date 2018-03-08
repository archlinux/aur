# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Fabiano Furtado - fusca < fusca14 *at* gmail *dot* com >

set -u
pkgname='pev'
pkgver='0.80'
pkgrel='1'
pkgdesc='Command line based tool for Windows portable executable PE32+ file analysis'
arch=('i686' 'x86_64')
url='http://pev.sourceforge.net/'
license=('GPL')
depends=('glibc' 'openssl-1.0' 'pcre')
_verwatch=('https://sourceforge.net/projects/pev/rss' ".*<title>.*/${pkgname}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
#source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f68c8596f16d221d9a742812f6f728bcc739be90957bc1b00fbaa5943ffc5cfa')

prepare() {
  set -u
  cd "${pkgname}"
  # Changes to correct hard coded destdir in Makefiles (bad practice from upstream)
  #sed -i "s|\$(DESTDIR)/\$(PREFIX)/bin|\$(DESTDIR)\$(PREFIX)/bin|" src/Makefile
  #sed -i "s|/usr/share/pev|${pkgdir}/usr/share/pev|" src/Makefile
  #sed -i "s|/usr/share/man/man1|${pkgdir}/usr/share/man/man1|" src/Makefile
  #sed -i "s|\$(DESTDIR)/\$(PREFIX)/lib|\$(DESTDIR)\$(PREFIX)/lib|" lib/libpe/Makefile

  #sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" src/Makefile
  #sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" lib/libpe/Makefile
  sed -e 's:/usr/local/:/usr/:g' -i 'src/config.c'
  set +u
}

build() {
  set -u
  cd "${pkgname}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  CFLAGS="${CFLAGS} -isystem /usr/include/openssl-1.0/ -L /usr/lib/openssl-1.0/" \
  nice make -j "${_nproc}" prefix='/usr' # not sure if prefix is needed
  set +u
}

package() {
  set -u
  cd "${pkgname}"
  #make datarootdir="${pkgdir}/usr/share" datadir="${pkgdir}/usr/share" DESTDIR="${pkgdir}" install
  make prefix='/usr' DESTDIR="${pkgdir}" install
  set +u
}
set +u
