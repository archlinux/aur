# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: E-Hern Lee <ehern.lee@gmail.com>
pkgname=ghidra-extension-kaiju-bin
_pkgname=kaiju
pkgver=260309_12.0.4
pkgrel=1
pkgdesc="CERT Kaiju binary analysis improvements for Ghidra (OOAnalyzer, CERT function hashing, GhiHorn)"
arch=('x86_64')
url=https://github.com/CERTCC/kaiju
license=('BSD-3-Clause')
depends=('ghidra')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
optdepends=(
  'z3-java: GhiHorn plugin for CFG analysis'
)
source=("${_pkgname}-${pkgver%%_*}.zip::https://github.com/CERTCC/kaiju/releases/download/${pkgver%%_*}/ghidra_${pkgver#*_}_PUBLIC_20${pkgver%%_*}_kaiju.zip")
sha256sums=('f819a07559c87dae0cc48ddb5ed8aba75541055410a92c3f3054adb9276101ce')

latestver() {
  local gv kv
  gv=$(pacman -Si ghidra 2>/dev/null | awk '/^Version/{print $3; exit}' | sed 's/-.*//')
  [ -z "$gv" ] && return 1
  kv=$(gh api repos/CERTCC/kaiju/releases/latest --jq \
    ".assets[] | select(.name | test(\"ghidra_${gv}_\")) | .name" |
    head -1 | grep -oP '20\K[0-9]+(?=_kaiju)')
  [ -z "$kv" ] && return 1
  echo "${kv}_${gv}"
}

package() {
  cd "$_pkgname"
  rm -rf os/{mac_*,win_*} gradle
  cd ..
  install -d "$pkgdir/opt/ghidra/Ghidra/Extensions"
  cp -a "$_pkgname" "$pkgdir/opt/ghidra/Ghidra/Extensions/"
  install -Dm644 "$_pkgname/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
