# Maintainer: Guillaume ETHEVE <admin@guillaume-etheve.fr>
# Contributor: Caleb Fontenot <foley2431@gmail.com>
# Contributor: Angelo Verlain <hey@vixalien.com>

pkgname=howdy-beta-git
pkgver=2.6.1.r239.gc5b1766
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
optdepends=(
    'python-elevate: for GUI howdy-gtk'
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

build() {
    arch-meson $srcdir/howdy build -Dinstall_pam_config=true -Ddlib_data_dir="/etc/howdy/dlib-data"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -dm755 "${pkgdir}/etc/howdy/dlib-data"
    install -Dm644 "${srcdir}/dlib_face_recognition_resnet_model_v1.dat" "${pkgdir}/etc/howdy/dlib-data"
    install -Dm644 "${srcdir}/mmod_human_face_detector.dat" "${pkgdir}/etc/howdy/dlib-data"
    install -Dm644 "${srcdir}/shape_predictor_5_face_landmarks.dat" "${pkgdir}/etc/howdy/dlib-data"
}
