# Maintainer: cogumelo <cogumelo@tutamail.com>

# script based on https://aur.archlinux.org/packages/vesktop-electron
_pkgname=bsky-electron
pkgname=bsky-electron-git
pkgdesc="Bluesky Electron Client using system provided electron."
pkgver=0.5.0
pkgrel=1

arch=("x86_64")
url="https://github.com/CaffeeLake/bsky-electron"
license=('MPL-3.0')

depends=('electron')
makedepends=('pnpm' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("bsky-electron")
conflicts=('bsky-electron-bin')

source=(
git+"https://github.com/CaffeeLake/bsky-electron.git"
"bsky-electron.desktop"
"bsky-electron.sh"
"bsky-electron.svg"
)

sha256sums=(
  'SKIP'
  '1a432aabb5daf1eacdc15829ea7194f92773ea8efc8a95f481d5b6937cdb56cf'
  'a97c64a4e70020610d6834c09b5e350a4f1a436ea7004f2a73da362f5a595062'
  '8ea7df00d3801366edcabf7f7a34af7b8f5b7c2a79b86a40565ab38de55a364a'
)

build() {
  cd "$srcdir/$_pkgname"

  # Use system's electron
  sed -i "/linux/s/^/    \"electronDist\": \"\\/usr\\/lib\\/electron\",\n/" package.json

  pnpm i --frozen-lockfile
  pnpm build
  pnpm release --linux dir
}

package() {
  cd "$srcdir/$_pkgname"

  # Create necessary directories
  install -d "$pkgdir/usr/lib/$_pkgname"
  install -d "$pkgdir/usr/bin"

  cp dist/linux-*unpacked/resources/app.asar "$pkgdir/usr/lib/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop" # Install desktop entry
  install -Dm644 "$srcdir/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg" # Install icons

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname" # Start script
}
