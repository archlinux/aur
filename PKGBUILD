# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=gcn64tools-git
pkgver=r467.43db365
pkgrel=2
pkgdesc='Raphnet USB adapter management tools.'
arch=('any')
url='https://github.com/raphnet/gcn64tools'
license=('GPL3')
makedepends=('hidapi' 'pkgconf' 'gtk3' 'libxml2')
optdepends=('dfu-programmer: firmware updates')
provides=('gcn64tools')
source=(
	"git+${url}.git"
	'raphnet-manager.desktop'
	'raphnet-manager.svg'
)
sha256sums=(
	'SKIP'
	'7dc5f9c2c92649f96e08df50d0634f5a24f61da04bb753455959d66fb2300850'
	'67416a5f07a6c349ca3f4a1e75792e23f93956ea26dbb45bf02ccdcd3eca558a'
)
install=gcn64tools.install

pkgver() {
	cd "$srcdir/gcn64tools" || exit 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/gcn64tools/src" || exit 1
	make "${MAKEFLAGS}"
}

package() {
	usr="$pkgdir/usr"

	# Install desktop file and icon.
	install -Dm644 "$srcdir/raphnet-manager.desktop" -t "$usr/share/applications"
	install -Dm644 "$srcdir/raphnet-manager.svg" -t "$usr/share/icons/hicolor/scalable/apps"

	cd "$srcdir/gcn64tools/src" || exit 1
	mkdir -p "$usr/bin"
	make install PREFIX="$usr"

	cd '../firmwares' || exit 1

	# Future-proof by automatically determining the name of each firmware
	# folder.
	for f in *; do
		cd "$f" || exit 1
		files=(*.hex)
		# Get the name of the first firmware file found and remove everything
		# after the hyphen.
		name=${files[0]%-*}
		install -Dm644 ./* -t "$usr/share/gcn64tools/firmware/$name"
		cd ..
	done
}
