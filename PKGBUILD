# based on https://github.com/rbn42/panon/blob/master/PKGBUILD
# Maintainer: Philipp A. <flying-sheep@github.com>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>
# Contributor: Robin <rbn dot 86 et bigbrothergoogle>

_basename=panon
pkgname=plasma5-applets-$_basename
pkgver=0.4.3
pkgrel=1
pkgdesc="A Different Audio Spectrum Analyzer for KDE Plasma"
arch=('any')
url="http://github.com/rbn42/panon"
license=('GPL3' 'DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE Version 2')
depends=(
	'plasma-workspace'
	'python-docopt'
	'python-numpy'
	'python-pillow'
	'python-pyaudio'
	'python-soundcard'
	'python-websockets'
	'qt5-websockets'
	'qt5-3d'
) 
makedepends=('kpackage' 'cmake')
source=(
	"${_basename}-${pkgver}::https://github.com/rbn42/${_basename}/archive/v${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/williammalo/hsluv-glsl/master/hsluv-glsl.fsh"
	hsluv-glsl_LICENSE.md::"https://raw.githubusercontent.com/williammalo/hsluv-glsl/master/LICENCE.md"
)
sha256sums=('09249bc77ee33336cab5ac77bc225a86815ab739d3973ed6a409b2014845c7ff'
            '1985bbfacfafcadf72582cfdb52103cceb853b0f9c818273ad179d6045c3f2cc'
            '5ad083fe6cafbf17ca8ecba924c124b7bc3f43f95732d1712104ac05f5373875')

prepare() {
	cd "$srcdir/$_basename-$pkgver"
	
	install -Dm644 "$srcdir/hsluv-glsl.fsh" third_party/hsluv-glsl
	install -Dm644 "$srcdir/hsluv-glsl_LICENSE.md" third_party/hsluv-glsl/LICENCE.md
}

build() {
	cd "$srcdir/$_basename-$pkgver"
	
	rm -rf build || true
	mkdir -p build
	cd build
	cmake ../translations
	make install DESTDIR=../plasmoid/contents/locale
}

package() {
	cd "$srcdir/$_basename-$pkgver"
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/LICENSE"
	install -Dm644 third_party/hsluv-glsl/LICENCE.md "$pkgdir/usr/share/licenses/${_basename%-*}/hsluv-glsl/LICENCE.md"
	
	rm -rf "$pkgdir/usr/share/plasma/plasmoids/" || true
	kpackagetool5 -p "$pkgdir/usr/share/plasma/plasmoids/" -t Plasma/Applet -i plasmoid
	
	# If an index is generated, remove it.
	path_index="$pkgdir/usr/share/plasma/plasmoids/kpluginindex.json"
	if [ -e "$path_index" ]; then
		rm "$path_index"
	fi
}
