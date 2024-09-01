# Maintainer: flafflar <achmichail@gmail.com>
# Contributor: Philipp A. <flying-sheep@github.com>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>
# Contributor: Robin <rbn dot 86 et bigbrothergoogle>

_basename=panon
pkgname=plasma6-applets-$_basename
pkgver=6.0.0
pkgrel=1
pkgdesc="An Audio Visualizer Widget for KDE Plasma"
arch=('any')
url="https://github.com/flafflar/panon"
license=('GPL-3.0-or-later' 'WTFPL')
depends=(
	'plasma-workspace'
	'python-docopt'
	'python-numpy'
	'python-pyaudio'
	'python-soundcard>=0.4.2'  # compat with Python 3.10
	'python-websockets'
	'qt6-websockets'
	'qt6-shadertools'
) 
makedepends=('kpackage' 'cmake')
source=("git+https://github.com/flafflar/${_basename}.git#tag=v${pkgver}")
sha256sums=('54a1dc395a642cbb23d0675ebe3d65dc490c3f2c065010ace758e81f714a55c4')

prepare() {
	cd "$srcdir/$_basename"

	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_basename"
	
	rm -rf build || true
	mkdir -p build
	cd build
	cmake ../translations
	make install DESTDIR=../plasmoid/contents/locale
}

package() {
	cd "$srcdir/$_basename"
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/LICENSE"
	install -Dm644 third_party/hsluv-glsl/LICENCE.md "$pkgdir/usr/share/licenses/${_basename%-*}/hsluv-glsl/LICENCE.md"
	
	rm -rf "$pkgdir/usr/share/plasma/plasmoids/" || true
	kpackagetool6 -p "$pkgdir/usr/share/plasma/plasmoids/" -t Plasma/Applet -i plasmoid
	rm -rf "$pkgdir/usr/share/plasma/plasmoids/panon/contents/scripts/soundcard"
}
