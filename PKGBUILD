# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=opendnssec-git
pkgver=2.1.13.r590.g0f12f88a3
pkgrel=1
pkgdesc="An open-source turn-key solution for DNSSEC"
arch=('i686' 'x86_64')
url="https://www.opendnssec.org/"
license=('BSD')
depends=('glibc' 'jansson' 'ldns' 'libmicrohttpd' 'libxml2' 'libyaml' 'openssl' 'sqlite')
makedepends=('git')
checkdepends=('cunit')
optdepends=('sh' 'softhsm')
provides=("opendnssec=$pkgver")
conflicts=('opendnssec')
backup=(etc/opendnssec/{addns,conf,kasp,zonelist}.xml)
source=("git+https://github.com/opendnssec/opendnssec.git")
sha256sums=('SKIP')


pkgver() {
  cd "opendnssec"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "opendnssec"

  sh autogen.sh
  ./configure \
    --prefix="/usr" \
    --localstatedir="/var/lib" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc"
  make
}

check() {
  cd "opendnssec"

  #make check
}

package() {
  cd "opendnssec"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/opendnssec"
}
