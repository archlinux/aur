# Maintainer: Isabelle COWAN-BERGMAN « izzi at izzette．com »
# Contributor: Felix Braun <hazzl@falix.de>
pkgbase='zbackup-davidbartonau'
pkgname=("$pkgbase" "$pkgbase-tartool" "$pkgbase-compat")
pkgver=1.5
pkgrel=1
pkgdesc='A versatile deduplicating backup tool'
arch=('i686' 'x86_64')
url='https://github.com/davidbartonau/zbackup'
license=('GPL2')
depends=('xz' 'openssl' 'protobuf')
makedepends=('cmake')
checkdepends=('python')
conflicts=('zbackup' 'zbackup-git')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('ad15fe626eefdb835ec81e0a2d38892c')

prepare() {
  declare -a cmakeflags=(-DCMAKE_INSTALL_PREFIX='/usr'
                         -DCMAKE_CXX_STANDARD='11')

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "$srcdir/zbackup-$pkgver"  "${cmakeflags[@]}"

  mkdir -p "$srcdir/build-tartool"
  cd "$srcdir/build-tartool"
  cmake "$srcdir/zbackup-$pkgver/tools/tartool" "${cmakeflags[@]}"
}

build() {
  make -C "$srcdir/build"
  make -C "$srcdir/build-tartool"
}

check() {
  cd "$srcdir/zbackup-$pkgver"

  rm -rf "$srcdir/test"
  mkdir "$srcdir/test"

  # TODO: Run the other tests and run with encryption.
  echo "Running regression tests ..."
  python tests/regression/regression.py \
    --zbackup "$srcdir/build/zbackup" \
    --tmp "$srcdir/test" \
    --samples "$srcdir/zbackup-$pkgver" \
    --seed 123 \
    --loops 1 \
    --add-per-loop 60 \
    --delete-per-loop 50 \
    --log-level 1 || return 1
}

package_zbackup-davidbartonau() {
  optdepends=("$pkgbase-tartool: utility to make filesystem backups with tar and zbackup")
  make -C "$srcdir/build" DESTDIR="$pkgdir" install
}

package_zbackup-davidbartonau-tartool() {
  depends+=('tar')
  pkgdesc+=" (tartool)"
  make -C "$srcdir/build-tartool" DESTDIR="$pkgdir" install
}

package_zbackup-davidbartonau-compat() {
  pkgdesc+=" (metapackage including zbackup + tartool)"
  depends=("$pkgbase" "$pkgbase-tartool")
  provides=('zbackup' 'zbackup-git')
}
