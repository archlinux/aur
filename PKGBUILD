#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=tablicious
pkgname=octave-${_pack}
pkgver=0.4.7
pkgrel=1
pkgdesc="Table (relational, tabular data) implementation for GNU Octave"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=(GPL-3.0-or-later)
groups=('octave-forge')
depends=('octave>=7.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("https://github.com/apjanke/${pkgname}/releases/download/v${pkgver}/${_archive}")
noextract=("${_archive}")
sha512sums=('e98e61a43d84da4a41c47e1d1094f11b790bea61f6d200766eeab0d5230d8e73ca76b18c700259534178e5865e7f3b3161df1a965aaa989b59dc9e1d4233ae45')

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
