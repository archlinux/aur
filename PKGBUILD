# Maintainer: James H <james@jamesmcmahon.co.uk>
pkgname=linear-electron-git
pkgver=0.1.1
pkgrel=1
pkgdesc='Unofficial Linear desktop app (linear-electron-git)'
arch=('x86_64' 'aarch64')
url='https://github.com/hughesjs/linear-electron'
license=('MIT' 'LicenseRef-Linear-Brand')
provides=("linear-electron=$pkgver")
conflicts=(linear-electron linear-electron-bin linear-electron-appimage )
options=('!strip' '!debug')
depends=('electron44' 'xdg-utils')
makedepends=('jq' 'git')
source=(linear-electron::git+https://github.com/hughesjs/linear-electron.git#branch=main)
sha256sums=('SKIP')

pkgver() {
  cd linear-electron
  local tag
  tag=$(git describe --tags --match 'v[0-9]*' --abbrev=0 2>/dev/null || true)
  if [[ -n "$tag" ]]; then
    printf '%s.r%s.g%s' "${tag#v}" "$(git rev-list --count "$tag"..HEAD)" "$(git rev-parse --short HEAD)"
  else
    printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd linear-electron
  bash scripts/stage-app.sh "$pkgdir/usr/lib/linear-electron" "$pkgver"
  install -Dm755 packaging/linear-electron-system "$pkgdir/usr/bin/linear-electron"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/linear-electron.desktop "$pkgdir/usr/share/applications/linear-electron.desktop"
  install -Dm644 packaging/linear-electron.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/linear-electron.png"
  install -Dm644 packaging/LINEAR-BRAND-NOTICE "$pkgdir/usr/share/licenses/$pkgname/LINEAR-BRAND-NOTICE"
}
