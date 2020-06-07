# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: JD Horelick <jdhore1@gmail.com>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

_pkgname=charybdis
pkgname=charybdis-git
pkgver=4.1.2.r162.gef62a62f
pkgrel=3
pkgdesc='Scalable IRCv3.2 server for large, community-oriented networks (Git)'
arch=('any')
url="https://charybdis-ircd.github.io"
license=('GPL2')
options=('!strip')
depends=('bison' 'flex' 'openssl' 'zlib')
makedepends=('git' 'openssl' 'mbedtls' 'gnutls')
conflicts=("$_pkgname")
provides=("$_pkgname")
install=charybdis.install
source=('git+https://github.com/charybdis-ircd/charybdis.git'
        'charybdis.service'
        'charybdis.tmpfiles')
sha256sums=('SKIP'
            '63c3b8133db0b34c1335471f967147b0e7f78cb5586d3943f24c86e0d2660440'
            '2fcc284f060cafa9a6df0b010de44833b248169ab11c6289f54227ab87068c29')

pkgver() {
  cd "$srcdir/$_pkgname"
  # cutting off 'charybdis-' prefix that presents in the git tag
  git describe --long | sed 's/^charybdis-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  # Set up the build.
  ./autogen.sh

  # Configure the build.
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/charybdis \
    --localstatedir=/var \
    --enable-fhs-paths \
    --with-rundir=/run \
    --enable-openssl \
    --enable-mbedtls \
    --enable-gnutls \
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
