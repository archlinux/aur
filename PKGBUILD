#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=fl-core
pkgname=octave-${_pack}
pkgver=1.0.0
pkgrel=5
pkgdesc="The package contains code for basic functions in Fuzzy Logic for Octave"
arch=(any)
url="https://octave.sourceforge.io/${_pack}"
license=('custom')
groups=('octave-forge')
depends=('octave>=2.9.7')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}"
  "fl_compose.patch")
noextract=("${_archive}")
sha512sums=('a8eed986eae000aefd371e198e8f49afd18af9931df70c5142f829765f681dc75ebfa7bc920a1ffcf98cca1e7676f6dc6a9fbf2a8c6dd626cb21eb76f1929cbb'
  'c92b0094520075a7363b363ff4a433fe71312a7a95ceecd360ccb8b47065b25a330b25410e1eb36b3f6964df369cdf71a6f30fbc017c1af0bc24d0f989447831')

_octave_run() {
  octave --no-history --no-init-file --no-window-system -q -f --eval "$*"
}

_install_dir() {
  src=$1
  dst=$2
  mkdir -p "$(dirname "$dst")"
  cp -rT "$src" "$dst"
}

prepare() {
  cd "$srcdir"
  tar xzf "$_archive"
  patch -Np0 -i fl_compose.patch
  # https://github.com/macports/macports-ports/blob/master/math/octave-fl-core/files/patch-src-fl_compose.cc.diff
  sed -i 's/is_sparse_type/issparse/g' ${_pack}/src/fl_compose.cc
  sed -i 's/feval/octave::feval/g' ${_pack}/src/fl_compose.cc
  sed -i 's/SparseMatrix((int)colsB, (int)rowsA, (int)(colsB\*rowsA));/SparseMatrix((octave_idx_type)colsB, (octave_idx_type)rowsA, (octave_idx_type)(colsB\*rowsA));/g' ${_pack}/src/fl_compose.cc
  tar czf "$_archive_patched" "$_pack"
}

build() {
  _prefix="$srcdir"/install_prefix
  _archprefix="$srcdir"/install_archprefix
  mkdir -p "$_prefix" "$_archprefix"
  cd "$srcdir"
  _octave_run "$(
    cat <<-EOF
			pkg local_list octave_packages;
			pkg prefix $_prefix $_archprefix;
			pkg install -verbose -nodeps $_archive_patched;
		EOF
  )"
}

package() {
  prefix=$pkgdir/usr/share/octave/packages
  archprefix=$pkgdir/usr/lib/octave/packages
  _install_dir "$srcdir"/install_prefix "$prefix"
  _install_dir "$srcdir"/install_archprefix "$archprefix"
}
