# Maintainer: Mizzt <mizztgc@gmail.com>
pkgname=konaste-linux
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Run KONAMI Amusement Game Station (Konaste) games using Wine"
arch=('x86_64')
url="https://github.com/mizztgc/konaste-linux"
license=('GPL')
groups=()
depends=( 'bash' 'wine>=9.0' 'wine-mono>=9.3.0' 'noto-fonts-cjk'
		  'pipewire' 'pipewire-pulse' 'pipewire-audio'
		  'libpulse' 'wget' 'xdg-utils' 'hicolor-icon-theme' )
makedepends=()
checkdepends=()
optdepends=(
	"gamemode: run with better performance"
	"gamescope: run games through a gamescope compositor with --gamescope"
	)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("https://github.com/mizztgc/${pkgname}/releases/download/v${pkgver}/konaste-linux-v${pkgver}.tar.gz")
noextract=()
sha256sums=('39f30f178505b84e440500bbee287937c81efef7591bfa79666ecfc7457754bf')
validpgpkeys=()

prepare() {
	tar -xf "konaste-linux-v${pkgver}.tar.gz"
}

package() {
	# MimeTypes
	echo 'Installing mimetypes...'
	cd "$srcdir"
	for u in uri/*; do
		install -Dvm644 "$u" "$pkgdir/usr/share/mime/packages/$(basename -- $u)"
	done

	# Icons
	echo 'Installing icons...'
	for i in icon/*; do
		for a in "$i"/apps/*; do
			install -Dvm644 "$a" "$pkgdir/usr/share/icons/hicolor/$(basename -- $i)/apps/$(basename -- $a)"
		done

		for m in "$i"/mimetypes/*; do
			install -Dvm644 "$m" "$pkgdir/usr/share/icons/hicolor/$(basename -- $i)/mimetypes/$(basename -- $m)"
		done
	done

	# Launchers
	echo 'Installing desktop entries...'
	for l in apps/*; do
		install -Dvm644 "$l" "$pkgdir/usr/share/applications/$(basename -- $l)"
	done

	# And finish with the script
	echo 'Installing script...'
	install -Dvm755 konaste "$pkgdir/usr/bin/konaste"
}
