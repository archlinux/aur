#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jonathan Liu <net147@gmail.com>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=communications
pkgname=octave-$_pack
pkgver=1.2.6
pkgrel=1
pkgdesc="Digital Communications, Error Correcting Codes (Channel Code), Source Code functions, Modulation and Galois Fields"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=4.4.0' 'octave-signal>=1.1.3')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
source=("http://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('562b85370d377d6e940430bf0531cf812ac1907e55f2d0a7ca4380876befbe4fa2a44bfcf6484505c9f17c67e44993bf1e3ae29b881320a048259172273bb8ec')

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
