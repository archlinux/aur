# Maintainer: Jonathan Raffre (nekonyuu) <nk@nyuu.eu>
# Contributor (based on): Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname=charybdis
pkgname=charybdis
pkgver=4.1.2
pkgrel=1
pkgdesc='A highly scalable IRCv3-compliant IRCd'
url='http://www.charybdis.io/'
license=('GPL2')
options=('!strip')
install=charybdis.install
source=("https://github.com/charybdis-ircd/charybdis/archive/charybdis-${pkgver}.tar.gz"
        'charybdis.service'
        'charybdis.tmpfiles')
sha256sums=('a3f4e572877c5a3abdab3af652746c0682f0c41b3f9e3c9866315f5d03f2bb57'
            '044f3567ed865365e76581942e1b28ba4f7193dd6c8022616ea0894295272062'
            '2fcc284f060cafa9a6df0b010de44833b248169ab11c6289f54227ab87068c29')
arch=('i686' 'x86_64')
depends=('bison' 'flex' 'openssl' 'zlib')
provides=('charybdis')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  # Configure the build.
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/charybdis \
    --localstatedir=/var \
    --enable-fhs-paths \
    --with-rundir=/run \
    --with-program-prefix=charybdis-

  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  # Install the program.
  make DESTDIR="${pkgdir}" install

  # Install the docs.
  install -Dm644 -d docs "${pkgdir}/usr/share/docs/charybdis"

  # Install the service.
  install -Dm644 "${srcdir}/charybdis.service" "${pkgdir}/usr/lib/systemd/system/charybdis.service"
  install -Dm644 "${srcdir}/charybdis.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/charybdis.conf"
}

# vim: ft=sh ts=2 sw=2 et
