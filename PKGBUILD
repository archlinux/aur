# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=softhsm-git
pkgver=2.6.1.r132.gf4661af
pkgrel=1
pkgdesc="Software PKCS#11 store"
arch=('i686' 'x86_64')
url="https://www.opendnssec.org/softhsm/"
license=('BSD')
depends=('gcc-libs' 'botan' 'openssl' 'p11-kit')
makedepends=('git' 'sqlite')
checkdepends=('cppunit')
provides=("softhsm=$pkgver")
conflicts=('softhsm')
backup=('etc/softhsm2.conf')
options=('staticlibs')
source=("git+https://github.com/opendnssec/SoftHSMv2.git")
sha256sums=('SKIP')


pkgver() {
  cd "SoftHSMv2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "SoftHSMv2"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --localstatedir="/var" \
    --sysconfdir="/etc" \
    --enable-ecc \
    --enable-eddsa \
    --enable-visibility \
    --with-migrate
  make
}

check() {
  cd "SoftHSMv2"

  #make check
}

package() {
  cd "SoftHSMv2"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/softhsm"

  rm "$pkgdir/etc/softhsm2.conf.sample"
}
