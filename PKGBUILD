# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=softhsm
pkgver=2.0.0
pkgrel=1
pkgdesc="Software PKCS11 store"
arch=('i686' 'x86_64')
url="http://www.opendnssec.org/softhsm/"
license=('BSD')
groups=()
depends=('botan>=1.10' 'sqlite3>=3.4.2' 'openssl>=1.0.0')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("etc/softhsm.conf")
options=(!libtool)
install=
changelog=
source=("http://www.opendnssec.org/files/source/${pkgname}-${pkgver}.tar.gz")
noextract=()

sha256sums=('eae8065f6c472af24f4c056d6728edda0fd34306f41a818697f765a6a662338d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # /usr/lib/softhsm -> /usr/bin (no subdirectory)
  sed -i \
  -e "s/full_libdir=\"\$full_libdir\/softhsm\"/#full_libdir=\"\$full_libdir\/softhsm\"/" \
  -e "s/libdir=\$full_libdir/#libdir=\$full_libdir/" \
  configure

  ./configure --prefix=/usr --datarootdir=/usr/share --localstatedir=/var --sysconfdir=/etc --with-botan=/usr --with-migrate
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm0644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/softhsm/LICENSE"
}
