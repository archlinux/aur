# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-beta
_mixxxver=2.6
pkgver="${_mixxxver}.beta"
pkgrel=2
pkgdesc="Digital DJ mixing software (beta branch)."
arch=('i686' 'x86_64' 'aarch64')
url="https://mixxx.org/"
license=('GPL-2.0-or-later')
groups=('pro-audio')
depends=(
  # First set of depends was added in the package() step of the main PKGBUILD.
  # Unsure why.
  'chromaprint'
  'flac'
  'ffmpeg'
  'glib2'
  'libglvnd'
  'libid3tag'
  'libogg'
  'libsndfile'
  'libusb'
  'libvorbis'
  'lilv'
  'portaudio'
  'portmidi'
  'protobuf'
  'rubberband'
  'zlib'

  'glibc'
  #'hicolor-icon-theme'
  'hidapi'
  'lame'
  'libebur128'
  #'libgcc'
  'libkeyfinder'
  'libmad'
  'libmodplug'
  #'libstdc++'
  #'libx11'
  #'openssl'
  'libmp4v2' #?
  'libshout' #?
  'libtheora' #?
  #'opus'
  'opusfile'
  'qt6-5compat'
  #'qt6-base'
  'qt6-declarative'
  'qt6-shadertools'
  'qt6-svg'
  'qt6-translations' #?
  'qtkeychain-qt6'
  'soundtouch'
  'taglib1'
  'ttf-opensans' #?
  'ttf-ubuntu-font-family' #?
  'upower'
  'wavpack'
  'sqlite'
)
makedepends=(
  'benchmark'
  'cmake'
  #'faad2'
  #'glu'
  #'gperftools'
  'gtest'
  'lv2'
  'microsoft-gsl'
  'qt6-tools'
)
provides=('mixxx')
conflicts=('mixxx')
source=("mixxx-${_mixxxver}-beta.tar.gz::https://github.com/mixxxdj/mixxx/archive/refs/tags/${_mixxxver}-beta.tar.gz")
sha256sums=('3683cf0570e2f9dbeb1d76a5d617f8c2bf2acb6d15fe9d2337b8f49a20887a38')

prepare() {
    _basedir="$srcdir/${pkgname%-*}-${_mixxxver}-beta"
    mkdir -p "${_basedir}/build"
    cmake -S ${_basedir} -B ${_basedir}/build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_USER_UDEV_RULES=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DOPTIMIZE=native \
    -DQT6=ON \
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
    _builddir="$srcdir/${pkgname%-*}-${_mixxxver}-beta/build"
    cmake --build "${_builddir}" --parallel "$(nproc)" --target mixxx
}

check() {
    _builddir="$srcdir/${pkgname%-*}-${_mixxxver}-beta/build"
    cmake --build "${_builddir}" --parallel "$(nproc)" --target mixxx-test
    ctest --test-dir "${_builddir}" --parallel "$(nproc)" --output-on-failure
}

package() {
    _basedir="$srcdir/${pkgname%-*}-${_mixxxver}-beta"
    mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 "${_basedir}/res/linux/mixxx-usb-uaccess.rules" "$pkgdir/usr/lib/udev/rules.d/99-mixxx-usb-uaccess.rules"
    DESTDIR="$pkgdir" cmake --install "${_basedir}/build"
}

# vim:set ts=2 sw=2 et:
