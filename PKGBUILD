#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=bim
pkgname=octave-${_pack}
pkgver=1.1.8
pkgrel=1
pkgdesc="Package for solving Diffusion Advection Reaction (DAR) Partial Differential Equations"
arch=(any)
url="https://github.com/carlodefalco/${_pack}"
license=('GPL')
groups=('octave-forge')
depends=('octave>=3.8.0' 'octave-fpl' 'octave-msh')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("${_archive}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${_archive}")
sha512sums=('12082e82d4e7ecf4a6df86be2dc956bfa479f328a3c8fd5ea5fa9a18f05abf6ba840a3147156c653b40c120a133624dbf178e51f2883cc01d5c1fbb368c64507')

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
