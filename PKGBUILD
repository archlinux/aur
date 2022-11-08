#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=fits
pkgname=octave-${_pack}
pkgver=1.0.7
pkgrel=3
pkgdesc="The Octave-FITS package provides functions for reading, and writing FITS (Flexible Image Transport System) files.  This package uses the libcfitsio library"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=3.0.0')
makedepends=('cfitsio')
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('e9dc1cdab6262946564c9ae34591100d938146bb8e4631ae7fb7b2eb33aaa0246312ac274d14de23d101b8d1533d825778c9fbb31ecd68a1c78f01e2e48812ba')

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
  # https://git.altlinux.org/srpms/o/octave-fits.git?p=octave-fits.git;a=blob;f=octave-package-fits.spec;hb=HEAD#l41
  sed -i 's/D_NINT/octave::math::x_nint/g' ${_pack}-${pkgver}/src/*.cc
  tar czf "$_archive_patched" "$_pack-$pkgver"
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
