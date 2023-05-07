# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=ntpdate
_pkgname=ntp
_pkgver=4.2.8p15
pkgver=${_pkgver/p/.p}
pkgrel=2
pkgdesc='Client for the Network Time Protocol (NTP)'
url='http://www.ntp.org/'
license=('custom')
arch=('i686' 'x86_64')
makedepends=('perl-html-parser')
depends=('openssl')
conflicts=('ntp' 'ntpdate-dev')
backup=('etc/conf.d/ntpdate.conf')
source=("https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-${pkgver%*.*.*}/${_pkgname}-${_pkgver}.tar.gz"
        "bug_3741.patch"::"https://bugs.ntp.org/attachment.cgi?id=1814"
        "${pkgname}.conf"
        "${pkgname}.service"
        "restore-html2man.patch")
sha256sums=('f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19'
            'c3fbc0766977bb768299ef32823ac234cdd3729b2af893f565cd353b77c54dcf'
            '1ddbf0f51e030c6ec48d50e1b0eb6682f2d51567fbbb8fdd695a0e38a6036fd7'
            '2267e19120de4a73703ed0d83a4a0088309600ce3fed88c3c17a950fa0c1aa85'
            '66abd6828171661f531d221e8ac57baeca7bf6ac96008cf4fa76f8fb840404ce')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  patch -p1 -i "../restore-html2man.patch"
  # Bug 3741 - 4.2.8p15 can't build with glibc 2.34 
  # https://bugs.ntp.org/show_bug.cgi?id=3741
  patch -p1 -i "${srcdir}/bug_3741.patch"

  cp -f "scripts/deprecated/html2man.in" "scripts/"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
  # Convert the html page to man page
  cd "html"
  "../scripts/html2man"
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
  install -m 755 -d "${pkgdir}/usr/share/man/man1"
  install -m 644 -t "${pkgdir}/usr/share/man/man1" "html/man/man1/ntpdate.1"
}

