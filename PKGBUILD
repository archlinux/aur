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
pkgver=0.4.6
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
sha512sums=('dcee3401cea812319521d4e0dd18b8f42050ce60695fd1f99b898d35e63687e136dcbc2abdee1d47e2dc8dd34015312b5d00a10dc51b06782ba473867deb0d00')

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
