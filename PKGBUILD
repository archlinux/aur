# Contributor: Dmitry V. Luciv <dluciv@dluciv.name>, Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>

pkgname=sstp-client
pkgrel=1
pkgver=1.0.10
pkgdesc="SSTP client stable revision"
arch=("i686" "x86_64")
url="http://sstp-client.sourceforge.net/"
license=('GPL2')
conflicts=('sstp-client-svn-stable')
provides=('sstp-client')
depends=('libevent')
makedepends=('gcc' 'ppp>=2.4.6' 'libevent')
optdepends=('ppp>=2.4.6' 'openssl')
install=${pkgname}.install

source=( '50-sstp.PROFILE.sh.sample'
         'sstp.options.sample'
         "http://sourceforge.net/projects/sstp-client/files/sstp-client/${pkgver}/${pkgname}-${pkgver}.tar.gz" )

sha512sums=( '56859f24a3599d3f68f432e36661f43e08aeb8cb3bf959ddede6028a426117c06f0221ffd91c852bf9f4f34069d8adc7a199db6679f75daf508713e12735484d'  
             'a817dbfc9038f240bf0cbed295b654587070226c71fbf89fee4cd6a6d7912629cb2e15e7ae2b74c9a5e42e756bc6819c95bbb493503ac6921b4b01a571bf5430'
             '8f3e4b1b4d795015230b3a1b8aabf7d5fddd89be511bd6a59c22e5414520a392ba430f66f30aa2b982f084955e0085b0ea66d5acf5fd00414dc37c2c52a78cb7' )

_pfx="/usr"
_lsd="/"

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=${_pfx} \
    --localstatedir=${_lsd} \
    --with-pppd-plugin-dir=/usr/lib/pppd/${pppd_version} \
    --enable-more-warnings=yes

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}${_lsd}/run/sstpc
  install -d ${pkgdir}${_lsd}/etc/sstpc
  install -d ${pkgdir}${_lsd}/etc/ppp/ip-up.d

  install ../../sstp.options.sample ${pkgdir}${_lsd}/etc/sstpc/sstp.options.sample
  chmod 0644 ${pkgdir}${_lsd}/etc/sstpc/sstp.options.sample
  install ../../50-sstp.PROFILE.sh.sample ${pkgdir}${_lsd}/etc/ppp/ip-up.d/50-sstp.PROFILE.sh.sample
  chmod 0744 ${pkgdir}${_lsd}/etc/ppp/ip-up.d/50-sstp.PROFILE.sh.sample

  rm -rf ${pkgdir}/var
  rm -rf ${pkgdir}/run

  mv ${pkgdir}${_pfx}/sbin ${pkgdir}/usr/bin
}
