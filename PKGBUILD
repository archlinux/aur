# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

_pkgname="vermilion"
pkgname="vermilion-git"
pkgver=r69.3e89989
pkgrel=1
pkgdesc="A clean and minimal music player for mpd, Tidal, Spotify, and YouTube Music"
arch=('x86_64')
url="https://github.com/vaxerski/Vermilion"
license=('BSD-3-Clause')
depends=('at-spi2-core' 'gtk3' 'nss') # at-spi2-core: libatk; 
makedepends=('git' 'pnpm' 'node-gyp') 
optdepends=('yt-dlp: YouTube Music integration')
provides=("$_pkgname=$pkgver") 
conflicts=("$_pkgname")
options=()
source=("$_pkgname::git+$url.git") # $_pkgname:: defines folder 
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	pnpm install --frozen-lockfile # uses provided pnpm-lock.yaml 
}

pkgver() {
	cd "$_pkgname"

	( set -o pipefail
    		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  	)
}

build() {
	cd "$_pkgname"
	pnpm build:unpack
}

package() {
	cd "$_pkgname"
	install -d "$pkgdir/opt/$_pkgname/" "$pkgdir/usr/bin"

   	cp -r dist/linux-unpacked/* "$pkgdir/opt/$_pkgname/"
    	chmod +x "$pkgdir/opt/$_pkgname/$_pkgname"

    	ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    	install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
	#install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications" #UPDATE: when .desktop file is added

	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
