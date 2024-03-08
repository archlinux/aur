# Maintainer: Merlin Sievers <merlin here-a-dot sievers now-an-at posteo.net>
pkgname=harmony-music-git
pkgver=r581.0754ede
pkgrel=2
pkgdesc="A cross platform App for streaming Music"
arch=("x86_64")
url="https://github.com/anandnet/Harmony-Music"
license=('GPL')
makedepends=('git')
depends=(
		'gtk3'
		'gdk-pixbuf2'
		'harfbuzz'
		'pango'
		'cairo'
		'zlib'
		'atk'
		'gcc-libs'
		'glibc'
		'glib2'
		'libayatana-appindicator')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
		'git+https://github.com/anandnet/Harmony-Music.git'
		'git+https://github.com/flutter/flutter.git'
		'harmonymusic')
sha256sums=('SKIP' 'SKIP' 'c3f34067478902a07fa334e3eac2e719d1f26b292318d1a8f5a40e63884c0402')

pkgver() {
	cd "${srcdir}/Harmony-Music"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/Harmony-Music"
	git submodule init
	git config submodule.libs/flutter.url "${srcdir}/flutter"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "${srcdir}/Harmony-Music"
	.flutter/bin/flutter build linux
}

package() {
	cd "${srcdir}/Harmony-Music/build/linux/x64/release/bundle"
	# Install the application bundle to /opt/harmonymusic
	install -dm755 "${pkgdir}/opt/harmonymusic"
	ln -s /usr/lib/libayatana-appindicator3.so lib/libindicator3.so
	cp -a * "${pkgdir}/opt/harmonymusic/"
	cp -a "${srcdir}/Harmony-Music/LICENSE" "${pkgdir}/opt/harmonymusic/"

	install -Dm755 "${srcdir}/harmonymusic" "${pkgdir}/usr/bin/harmonymusic"
}
