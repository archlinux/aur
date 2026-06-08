# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: E-Hern Lee <ehern.lee@gmail.com>
pkgname=ghidra-extension-kaiju-bin
_pkgname=kaiju
pkgver=260608_12.1.2
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
sha256sums=('6952358d761b178b7ab2eb3001b3ebf17331d080ee8ce7f9660664d216cf417f')

latestver() {
  local gv kv try
  gv=$(pacman -Si ghidra 2>/dev/null | awk '/^Version/{print $3; exit}' | sed 's/-.*//')
  [ -z "$gv" ] && return 1
  # Asset Ghidra version may omit trailing components (12.1.2 -> 12.1 in asset name)
  try=$gv
  while [ -n "$try" ]; do
    kv=$(gh api --paginate repos/CERTCC/kaiju/releases --jq \
      ".[] | select(.prerelease == false and .draft == false) | .assets[] | select(.name | test(\"ghidra_${try}_\")) | .name" |
      head -1 | grep -oP '20\K[0-9]+(?=_kaiju)')
    [ -n "$kv" ] && break
    # Strip last version component and retry
    try=${try%.*}
    [[ "$try" == *"."* ]] || break
  done
  [ -z "$kv" ] && return 1
  echo "${kv}_${try}"
}

package() {
  cd "$_pkgname"
  rm -rf os/{mac_*,win_*} gradle
  cd ..
  install -d "$pkgdir/opt/ghidra/Ghidra/Extensions"
  cp -a "$_pkgname" "$pkgdir/opt/ghidra/Ghidra/Extensions/"
  install -Dm644 "$_pkgname/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
