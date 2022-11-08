#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=lssa
pkgname=octave-${_pack}
pkgver=0.1.4
pkgrel=1
pkgdesc="A package implementing tools to compute spectral decompositions of irregularly-spaced time series.  Currently includes functions based off the Lomb-Scargle periodogram and Adolf Mathias' implementation for R and C"
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
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('dfda6f14bca8164c915442c52a845fad323ec60e445df3c1461e40ff6b887a5ebe81a207bc4756eb58a1d26a27780b67f052a4986eb20f6e5c20ddc8293ec87d')

_octave_run() {
  octave --no-history --no-init-file --no-window-system -q -f --eval "$*"
}

_install_dir() {
  src=$1
  dst=$2
  mkdir -p "$(dirname "$dst")"
  cp -rT "$src" "$dst"
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
		pkg install -verbose -nodeps $_archive;
		EOF
  )"
}

package() {
  prefix=$pkgdir/usr/share/octave/packages
  archprefix=$pkgdir/usr/lib/octave/packages
  _install_dir "$srcdir"/install_prefix "$prefix"
  _install_dir "$srcdir"/install_archprefix "$archprefix"
}
