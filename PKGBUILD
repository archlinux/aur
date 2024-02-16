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
pkgver=0.4.2
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
sha512sums=('d984e0faf073b9ccdce3f76d798ff5a3643cfadbd0572eef73c3876a0c88d2db0aa15c8cc1d25e37d5494bcd2762d95bcaa3cc2798c44fead7dff06af34e0bb2')

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
