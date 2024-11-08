# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='intel-ledmon'
pkgname='ledmon'
pkgver='1.1.0'
pkgrel='1'
pkgdesc='Enclosure LED Utilities'
arch=('x86_64' 'aarch64')
url="https://github.com/intel/${pkgname}"
license=('GPL')
depends=('sg3_utils' 'systemd-libs' 'pciutils')
makedepends=('autoconf-archive' 'check' 'python-pytest')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f626400e41ab1e4317b886db5b5df1afa517e8e4faa80fd4378fd22b0bcd055')

prepare() {
  cd "${pkgname}-${pkgver}"

  autoreconf -fvi
  ./configure \
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
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  pytest --ledctl-binary="src/ledctl/ledctl"
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
