# Maintainer: SelfRef <arch@selfref.dev>
# Contributor: Frank Tackitt <frank@tackitt.net>
# Contributor: boltgolt <boltgolt@gmail.com>
# Contributor: Raymo111 <hi@raymond.li>
# Contributor: Kelley McChesney <kelley@kelleymcchesney.us>

_pkgbase=howdy
pkgname="$_pkgbase"
pkgver=2.6.1
pkgrel=3
pkgdesc="Windows Hello style facial authentication for Linux"
arch=('x86_64')
url="https://github.com/boltgolt/howdy"
license=('MIT')
depends=('libinih' 'libevdev' 'python' 'python-dlib' 'python-opencv')
makedepends=('git')
backup=('usr/lib/security/howdy/config.ini')
install=howdy.install
source=(
	"howdy::git+https://github.com/boltgolt/howdy.git#tag=v$pkgver"
	"https://github.com/davisking/dlib-models/raw/master/dlib_face_recognition_resnet_model_v1.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/mmod_human_face_detector.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/shape_predictor_5_face_landmarks.dat.bz2"
	"polkit-agent-helper-howdy.conf"
)
sha256sums=('5acebdb3eede1991fa1f078cda2dff012b84ef7cd964a25714b94a0ccd65b90e'
            'abb1f61041e434465855ce81c2bd546e830d28bcbed8d27ffbe5bb408b11553a'
            'db9e9e40f092c118d5eb3e643935b216838170793559515541c56a2b50d9fc84'
            '6e787bbebf5c9efdb793f6cd1f023230c4413306605f24f299f12869f95aa472'
            '2283fc4684751caa41e87023755bba5c3468475b6ed632b13a4ac6e9c748c512')

package() {
	cd "$srcdir/howdy"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/lib/security/howdy"
	cp -r src/* "$pkgdir/usr/lib/security/howdy"
	cp "${srcdir}/dlib_face_recognition_resnet_model_v1.dat" "$pkgdir/usr/lib/security/howdy/dlib-data/"
	cp "${srcdir}/mmod_human_face_detector.dat" "$pkgdir/usr/lib/security/howdy/dlib-data/"
	cp "${srcdir}/shape_predictor_5_face_landmarks.dat" "$pkgdir/usr/lib/security/howdy/dlib-data/"
	chmod 600 -R "$pkgdir/usr/lib/security/howdy"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /usr/lib/security/howdy/cli.py "$pkgdir/usr/bin/howdy"
	chmod +x "$pkgdir/usr/lib/security/howdy/cli.py"
	mkdir -p "$pkgdir/usr/share/bash-completion/completions"
	cp autocomplete/howdy "$pkgdir/usr/share/bash-completion/completions/howdy"

	# Workaround for polkit 127+ breaking howdy (boltgolt/howdy#1077)
	install -Dm644 "${srcdir}/polkit-agent-helper-howdy.conf" \
		"$pkgdir/usr/lib/systemd/system/polkit-agent-helper@.service.d/10-howdy.conf"
}
