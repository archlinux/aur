# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname=charybdis
pkgname=charybdis-git
pkgver=latest
pkgrel=1
pkgdesc='A highly scalable IRCv3-compliant IRCd (development version)'
url='http://atheme.org/project/charybdis'
license=('GPL2')
options=('!strip')
install=charybdis.install
source=('git+https://github.com/atheme/charybdis.git'
        'charybdis.service'
        'charybdis.tmpfiles')
sha256sums=('SKIP'
            '044f3567ed865365e76581942e1b28ba4f7193dd6c8022616ea0894295272062'
            '2fcc284f060cafa9a6df0b010de44833b248169ab11c6289f54227ab87068c29')
arch=('i686' 'x86_64')
depends=('bison' 'flex' 'openssl' 'zlib')
makedepends=('git')
conflicts=('charybdis')
provides=('charybdis')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

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
