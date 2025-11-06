# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=netperf-git
pkgver=2.7.0.r49.gafc51ff
pkgrel=1
pkgdesc="Benchmarking tool for many different types of networking"
arch=('i686' 'x86_64')
url="https://hewlettpackard.github.io/netperf/"
license=('MIT')
depends=('glibc' 'libsmbios' 'lksctp-tools')
makedepends=('git')
provides=("netperf=$pkgver")
conflicts=('netperf')
source=("git+https://github.com/HewlettPackard/netperf.git"
        "use_AC_USE_SYSTEM_EXTENSIONS.patch::https://patch-diff.githubusercontent.com/raw/HewlettPackard/netperf/pull/74.patch"
        "fix_too_many_arguments_error.patch::https://patch-diff.githubusercontent.com/raw/HewlettPackard/netperf/pull/86.patch")
sha256sums=('SKIP'
            '4b8bf370f3f362a3bf2d68579d4e4ebd023ec8346cece893437fb08226c3b6dd'
            '8dc75da733b5f04030b992408a54dba66942f8996380665d61b70fdb59e40791')


prepare() {
  cd "netperf"

  patch -Np1 -i "$srcdir/use_AC_USE_SYSTEM_EXTENSIONS.patch"
  patch -Np1 -i "$srcdir/fix_too_many_arguments_error.patch"
}

pkgver() {
  cd "netperf"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
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

  #make check
}

package() {
  cd "netperf"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/netperf"
}
