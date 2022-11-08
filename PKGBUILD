#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=level-set
pkgname=octave-${_pack}
pkgver=0.3.0
pkgrel=3
pkgdesc="Routines for calculating the time-evolution of the level-set equation and extracting geometric information from the level-set function"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.6.0')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('f461433cf08f26da7eea68121c33232f976b08a634f0ba8cee6aeb017aaaec9c8261e64591657949d21c3e9734b77afd0034b909e2c4e8a6d1fb6393982a51e7')

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
  # https://salsa.debian.org/pkg-octave-team/octave-level-set/-/blob/debian/latest/debian/patches/octave5.patch
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/internal_mesh.cpp
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/geomBoundary.cpp
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/geomElements.cpp
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/geomGamma.cpp
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/internal_fastmarching.cpp
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/internal_init_narrowband.cpp
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/nbFromGeom.cpp
  sed -i 's/error (exc.what ());/error ("%s", exc.what ());/g' ${_pack}/src/upwindGrad.cpp
  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=977012
  sed -i 's/phi.nelem/phi.numel/g' ${_pack}/src/geomGamma.cpp
  sed -i 's/inners.nelem/inners.numel/g' ${_pack}/src/internal_mesh.cpp
  sed -i 's/cellSegs.nelem/cellSegs.numel/g' ${_pack}/src/internal_mesh.cpp
  sed -i 's/idx.length/idx.numel/g' ${_pack}/src/internal_fastmarching.cpp
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
