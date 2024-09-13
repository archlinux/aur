# Maintainer: omansh-krishn <omanshkrishn@duck.com>
# Previous Maintainer: westpain <homicide@disroot.org>
pkgname=materialgram-git
_name=materialgram
pkgver=5.5.4.1.r0.g98c46abe6
pkgrel=1
pkgdesc='Telegram Desktop based messenger with Material Design and additional features'
arch=('x86_64' 'aarch64')
url="https://github.com/kukuruzka165/materialgram"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'kcoreaddons' 'openh264')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'python-packaging'
             'glib2-devel')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=('materialgram')
conflicts=('materialgram-bin')
options=(!debug)

source=("${_name}::git+https://github.com/kukuruzka165/${_name}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_name}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_name}"
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=2040 \
        -DTDESKTOP_API_HASH=b18441a1ff607e10a989891a5462e627 \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=True \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
    ninja -C build
}

package() {
    cd "${srcdir}/${_name}"
    DESTDIR=${pkgdir} ninja -C build install
}
