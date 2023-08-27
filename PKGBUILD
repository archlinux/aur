# Maintainer: Holzhaus <jholthuis@mixxx.org>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-git
pkgver=r8850
pkgrel=1
pkgdesc="Digital DJ mixing software. Git master branch (development/alpha)."
arch=('i686' 'x86_64' 'aarch64')
url="https://mixxx.org/"
license=('GPL2')
groups=('pro-audio')
depends=(
    'chromaprint'
    'flac'
    'hidapi'
    'lame'
    'libebur128'
    'libid3tag'
    'libmad'
    'libmodplug'
    'libmp4v2'
    'libshout'
    'libsndfile'
    'libtheora'
    'libusb'
    'lilv'
    'microsoft-gsl'
    'opusfile'
    'portaudio'
    'portmidi'
    'protobuf'
    'qt5-declarative'
    'qt5-quickcontrols'
    'qt5-quickcontrols2'
    'qt5-svg'
    'qt5-translations'
    'qt5-x11extras'
    'qtkeychain'
    'rubberband'
    'soundtouch'
    'taglib'
    'ttf-opensans'
    'ttf-ubuntu-font-family'
    'upower'
    'wavpack'
)
makedepends=('git' 'lv2' 'qt5-tools' 'cmake')
provides=('mixxx')
conflicts=('mixxx')
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git"
        'mixxx.install')
md5sums=('SKIP'
         '321b9cca3ed690fcf57e7ac1e99109c2')
install='mixxx.install'

pkgver() {
    cd "$srcdir/${pkgname%-*}"
    echo "r$(git log --pretty=oneline --first-parent | wc -l)"
}

prepare() {
    mkdir -p "$srcdir/${pkgname%-*}/build"
    cmake -S $srcdir/${pkgname%-*} -B $srcdir/${pkgname%-*}/build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_USER_UDEV_RULES=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DOPTIMIZE=native \
    -DBULK=ON \
    -DFAAD=ON \
    -DLILV=ON \
    -DFFMPEG=ON \
    -DKEYFINDER=ON \
    -DMAD=ON \
    -DMODPLUG=ON \
    -DOPUS=ON \
    -DQTKEYCHAIN=ON \
    -DWAVPACK=ON
}

build() {
    cmake --build "$srcdir/${pkgname%-*}/build" --parallel "$(nproc)" --target mixxx
}

check() {
    cmake --build "$srcdir/${pkgname%-*}/build" --parallel "$(nproc)" --target mixxx-test
    ctest --test-dir "$srcdir/${pkgname%-*}/build" --parallel "$(nproc)" --output-on-failure
}

package() {
    mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "$srcdir/${pkgname%-*}/res/linux/mixxx-usb-uaccess.rules" "$pkgdir/usr/lib/udev/rules.d/99-mixxx-usb-uaccess.rules"
    DESTDIR="$pkgdir" cmake --install "$srcdir/${pkgname%-*}/build"
}
