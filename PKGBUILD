# Maintainer: Jonathan Raffre (nekonyuu) <nk@nyuu.eu>
# Contributor (based on): Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname=charybdis
pkgname=charybdis
pkgver=4.1.2
pkgrel=2
pkgdesc='A highly scalable IRCv3-compliant IRCd'
url='https://https://charybdis-ircd.github.io/'
license=('GPL2')
options=('!strip')
install=charybdis.install
source=("https://github.com/charybdis-ircd/charybdis/archive/charybdis-${pkgver}.tar.gz"
        'charybdis.service'
        'charybdis.tmpfiles')
sha256sums=('a3f4e572877c5a3abdab3af652746c0682f0c41b3f9e3c9866315f5d03f2bb57'
            'a890d3a4fddd34b475c1c2e5f47f790af3bcebc3539c4a92a7343829fdbce563'
            '2fcc284f060cafa9a6df0b010de44833b248169ab11c6289f54227ab87068c29')
arch=('i686' 'x86_64')
depends=('bison' 'flex' 'openssl' 'zlib')
conflicts=('charybdis-git')
provides=('charybdis')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"

  # Set up the build.
  ./autogen.sh

  # Configure the build.
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
