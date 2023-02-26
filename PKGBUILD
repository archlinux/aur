# Maintainer: Caleb Fontenot <foley2431@gmail.com>

pkgname=howdy-beta-git
pkgver=2.6.1.r183.gdb3a8cb
pkgrel=1
pkgdesc="Windows Hello for Linux (Beta)"
arch=('x86_64')
url="https://github.com/boltgolt/howdy"
license=('MIT')
depends=(
	'opencv'
	'hdf5'
	'python'
	'python-pillow'
	'python-dlib'
	'python-face_recognition'
	'python-face_recognition_models'
	'python-click'
	'python-numpy'
	'python-opencv'
)
makedepends=(
	'cmake'
	'pkgfile'
	'meson'
	'git'
	'libevdev'
	'libinih'
	'pam'
	'gettext'
)
conflicts=(
	'howdy'
)
provides=(
	'howdy'
)
backup=('etc/howdy/config.ini')
source=(
	"git+https://github.com/boltgolt/howdy.git#branch=beta"
	"https://github.com/davisking/dlib-models/raw/master/dlib_face_recognition_resnet_model_v1.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/mmod_human_face_detector.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/shape_predictor_5_face_landmarks.dat.bz2"
)
sha256sums=('SKIP'
	'abb1f61041e434465855ce81c2bd546e830d28bcbed8d27ffbe5bb408b11553a'
	'db9e9e40f092c118d5eb3e643935b216838170793559515541c56a2b50d9fc84'
	'6e787bbebf5c9efdb793f6cd1f023230c4413306605f24f299f12869f95aa472'
)

pkgver() {
	cd "$srcdir/howdy"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

parepare() {
	cd "$srcdir/howdy"
	rm -rf "howdy/src/pam-config"
}

build() {
	cd "$srcdir/howdy"
	if [[ -d "pam_howdy" ]]; then
		rm -rf "pam_howdy"
	fi
	mv "howdy/src/pam" "pam_howdy"

	pushd "pam_howdy"
	meson setup build
	meson compile -C build
	popd
}

package() {
	# Installing the proper license files and the rest of howdy
	cd "${srcdir}/howdy"

	install -Dm755 "howdy/src/autocomplete/howdy" "${pkgdir}/usr/share/bash-completion/completions/howdy"
	rm -rf "howdy/src/autocomplete"

	install -Dm755 "pam_howdy/build/pam_howdy.so" "${pkgdir}/usr/lib/security/pam_howdy.so"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/howdy/LICENSE"

	install -dm700 "${pkgdir}/etc/howdy"
	install -dm700 "${pkgdir}/usr/lib/security"

	cp -r howdy/src/* -t "${pkgdir}/etc/howdy"
	#cp -r howdy/src/config.ini -t "${pkgdir}/etc/howdy"


	install -dm700 "${pkgdir}/etc/howdy/dlib-data"
	install -Dm600 "${srcdir}/dlib_face_recognition_resnet_model_v1.dat" "${pkgdir}/etc/howdy/dlib-data"
	install -Dm600 "${srcdir}/mmod_human_face_detector.dat" "${pkgdir}/etc/howdy/dlib-data"
	install -Dm600 "${srcdir}/shape_predictor_5_face_landmarks.dat" "${pkgdir}/etc/howdy/dlib-data"

	install -Dm700 "howdy/src/cli.py" "${pkgdir}/etc/howdy/cli.py"
	find ${pkgdir}/etc/howdy -type f -exec chmod 600 {} +
	find ${pkgdir}/etc/howdy -type d -exec chmod 700 {} +

	install -dm755 "${pkgdir}/usr/bin/"
	chmod 755 "${pkgdir}/etc/howdy/cli.py"
	ln -s "/etc/howdy/cli.py" "${pkgdir}/usr/bin/howdy"
	ln -s "/etc/howdy" "${pkgdir}/usr/lib/security/howdy"

#	install -dm755 "${pkgdir}/usr/lib/howdy-gtk"
#   cp -rv howdy-gtk/src/* "${pkgdir}/usr/lib/howdy-gtk"
}
