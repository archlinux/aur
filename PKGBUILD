# Maintainer: dreieck
# Contributor: Vasco Costa <vasco dot costa at geekslot dot com>
# Contributor: jaro3

pkgname=wwwoffle
pkgver=2.9i
pkgrel=4
pkgdesc="Simple caching proxy server with special features for use with dial-up internet links. Includes startup scripts for OpenRC, System V init, systemd."
arch=('i686' 'x86_64' 'arm' 'arm64')
url="http://www.gedanken.org.uk/software/wwwoffle/"
license=('GPL')
depends=('zlib' 'gnutls' 'libgcrypt')
provides=(
          "wwwoffle-sysvinit=${pkgver}"
          "wwwoffle-openrc=${pkgver}"
          "wwwoffle-systemd=${pkgver}"
         )
backup=('etc/wwwoffle/wwwoffle.conf')
install="${pkgname}.install"
source=(
  "http://www.gedanken.org.uk/software/wwwoffle/download/${pkgname}-${pkgver}.tgz"
  'conf_d_wwwoffle'
  'initscript_openrc'
  'initscript_systemd'
  'initscript_sysvinit'
  "${install}"
)

sha256sums=('e6341a4ec2631dc22fd5209c7e5ffe628a5832ad191d444c56aebc3837eed2ae'
            'cd05738f73b109dd074f6dd919300eeae55c2aa812a15e0ae61b32622423c867'
            '0d5bfcd1e348f6bdad042f780b2ea8a235314d5750a66ae008a0ea391bc5cc11'
            '04fd88f2a100e3ff9a96da6a70e58457252722cbf6350ffdbf08f17e62b64869'
            '47f3df8ed05888452c00f8246f97456a4c55499b67e59c40da272b0e7fb1f2df'
            '87eb11ad6e43eb9ac866806e413b187196d2d3b9383de76139d4e4ff71ffe855')

build() {
  _unpackeddir="${srcdir}/${pkgname}-${pkgver}"
  cd "${_unpackeddir}"
  
  ./configure \
    --prefix=/usr \
    --with-zlib=/usr/include \
    --with-gnutls=/usr/include/gnutls \
    --with-gcrypt=/usr/include \
    --with-ipv6 \
    --with-spooldir=/var/spool/wwwoffle \
    --with-confdir=/etc/wwwoffle \
    --with-default-language=en \
    --sbindir=/usr/bin
  
  make || return 1
}

package() {
  _unpackeddir="${srcdir}/${pkgname}-${pkgver}"
  cd "${_unpackeddir}"/etc/init.d/wwwoffle
  
  make DESTDIR="${pkgdir}" install

  install -D -m755 "${srcdir}/initscript_sysvinit" "${pkgdir}/etc/rc.d/wwwoffle"
  install -D -m755 "${srcdir}/initscript_openrc" "${pkgdir}/etc/init.d/wwwoffle"
  install -D -m644 "${srcdir}/initscript_systemd" "${pkgdir}/usr/lib/systemd/system/wwwoffle.service"
  install -D -m644 "${srcdir}/conf_d_wwwoffle" "${pkgdir}/etc/conf.d/wwwoffle"
  sed -i -e 's/^#run-uid.*/ run-uid           = wwwoffle/' \
    "${pkgdir}/etc/wwwoffle/wwwoffle.conf"
  sed -i -e 's/^#run-gid.*/ run-gid           = wwwoffle/' \
    "${pkgdir}/etc/wwwoffle/wwwoffle.conf"
}
