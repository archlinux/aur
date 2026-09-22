# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='intel-ledmon'
pkgname='ledmon'
pkgver='1.1.0'
pkgrel='3'
pkgdesc='Enclosure LED Utilities'
arch=('x86_64' 'aarch64')
_uri="github.com/md-raid-utilities/${pkgname}"
url="https://${_uri}"
license=('GPL')
depends=('sg3_utils' 'systemd-libs' 'pciutils')
makedepends=('autoconf-archive')
checkdepends=('check' 'python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('4f626400e41ab1e4317b886db5b5df1afa517e8e4faa80fd4378fd22b0bcd055')

prepare() {
  sed --in-place \
    --expression '/FORTIFY_SOURCE/d' \
  "${pkgname}-${pkgver}/configure.ac"
}

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fvi
  ./configure CFLAGS="${CFLAGS} ${DEBUG_CFLAGS}" \
    CXXLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}" \
    LDFLAGS="${LDFLAGS}" \
    --prefix="/usr" \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --libdir="/usr/lib" \
    --datarootdir="/usr/share" \
    --datadir="/usr/share" \
    --enable-systemd \
    --enable-library \
    --enable-test \
    --enable-doc
  make VERBOSE=1
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest --ledctl-binary="src/ledctl/ledctl"
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
