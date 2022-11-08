#
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wangjiezhe <wangjiezhe@gmail.com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=vibes
pkgname=octave-${_pack}
pkgver=0.2.0
pkgrel=3
pkgdesc="The VIBes API allows one to easily display results (boxes, pavings) from interval methods"
arch=(any)
url="https://gnu-octave.github.io/packages/${_pack}"
license=('custom')
groups=('octave-forge')
depends=('octave>=4.0.0')
makedepends=()
optdepends=()
backup=()
options=()
install=${pkgname}.install
_archive=${_pack}-${pkgver}.tar.gz
_archive_patched=${_pack}-${pkgver}-patched.tar.gz
source=("https://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha512sums=('dfe766da20a62e58c1410b3b9956c4d4e7e66bba56c32deddab222c619a1924c2de275d4bf68eeb4f333278326c1c14dde896b158df2b5306259b60f1f91f270')

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
  # https://savannah.gnu.org/bugs/?59376
  sed -i 's/^  if (args(0).is_cellstr ())/  if (args(0).iscellstr ())/g' ${_pack}-${pkgver}/src/__vibes__.cpp
  # https://salsa.debian.org/pkg-octave-team/octave-vibes/-/blob/debian/latest/debian/patches/octave5.patch
  sed -i 's/^      error (e.what ());/      error ("%s", e.what ());/g' ${_pack}-${pkgver}/src/__vibes__.cpp
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
