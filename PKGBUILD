# Maintainer: xihale <i@xihale.top>
# Contributor: xihale <i@xihale.top>
pkgname=noir-audit-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Desktop Android privacy audit TUI: audits app permissions, reporting endpoints and data flows over adb, with reversible fixes (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Verlintas/NOIR'
license=('MIT')
depends=('android-tools')
optdepends=(
  'jadx: decompile single APKs for deep analysis'
)
provides=('noir-audit')
options=('!strip')

source=('LICENSE::https://raw.githubusercontent.com/Verlintas/NOIR/v'"$pkgver"'/LICENSE')
sha256sums=('5cff0504757e04b6c4cf1aed536a2618ac0f3df2c8f3365a67fbf12630bad7f4')
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/Verlintas/NOIR/releases/download/v$pkgver/noir-v$pkgver-Linux-portable.zip")
sha256sums_x86_64=('a1e8ccb34ed62477a71753587f000192a5fdb6ecffa8e776582883b0c5bdc050')

package() {
  local _dest="$pkgdir/opt/$pkgname"

  # jpackage layout: bin/NOIR launcher + lib/app jars + bundled JDK runtime;
  # the launcher resolves lib/ relative to itself, so the tree is relocatable.
  install -dm755 "$_dest"
  cp -a "$srcdir/NOIR/." "$_dest/"

  # Upstream zip perms are inconsistent; normalize and set executables.
  find "$_dest" -type d -exec chmod 0755 {} +
  find "$_dest" -type f -exec chmod 0644 {} +
  chmod 0755 "$_dest/bin/NOIR"
  find "$_dest/lib/runtime/bin" -type f -exec chmod 0755 {} +
  chmod 0755 "$_dest/lib/runtime/lib/jspawnhelper"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/NOIR" "$pkgdir/usr/bin/noir-audit"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
