# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: Christoph Drexler <chrdr [at] gmx [dot] at>

pkgname=wavesurfer
pkgver=1.8.8p4
pkgrel=3
pkgdesc="Open source tool for sound visualization and manipulation"
arch=('any')
url="http://sourceforge.net/projects/wavesurfer/"
license=('custom')
depends=('tcl>=8.4' 'tk>=8.4' 'snack>=2.2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tgz"
  wavesurfer
  wavesurfer.desktop
  vtcanvas.patch
  prefs.patch
  snack-callbacks.patch)
md5sums=('446f16aecff9cc283cf82636e84feeee'
         'f875d9c0fcef785ccdf7f4a64e19c52d'
         '8a081185545f22d37f34d9de7e0cf303'
         'b19c250f1fdb5bfb51122e805f612695'
         'de89341e031a230cfe4387d5bf2b18f7'
         'a270da18afc012a1e431466f2afef5a8')

build() {
  cd $pkgname-$pkgver

  patch -p0 -i ../prefs.patch
  patch -p0 -i ../vtcanvas.patch
  # if you have a snack version that is compatible with tcl 8.6
  # you should leave out the following patch
  patch -p0 -i ../snack-callbacks.patch
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/{lib,share/{doc,licenses}}/wavesurfer/
	cp -r $srcdir/$pkgname-$pkgver/{demos,icons,msgs,src,tools} $pkgdir/usr/lib/wavesurfer/
	chmod a+x $pkgdir/usr/lib/wavesurfer/src/app-wavesurfer/wavesurfer.tcl
	cp $srcdir/$pkgname-$pkgver/doc/* $pkgdir/usr/share/doc/wavesurfer/
	install -Dm755 $srcdir/wavesurfer $pkgdir/usr/bin/wavesurfer
	install -Dm644 $srcdir/wavesurfer.desktop $pkgdir/usr/share/applications/wavesurfer.desktop
	install $srcdir/$pkgname-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/wavesurfer/LICENSE.txt

	sed -i -e 's|wish8.5|wish|' $pkgdir/usr/lib/wavesurfer/src/app-wavesurfer/wavesurfer.tcl
}
