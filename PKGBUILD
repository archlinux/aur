# Maintainer: orlfman <25542856+orlfman@users.noreply.github.com>
# Published source asset, pinned to this version and its SHA-256.
# Local development snapshots: tools/prepare-package.py (bump version before releasing changes).
pkgname=plasma6-themes-nobara-fixed
pkgver=0.1.0
pkgrel=1
pkgdesc="Nobara appearance for Plasma 6.8 with wallpapers, icons, GTK and Konsole themes"
arch=('any')
url='https://github.com/orlfman/nobara-plasma-6.8'
# Inventory of retained upstream declarations; original notices are preserved.
license=('GPL-2.0-only' 'GPL-2.0-or-later' 'GPL-3.0-only' 'LGPL-2.0-or-later')
depends=('plasma-workspace>=6.8' 'plasma-desktop>=6.8'
         'breeze>=6.8' 'breeze-cursors>=6.8' 'breeze-gtk>=6.8'
         'papirus-icon-theme>=20260801')
checkdepends=('python')
optdepends=('konsole: use the Nobara terminal profile and colors'
            'plasma-login-manager: apply Nobara appearance to the Plasma login screen')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f7792e814c7cd92b95e01aeded9984db3c395b96e96194c9c55e4cafa7d04a21')

check() {
  cd "$pkgname-$pkgver"
  python -I tools/check-package.py --source
  python -I tools/check-theme.py
  python -I tools/build-icons.py --check
}

package() {
  cd "$pkgname-$pkgver"
  local resource
  while IFS= read -r resource; do
    [[ -z $resource || $resource == \#* ]] && continue
    install -dm755 "$pkgdir/$(dirname "$resource")"
    cp -a --no-preserve=ownership -- "$resource" "$pkgdir/$resource"
  done < packaging/install-manifest.txt

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md CHANGELOG.md AUDIT.md SOURCE.txt UPSTREAM-NOTICES.md \
    ICONS.md PLASMA-LOGIN.md PERFORMANCE.md PACKAGING.md
  install -Dm644 packaging/install-manifest.txt \
    "$pkgdir/usr/share/doc/$pkgname/install-manifest.txt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
