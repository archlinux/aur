 
# Maintainer: John N Bilbery (beelzebud) <beelzebud@gmail.com>

pkgname=chowmatrix-git
pkgver=v1.2.0.r38.gceda003
pkgrel=1
pkgdesc='CHOW Matrix is a delay effect, made up of an infinitely growable tree of delay lines, each with individual controls for feedback, panning, distortion, and more.'
arch=('x86_64')
url='https://github.com/Chowdhury-DSP/ChowMatrix'
license=('BSD')
depends=('curl' 'gtk2' 'webkit2gtk' 'freetype2' 'alsa-lib')
makedepends=('cmake' 'git')
source=("$pkgname::git+$url.git#branch=develop")

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	git submodule update --init --recursive
	cmake -Bbuild
	cmake --build build/ --config Release
}

package() {
    cd $srcdir
    install -Dm755 $pkgname/build/ChowMatrix_artefacts/Standalone/ChowMatrix "$pkgdir"/usr/local/bin/chowmatrix
    install -d "$pkgdir"/usr/lib/LV2/chowmatrix
    install -m644 $pkgname/build/ChowMatrix_artefacts/LV2/ChowMatrix.lv2/*.* "$pkgdir"/usr/lib/LV2/chowmatrix/
    install -Dm644 $pkgname/build/ChowMatrix_artefacts/VST3/ChowMatrix.vst3/Contents/x86_64-linux/ChowMatrix.so "$pkgdir"/usr/lib/VST3/chowmatrix/ChowMatrix.so
    install -d "$pkgdir"/usr/share/pixmaps/
	cp -r --no-preserve=mode,ownership $srcdir/chowmatrix-git/res/logo.png "$pkgdir"/usr/share/pixmaps/chowmatrix.png
    install -Dm644 $startdir/chowmatrix.desktop "$pkgdir"/usr/share/applications/chowmatrix.desktop
    install -Dm644 $pkgname/LICENSE "$pkgdir"/usr/share/licenses/ChowMatrix/LICENSE
    install -d "$pkgdir"/usr/share/doc/$pkgname/
    install -m644 $pkgname/manual/*.* "$pkgdir"/usr/share/doc/$pkgname/
}
