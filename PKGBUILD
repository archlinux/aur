# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Julien Savard <juju@juju2143.ca>
pkgname=numworks-epsilon
pkgver=23.2.3
pkgrel=1
pkgdesc="A simulator for the Numworks graphic calculator (Epsilon firmware)"
arch=('x86_64')
url="https://www.numworks.com/resources/engineering/software/"
license=(
	'Apache-2.0'
	'CC-BY-NC-ND-4.0'
	'LicenseRef-numworks'
	'MIT'
	'Zlib'
)
depends=(
	'glibc'
	'gcc-libs'
	'libjpeg-turbo'
	'libpng'
	'libxext'
	'sdl2'
)
makedepends=(
	'freetype2'
	'gendesk'
	'imagemagick'
	'librsvg'
	'libwebp'
	'python-lz4'
)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/numworks/epsilon/archive/$pkgver.tar.gz"
	'LICENSE.micropython::https://raw.githubusercontent.com/micropython/micropython/5114f2c1ea7c05fc7ab920299967595cfc5307de/LICENSE'
	'LICENSE.micropython-ulab::https://raw.githubusercontent.com/v923z/micropython-ulab/65c941a8059afe1cfd6f4c2b15d0ade798dc24f2/LICENSE'
	'add-hidpi-support.patch'
	'devendor-sdl.patch'
	'use-distro-cflags-cppflags.patch'
	'LICENSE.regularized_incomplete_beta_function'
)

md5sums=('6a91c232b266e974b7df2bed7c27b7cc'
         'b5c7595f793a0c8b7758f4ff0152cffb'
         'd9881740850078297bfa270e674e6e99'
         '2e03fc45154ee59aeb4c78809e7ee696'
         'e45599b7d190abffbb7019390a8e8ab3'
         '2078c1dbe86f54914bcdf901b851e38b'
         'f377d0e994b14a12313a724b821e3194')

prepare() {
	cd "epsilon-$pkgver"

	patch -p1 < ../add-hidpi-support.patch

	# We can safely devendor. See also:
	# https://github.com/numworks/epsilon/blob/117eea7915082a63551e0caf44aa63f1a0216ecc/ion/src/simulator/external/README.md#sdl-version-compatibilities
	patch -p1 < ../devendor-sdl.patch

	patch -p1 < ../use-distro-cflags-cppflags.patch

	convert -background "#FFB734" "ion/src/simulator/assets/logo.svg" "$pkgname.png"
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Numworks Epsilon" --icon "$pkgname" --exec "$pkgname" --categories "Education;Emulator"
}

build() {
	cd "epsilon-$pkgver"
	awk '/^## Copyright/,0' README.md > LICENSE
	make PLATFORM=simulator clean
	make PLATFORM=simulator
}

package() {
	cd "epsilon-$pkgver"
	install -Dm755 output/release/simulator/linux/epsilon.bin "$pkgdir/usr/bin/$pkgname"
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" \
		'LICENSE' \
		'../LICENSE.micropython' \
		'../LICENSE.micropython-ulab' \
		'../LICENSE.regularized_incomplete_beta_function'
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
