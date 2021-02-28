# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=netperf-git
pkgver=2.7.0.r48.g3bc455b
pkgrel=1
pkgdesc="Benchmarking tool for many different types of networking"
arch=('i686' 'x86_64')
url="https://hewlettpackard.github.io/netperf/"
license=('MIT')
depends=('glibc' 'libsmbios' 'lksctp-tools')
makedepends=('git')
provides=('netperf')
conflicts=('netperf')
source=("git+https://github.com/HewlettPackard/netperf.git"
        "remove_duplicate_variable_definitions.patch::https://github.com/HewlettPackard/netperf/commit/c6a2e17fe35f0e68823451fedfdf5b1dbecddbe3.patch")
sha256sums=('SKIP'
            'beff59413888ab2961804a195ff68fe5db92183736fedb3bc20bfbba424c2384')


prepare() {
  cd "netperf"

  patch -Np1 -i "$srcdir/remove_duplicate_variable_definitions.patch"
}

pkgver() {
  cd "netperf"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^netperf-//'
}

build() {
  cd "netperf"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-dccp \
    --enable-demo \
    --enable-sctp \
    --enable-unixdomain
  make
}

check() {
  cd "netperf"

  make check
}

package() {
  cd "netperf"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/netperf"
}
