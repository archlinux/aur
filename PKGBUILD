# Maintainer: DenBrahe <denbrahe@hotmail.com>
pkgname=jellyfin-theater-electron-git
pkgver=r527.22eaded
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
backup=("usr/share/jellyfin-theater-electron/database.txt")
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
	sed -Ei 's/\s+"electron": "[^"]+",//' package.json
}

build() {
	cd "$srcdir/${pkgname%-git}"
  echo "Building"
	npm install --cache "${srcdir}/npm-cache" 
  echo "Installing electron-packager"
	npm install electron-packager --cache "${srcdir}/npm-cache" 
  echo "Packaging"
  ev="$(electron --version)"
  ev2="${ev##v}"
  npm run package-linux -- --electron-version "$ev2"
  echo "done"
}

package() {
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/${pkgname%-git}"

  rlsdir="$srcdir/${pkgname%-git}/release/Jellyfin-Theater-linux-x64"
	install -Dm755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}.sh"
  install -Dm644 "$rlsdir/resources/app.asar" \
    "$pkgdir/usr/share/${pkgname%-git}/${pkgname%-git}.asar"
  install -Dm644 "$srcdir/${pkgname%-git}/database.txt" \
    "$pkgdir/usr/share/${pkgname%-git}/database.txt"

	desktop-file-install "$srcdir/${pkgname%-git}.desktop" --dir "$pkgdir/usr/share/applications/"
}
