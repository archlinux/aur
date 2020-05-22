# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname=charybdis
pkgname=charybdis-git
pkgver=charybdis.4.1.2.r160.g458b5d1f
pkgrel=1
pkgdesc='A highly scalable IRCv3-compliant IRCd (development version)'
url='https://charybdis-ircd.github.io/'
license=('GPL2')
options=('!strip')
install=charybdis.install
source=('git+https://github.com/charybdis-ircd/charybdis.git'
        'charybdis.service'
        'charybdis.tmpfiles')
sha256sums=('SKIP'
            'a890d3a4fddd34b475c1c2e5f47f790af3bcebc3539c4a92a7343829fdbce563'
            '2fcc284f060cafa9a6df0b010de44833b248169ab11c6289f54227ab87068c29')
arch=('i686' 'x86_64')
depends=('bison' 'flex' 'openssl' 'zlib')
makedepends=('git')
conflicts=('charybdis')
provides=('charybdis')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

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
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install

  # Install the docs.
  install -Dm644 -d docs "${pkgdir}/usr/share/docs/charybdis"

  # Install the service.
  install -Dm644 "${srcdir}/charybdis.service" "${pkgdir}/usr/lib/systemd/system/charybdis.service"
  install -Dm644 "${srcdir}/charybdis.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/charybdis.conf"
}

# vim: ft=sh ts=2 sw=2 et
