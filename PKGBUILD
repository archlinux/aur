# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=ntpdate
_pkgname=ntp
_pkgver=4.2.8p18
pkgver=${_pkgver/p/.p}
pkgrel=1
pkgdesc='Client for the Network Time Protocol (NTP)'
url='http://www.ntp.org/'
license=('LicenseRef-custom')
arch=('i686' 'x86_64')
depends=('openssl')
conflicts=('ntp' 'ntpdate-dev')
backup=('etc/conf.d/ntpdate.conf')
source=("https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-${pkgver%*.*.*}/${_pkgname}-${_pkgver}.tar.gz"
        "bug_3926_pthread_detach.patch"::"https://gitlab.archlinux.org/archlinux/packaging/packages/ntp/-/raw/4ab37fa86a6e3ffb1e53a2f415098ff934640b26/ntp-4.2.8.p18-fix-build.patch?inline=false"
        "${pkgname}.conf"
        "${pkgname}.service")
sha256sums=('cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5'
            '9c4afa0daed5fd3cc9544ec808b2bb1dd959e5d40c4cae307b7025b16885903c'
            '1ddbf0f51e030c6ec48d50e1b0eb6682f2d51567fbbb8fdd695a0e38a6036fd7'
            '2267e19120de4a73703ed0d83a4a0088309600ce3fed88c3c17a950fa0c1aa85')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  # https://bugs.ntp.org/show_bug.cgi?id=3926
  # https://gitlab.archlinux.org/archlinux/packaging/packages/ntp/-/issues/3
  patch -N -p1 -i "${srcdir}/bug_3926_pthread_detach.patch"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  install -m 755 -d "${pkgdir}/etc/conf.d"
  install -m 644 -t "${pkgdir}/etc/conf.d" "${pkgname}.conf"
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" "${pkgname}.service"

  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname}/${pkgname}"
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYRIGHT"
}

