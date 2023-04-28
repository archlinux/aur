# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: vigo <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=libwrap
pkgver=7.6.31
pkgrel=5
pkgdesc='Monitors and Controls incoming TCP connections'
arch=(x86_64)
url="http://ftp.porcupine.org/pub/security/index.html"
license=(BSD)
depends=( glibc libnsl)
provides=(tcp_wrappers-libs)
conflicts=(tcp_wrappers-libs)
source=(
  http://ftp.porcupine.org/pub/security/tcp_wrappers_${pkgver%.*}.tar.gz
  http://http.debian.net/debian/pool/main/t/tcp-wrappers/tcp-wrappers_${pkgver%.*}.q-${pkgver##*.}.debian.tar.xz
  tcp-wrappers-redhat-bug11881.patch
  hosts.allow
  hosts.deny
)
sha256sums=('9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d'
            '20fec7826bde1262007e6dd43f365b5802bacc283942d93b78385ea634dc594a'
            '2e527e54c1ea208de10a206c667f751e54651eb77c973271d213e3459d690403'
            'c1b19035a14ba552e8795ec3d7171e688592c9317f2eb14373320315435565e3'
            '969414f0a161e95fbe4cfe32df7c657a2793734d09416c00fa1116c5c0a9924f')

prepare() {
  cd tcp_wrappers_${pkgver%.*}

  for patch in $(cat ../debian/patches/series); do
    patch -Np1 -i ../debian/patches/${patch}
  done
  patch -Np1 -i ../tcp-wrappers-redhat-bug11881.patch

  sed -i '/^config-check/ i\
cflags: config-check\
' Makefile
}

build() {
  cd tcp_wrappers_${pkgver%.*}

  # first run of make fails but second succeeds!???
  # if you read this, please help me find a better fix than to run twice make
  make \
    COPTS="$CFLAGS" \
    LDOPTS="$LDFLAGS" \
    REAL_DAEMON_DIR=/usr/bin \
    STYLE='-DPROCESS_OPTIONS' \
    linux || make \
    COPTS="$CFLAGS" \
    LDOPTS="$LDFLAGS" \
    REAL_DAEMON_DIR=/usr/bin \
    STYLE='-DPROCESS_OPTIONS' \
    linux
}

package() {

  cd tcp_wrappers_${pkgver%.*}

  install -Dm 644 tcpd.h -t "${pkgdir}"/usr/include/
  install -Dm 644 shared/libwrap.so.0.${pkgver%.*} -t "${pkgdir}"/usr/lib/
  ln -s libwrap.so.0.${pkgver%.*} "${pkgdir}"/usr/lib/libwrap.so.0
  ln -s libwrap.so.0 "${pkgdir}"/usr/lib/libwrap.so

  install -Dm 644 DISCLAIMER -t "${pkgdir}"/usr/share/licenses/libwrap/
}


# vim: ts=2 sw=2 et:
