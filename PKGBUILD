# Maintainer Simone Cimarelli a.k.a. AquilaIrreale <aquilairreale@ymail.com>
# Contributor Jérémie Detrey
# Contributor Christian Cornelssen
# Contributor gilcu3

_pkg=cado-nfs
pkgname=${_pkg}-git
pkgver=20261002.692ecb7e6
pkgrel=1
pkgdesc="Implementation of the Number Field Sieve (NFS) algorithm for factoring integers"
arch=('x86_64')
url="https://gitlab.inria.fr/cado-nfs/${_pkg}"
license=('LGPL-2.1-or-later')
# We configure with optional curl, hwloc, gmp-ecm.
# Configuring with hwloc makes binaries in linalg/bwc depend on it.
depends=('gmp' 'python' 'sqlite' 'hwloc' 'python-flask' 'python-requests' 'fmt')
makedepends=('git' 'cmake' 'inetutils' 'curl' 'gmp-ecm' 'perl')
optdepends=('curl: for cado-nfs-client.py'
            'gmp-ecm: for JL DLP polynomial selection'
            'perl: for bwc.pl')
conflicts=('cado-nfs')
provides=('cado-nfs')
source=("git+${url}.git")
sha384sums=('SKIP')

# Need -march for SIMD support. Makes the resulting package less portable.
_march=native

_update_march()
{
  local flags_no_march=''

  for f in $1; do
    if ! [[ "$f" =~ -march=.* ]]; then
      flags_no_march+=" $f"
    fi
  done

  echo "${flags_no_march} -march=$_march"
}

pkgver() {
  cd "$_pkg"
  git log -1 --format="%cd.%h" --date=short | sed 's/-//g'
}

prepare() {
  cat <<EOF >"$_pkg/local.sh"
PREFIX=/usr
HWLOC="\$PREFIX"
GMPECM="\$PREFIX"
CURL="\$PREFIX"
# Remove 32-bit barriers to big factorizations
FLAGS_SIZE="-DSIZEOF_P_R_VALUES=8 -DSIZEOF_INDEX=8"
# Fixed build tree, instead of the default build/\$(hostname)
build_tree="\${up_path}/build/makepkg"
EOF
}

build() {
  cd "$_pkg"

  CFLAGS="-ffile-prefix-map=${srcdir}=${DBGSRCDIR:-/usr/src/debug}/${pkgbase} $(_update_march "$CFLAGS") -Wno-stringop-overflow -Wno-error=maybe-uninitialized"
  CPPFLAGS="-ffile-prefix-map=${srcdir}=${DBGSRCDIR:-/usr/src/debug}/${pkgbase} $(_update_march "$CPPFLAGS") -Wno-stringop-overflow -Wno-error=maybe-uninitialized"
  CXXFLAGS="-ffile-prefix-map=${srcdir}=${DBGSRCDIR:-/usr/src/debug}/${pkgbase} $(_update_march "$CXXFLAGS") -Wno-stringop-overflow -Wno-error=maybe-uninitialized"

  make cmake
  # cado_config.h embeds CFLAGS/CXXFLAGS as strings, which contain makepkg's
  # -ffile-prefix-map=$srcdir=...; scrub them so binaries don't reference $srcdir
  SRCDIR="$srcdir" perl -pi -e 's/\Q$ENV{SRCDIR}\E/<srcdir>/g' build/makepkg/cado_config.h

  make
}

package() {
  cd "$_pkg"
  make DESTDIR="$pkgdir" install
  # installed for no reason, conflicting with official arch package `gf2x`
  rm -rv "$pkgdir/usr/include/gf2x.h" "$pkgdir/usr/include/gf2x/" "$pkgdir/usr/lib/cado-nfs-3.0.0/gf2x/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
