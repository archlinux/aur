# Maintainer: DenBrahe <denbrahe@hotmail.com>
pkgname=jellyfin-theater-electron-git
pkgver=r542.8cda057
pkgrel=1
pkgdesc="Electron Theater app for Jellyfin"
arch=(i686 x86_64)
url="https://github.com/jellyfin/jellyfin-theater-electron"
license=('GPL3')
depends=(electron)
makedepends=('git' 'desktop-file-utils' 'nodejs' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
install=
source=(
  'jellyfin-theater-electron::git+https://github.com/jellyfin/jellyfin-theater-electron.git'
  "${pkgname%-git}.desktop"
  "${pkgname%-git}.sh"
)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  # Get electron version from pacman
  ev="$(pacman -Q electron | cut -d " " -f2 | cut -d "-" -f1)"
  # Insert electron version in package.json
  sed -i -re "s/^(\s+\"electron\": \")[^\"]+(\",)/\1$ev\2/" package.json
  sed -i -re "s/^(\s*)(\"build\":\s*\{$)/\1\2\n\1\t\"electronVersion\": \"$ev\",/m" package.json
}

build() {
  cd "$srcdir/${pkgname%-git}"
  echo "Building"
  npm install --cache "${srcdir}/npm-cache"
  echo "Installing electron-packager"
  npm install electron-packager --cache "${srcdir}/npm-cache"
  echo "Packaging"
  npm run package-linux
  echo "done"
}

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/${pkgname%-git}"

  rlsdir="$srcdir/${pkgname%-git}/release/Jellyfin-Theater-linux-x64"
  install -Dm755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}.sh"
  install -Dm644 "$rlsdir/resources/app.asar" \
    "$pkgdir/usr/share/${pkgname%-git}/${pkgname%-git}.asar"

  desktop-file-install "$srcdir/${pkgname%-git}.desktop" --dir "$pkgdir/usr/share/applications/"
}
