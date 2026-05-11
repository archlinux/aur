# Maintainer: x9x <x9x@keemail.me>
# Fork of cado-nfs-git (upstream AUR)
# Reason: fixes + clean upstream tracking

_pkg=cado-nfs
pkgname=${_pkg}-fork-git
pkgver=20260510.a05f75ba5
pkgrel=1
pkgdesc="Number Field Sieve (NFS) integer factoring implementation (forked git build)"
arch=('x86_64')
url="https://gitlab.inria.fr/cado-nfs/${_pkg}"
license=('LGPL2')

depends=('gmp' 'python' 'sqlite' 'hwloc' 'python-flask' 'python-requests')
makedepends=('git' 'cmake' 'inetutils' 'curl' 'gmp-ecm')

optdepends=(
  'curl: cado-nfs-client.py support'
  'gmp-ecm: polynomial selection tools'
  'perl: bwc scripts'
)

conflicts=('cado-nfs' 'cado-nfs-git')
provides=('cado-nfs')

source=("git+${url}.git")
sha384sums=('SKIP')

pkgver() {
  cd "$_pkg"
  git log -1 --format="%cd.%h" --date=short | sed 's/-//g'
}

prepare() {
  cat > "$_pkg/local.sh" <<EOF
PREFIX=/usr
HWLOC="\$PREFIX"
GMPECM="\$PREFIX"
CURL="\$PREFIX"
FLAGS_SIZE="-DSIZEOF_P_R_VALUES=8 -DSIZEOF_INDEX=8"
EOF
}

build() {
  cd "$_pkg"

  export CFLAGS="${CFLAGS} -Wno-stringop-overflow"
  export CPPFLAGS="${CPPFLAGS} -Wno-stringop-overflow"
  export CXXFLAGS="${CXXFLAGS} -Wno-stringop-overflow"

  make cmake
  make
}

package() {
  cd "$_pkg"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
