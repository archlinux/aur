# Maintainer: legible7274
_pkgname=sable-electron
pkgname="${_pkgname}-git"
pkgver=r29.139e3cb
pkgrel=1
pkgdesc="Yet another matrix client — Unofficial electron version"
arch=("x86_64")
url="https://github.com/chopper1337/sable-electron"
license=('AGPL3')
makedepends=('git' 'pnpm' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)
source=("${_pkgname}::git+https://github.com/chopper1337/sable-electron.git")
sha256sums=("SKIP")

provides=("sable-electron")
conflicts=('sable-electron')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm i --frozen-lockfile
  pnpm run build:unpack
}

package() {
  cd "$srcdir/$_pkgname"
  # Create necessary directories
  install -d "$pkgdir/usr/lib/$_pkgname"
  install -d "$pkgdir/usr/bin"

  cp -R dist/linux-unpacked/. "$pkgdir/usr/lib/$_pkgname"

  install -Dm644 "../../sable-electron.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop" # Install desktop entry
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Install license
  install -Dm644 "resources/sable.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg" # Install icons

  install -Dm755 "../../sable-electron.sh" "$pkgdir/usr/bin/$_pkgname" # Start script
}
