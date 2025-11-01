# Maintainer: Enova
_pkgname=cinny-electron
pkgname="${_pkgname}-git"
pkgver=r10.79afa5e
pkgrel=1
pkgdesc="Yet another matrix client — Unofficial electron version"
arch=("x86_64")
url="https://github.com/Enovale/cinny-electron"
license=('AGPL3')
makedepends=('git' 'pnpm' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)
source=("${_pkgname}::git+https://github.com/Enovale/cinny-electron.git")
sha256sums=("SKIP")

provides=("cinny-electron")
conflicts=('cinny-electron')

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

  install -Dm644 "../../cinny-electron.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop" # Install desktop entry
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Install license
  install -Dm644 "resources/cinny.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg" # Install icons

  install -Dm755 "../../cinny-electron.sh" "$pkgdir/usr/bin/$_pkgname" # Start script
}
