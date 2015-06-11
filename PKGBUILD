# Contributor: Dmitry V. Luciv <dluciv@dluciv.name>
# Maintainer: Dmitry V. Luciv <dluciv@dluciv.name>

pkgname=sstp-client-svn-stable
pkgrel=8
pkgver=1.0.9 # see no need to make pkgver() function now
pkgdesc="SSTP client tested SVN experimantally stable revision"
arch=("i686" "x86_64")
url="http://sstp-client.sourceforge.net/"
license=('GPL2')
conflicts=()
provides=('sstp-client-svn-stable')
depends=('ppp=2.4.7' 'openssl')
makedepends=('gcc' 'ppp=2.4.7' 'subversion')
optdepends=()
install=${pkgname}.install

source=( 'actual_ppp_version.diff'
         '50-sstp.PROFILE.sh.sample'
         'sstp.options.sample'
         "${pkgname}::svn+https://sstp-client.svn.sourceforge.net/svnroot/sstp-client/branches/${pkgver}" )

md5sums=( 'ce28d5cd37e9f14bf8519857863d7029'
          '77d94e6f536b44c48475c1b25264ffbb'
          '86cf8dd3ab976ae90b399dbad3a477c8'
          'SKIP' )

_pfx="/usr"
_lsd="/"

build() {
  cd "$srcdir/$pkgname"

  msg "Patching to actual ppp..."
  patch -p0 -i ../../actual_ppp_version.diff

  msg "Begin make..."
  ./configure --prefix=${_pfx} --localstatedir=${_lsd}
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}${_lsd}/run/sstpc
  install -d ${pkgdir}${_lsd}/etc/sstpc
  install -d ${pkgdir}${_lsd}/etc/ppp/ip-up.d

  install ../../sstp.options.sample ${pkgdir}${_lsd}/etc/sstpc/sstp.options.sample
  chmod 0644 ${pkgdir}${_lsd}/etc/sstpc/sstp.options.sample
  install ../../50-sstp.PROFILE.sh.sample ${pkgdir}${_lsd}/etc/ppp/ip-up.d/50-sstp.PROFILE.sh.sample
  chmod 0744 ${pkgdir}${_lsd}/etc/ppp/ip-up.d/50-sstp.PROFILE.sh.sample

  rm -rf ${pkgdir}/var

  mv ${pkgdir}${_pfx}/sbin ${pkgdir}/usr/bin
}

# End of file
