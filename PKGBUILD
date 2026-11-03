# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-multicolors
_name=Multi-Colors
# The latest commit, versioned like git describe from the commit that set MuCo_VERSION to 2.2.0, as
# upstream has no tags
_commit=d2f2dc9126255571c0fc4499d5729cacb57265ca
pkgver=2.2.0.r3.gd2f2dc9
pkgrel=1
pkgdesc="Multi-Colors, SourceMod include files for coloured chat messages in any game (Colors and More Colors)"
arch=(any)
url="https://github.com/Bara/Multi-Colors"
license=(GPL-3.0-only)
depends=(sourcemod-scripting)
# Where ./aur-packages commits reads the pins from: the commit pkgver names
_pins_lookup() {
  echo "_commit $(curl -fsSL "https://api.github.com/repos/Bara/Multi-Colors/commits/${pkgver##*.g}" | jq -r .sha)"
}
source=("$_name-$_commit.tar.gz::https://github.com/Bara/Multi-Colors/archive/$_commit.tar.gz")
sha512sums=('36fdc4205e49318209687f816de7a97966d1358f96875bae11d8561322a4bcaba358dd5ed3440beac72e11017651a0a02fb3001e87ecd19f64e811d38e23191a')
b2sums=('50a8a2036289318492b0300bc0d2a12117a16e3a9276d8accf351c050d202cca93a21cc9ca5764a7c01e192e6b64a2cca748471e17e0f2d4283bc3b60a163891')

check() {
  # Upstream's test plugin compiles against the include files and SourceMod's
  cd "$_name-$_commit/addons/sourcemod/scripting/tests" || exit
  spcomp64 -i../include -E -w234 -o"$srcdir/test_compile.smx" test_compile.sp
}

package() {
  # The include files for plugins, with SourceMod's in its scripting folder
  local _include="$srcdir/$_name-$_commit/addons/sourcemod/scripting/include"
  local _dest="$pkgdir/usr/lib/sourcemod/addons/sourcemod/scripting/include"
  install -Dm644 "$_include/multicolors.inc" -t "$_dest"
  install -Dm644 "$_include"/multicolors/*.inc -t "$_dest/multicolors"
}
