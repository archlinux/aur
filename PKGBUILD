# Maintainer: Caleb Fontenot <foley2431@gmail.com>

pkgname=howdy-git
pkgver=2.6.1.r77.g96767fe
pkgrel=1
pkgdesc="Windows Hello for Linux"
arch=('x86_64')
url="https://github.com/boltgolt/howdy"
license=('MIT')
depends=(
	'opencv'
	'hdf5'
	'pam-python'
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
)
conflicts=(
    'howdy'
)
provides=(
    'howdy'
)
backup=('usr/lib/security/howdy/config.ini')
source=(
	"git+https://github.com/boltgolt/howdy.git"
	"https://github.com/davisking/dlib-models/raw/master/dlib_face_recognition_resnet_model_v1.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/mmod_human_face_detector.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/shape_predictor_5_face_landmarks.dat.bz2"
)
sha256sums=('SKIP'
            'abb1f61041e434465855ce81c2bd546e830d28bcbed8d27ffbe5bb408b11553a'
            'db9e9e40f092c118d5eb3e643935b216838170793559515541c56a2b50d9fc84'
            '6e787bbebf5c9efdb793f6cd1f023230c4413306605f24f299f12869f95aa472')
pkgver() {
  cd "$srcdir/howdy"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'  
}
            
package() {
	# Installing the proper license files and the rest of howdy
	cd "howdy"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/howdy/LICENSE"
	mkdir -p "${pkgdir}/usr/lib/security/howdy"
	cp -rv howdy/src/* "${pkgdir}/usr/lib/security/howdy"
    mkdir -p ${pkgdir}/usr/lib/howdy-gtk
	cp -rv howdy-gtk/src/* ${pkgdir}/usr/lib/howdy-gtk
	cp "${srcdir}/dlib_face_recognition_resnet_model_v1.dat" "${pkgdir}/usr/lib/security/howdy/dlib-data/"
	cp "${srcdir}/mmod_human_face_detector.dat" "${pkgdir}/usr/lib/security/howdy/dlib-data/"
	cp "${srcdir}/shape_predictor_5_face_landmarks.dat" "${pkgdir}/usr/lib/security/howdy/dlib-data/"
	chmod 600 -R "${pkgdir}/usr/lib/security/howdy"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /lib/security/howdy/cli.py "${pkgdir}/usr/bin/howdy"
	chmod +x "${pkgdir}/usr/lib/security/howdy/cli.py"
	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	cp -v howdy/src/autocomplete/howdy "${pkgdir}/usr/share/bash-completion/completions/howdy"
}

