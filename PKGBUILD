# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=howdy
pkgname="$_pkgbase-bin"
pkgver=2.6.1
pkgrel=2
pkgdesc="Windows Hello style facial authentication for Linux"
arch=('x86_64')
url="https://github.com/boltgolt/howdy"
license=('MIT')
depends=('libinih' 'libevdev' 'python' 'python-dlib' 'python-opencv')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
# backup=('etc/howdy/config.ini')
backup=('usr/lib/security/howdy/config.ini')
install=howdy.install
source=(
	"$_pkgbase.deb::https://github.com/boltgolt/howdy/releases/download/v$pkgver/howdy_$pkgver.deb"
	"https://github.com/davisking/dlib-models/raw/master/dlib_face_recognition_resnet_model_v1.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/mmod_human_face_detector.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/shape_predictor_5_face_landmarks.dat.bz2"
)
md5sums=('b3b67e38359aba3860e4931d5dd3340b'
         '1b31cc4419cc8f1018117249b64bd683'
         '5edccec8ac713d743be4865ff6ead7f7'
         'ef591cf713630226b35b11d0e1733118')

prepare() {
	ar -x "$_pkgbase.deb" data.tar.xz
	rm -rf howdy && mkdir howdy
	tar -xf data.tar.xz -C howdy
}

package() {
	cd "$_pkgbase"

	install -dm755 "$pkgdir/usr/share"
	cp -r usr/share/{bash-completion,man} "$pkgdir/usr/share/"
	cp -r lib "$pkgdir/usr/"

	cd "$srcdir"
	install -Dm644 *.dat -t "$pkgdir/usr/lib/security/howdy/dlib-data"

	install -dm755 "$pkgdir/usr/bin"
	ln -s /usr/lib/security/howdy/cli.py "$pkgdir/usr/bin/howdy"
}
