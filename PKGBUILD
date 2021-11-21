 
# Maintainer: John N Bilbery (beelzebud) <beelzebud@gmail.com>

pkgname=kloncentaur-git
pkgver=v1.4.0.r4.gf3bb633
pkgrel=1
pkgdesc='A digital emulation of the Klon Centaur guitar pedal.'
arch=('x86_64')
url='https://github.com/jatinchowdhury18/KlonCentaur'
license=('BSD')
depends=('curl' 'lv2' 'gtk2' 'webkit2gtk' 'freetype2' 'alsa-lib')
makedepends=('cmake' 'git')
source=("$pkgname::git+$url.git")

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
    install -Dm755 $pkgname/build/ChowCentaur/ChowCentaur_artefacts/Standalone/ChowCentaur "$pkgdir"/usr/local/bin/chowcentaur
    install -dm755 "$pkgdir"/usr/lib/{LV2/chowcentaur,VST3/chowcentaur}
    install -m644 $pkgname/build/ChowCentaur/ChowCentaur_artefacts/LV2/ChowCentaur.lv2/*.* "$pkgdir"/usr/lib/LV2/
    install -m644 $pkgname/build/ChowCentaur/ChowCentaur_artefacts/VST3/ChowCentaur.vst3/Contents/x86_64-linux/ChowCentaur.so "$pkgdir"/usr/lib/VST3/ChowCentaur.so
    install -d "$pkgdir"/usr/share/pixmaps/
	cp -r --no-preserve=mode,ownership $srcdir/kloncentaur-git/ChowCentaur/res/logo.png "$pkgdir"/usr/share/pixmaps/chowcentaur.png
	install -d "$pkgdir"/usr/share/applications
    install -Dm644 $startdir/chowcentaur.desktop "$pkgdir"/usr/share/applications/chowcentaur.desktop
    install -Dm644 $pkgname/LICENSE "$pkgdir"/usr/share/licenses/ChowCentaur/LICENSE
}
