# Maintainer: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Contributor: Dmitry V. Luciv <dluciv@dluciv.name>
# Contributor: Echizen Ryoma <echizenryoma.zhang@gmail.com>
# Contributor: Martchus <martchus@gmx.net>

pkgname=sstp-client
pkgver=1.0.10
pkgrel=4
pkgdesc="SSTP client stable revision"
arch=("i686" "x86_64")
url="http://sstp-client.sourceforge.net/"
license=('GPL2')
conflicts=('sstp-client-svn-stable')
provides=('sstp-client')
depends=('libevent')
makedepends=('gcc' 'ppp>=2.4.6' 'libevent' 'libtool')
optdepends=('ppp>=2.4.6' 'openssl')
install=${pkgname}.install

source=( '50-sstp.PROFILE.sh.sample'
         'sstp.options.sample'
         "http://sourceforge.net/projects/sstp-client/files/sstp-client/${pkgver}/${pkgname}-${pkgver}.tar.gz" )

sha1sums=( '65ad1d0700e8f52ed1e1b21433a99b5962a5a320'  
           'c3a81ad7ce4c8cdbfb53a780110e92cf64412c68'
           '704572fcd543ca3572c68625d87cfe21296eefa2' )

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --localstatedir=/ \
    --with-pppd-plugin-dir=/usr/lib/pppd/${pppd_version} \
    --enable-more-warnings=yes

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}/run/sstpc
  install -d ${pkgdir}/etc/sstpc
  install -d ${pkgdir}/etc/ppp/ip-up.d

  install -Dm644 "${srcdir}/sstp.options.sample" "${pkgdir}/etc/sstpc/sstp.options.sample"
  install -Dm744 "${srcdir}/50-sstp.PROFILE.sh.sample" "${pkgdir}/etc/ppp/ip-up.d/50-sstp.PROFILE.sh.sample"

  rm -rf ${pkgdir}/var
  rm -rf ${pkgdir}/run

  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}
