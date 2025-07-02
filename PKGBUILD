# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Sidney Crestani <sidneycrestani@archlinux.net>
# Contributor: sxe <sxxe@gmx.de>

pkgname=wine-git
pkgver=10.11.r72.g54238a0646c
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (git version)'
arch=('x86_64')
url='https://www.winehq.org/'
license=('LGPL-2.1-or-later')
depends=(
    'desktop-file-utils'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'gettext'
    'glib2'
    'glibc'
    'libpcap'
    'libunwind'
    'libx11'
    'libxcursor'
    'libxext'
    'libxi'
    'libxkbcommon'
    'libxrandr'
    'systemd-libs'
    'wayland')
makedepends=(
    'alsa-lib'
    'ffmpeg'
    'git'
    'gnutls'
    'gst-plugins-base-libs'
    'gstreamer'
    'libcups'
    'libgphoto2'
    'libpulse'
    'libusb'
    'libxcomposite'
    'libxinerama'
    'libxxf86vm'
    'mesa'
    'mingw-w64-gcc'
    'opencl-headers'
    'opencl-icd-loader'
    'perl'
    'pcsclite'
    'samba'
    'sane'
    'sdl2'
    'unixodbc'
    'v4l-utils'
    'vulkan-headers'
    'vulkan-icd-loader')
optdepends=(
    'alsa-lib'
    'alsa-plugins'
    'cups'
    'dosbox'
    'ffmpeg'
    'gnutls'
    'gst-plugins-bad'
    'gst-plugins-base'
    'gst-plugins-base-libs'
    'gst-plugins-good'
    'gst-plugins-ugly'
    'gstreamer'
    'libgphoto2'
    'libpulse'
    'libusb'
    'libxcomposite'
    'libxinerama'
    'opencl-icd-loader'
    'pcsclite'
    'perl'
    'samba'
    'sane'
    'sdl2'
    'unixodbc'
    'v4l-utils'
    'wine-gecko'
    'wine-mono')
options=('!lto')
install="${pkgname}.install"
provides=("wine=${pkgver}" "bin32-wine=${pkgver}" "wine-wow64=${pkgver}")
conflicts=('wine' 'bin32-wine' 'wine-wow64')
replaces=('bin32-wine')
source=('git+https://gitlab.winehq.org/wine/wine.git'
        '30-win32-aliases.conf'
        'wine-binfmt.conf')
sha256sums=('SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4')

prepare() {
    mkdir -p build
}

pkgver() {
    git -C wine describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

build() {
    # apply flags for cross-compilation
    export CROSSCFLAGS="${CFLAGS/-Werror=format-security/} -g"
    export CROSSCXXFLAGS="${CXXFLAGS/-Werror=format-security/} -g"
    export CROSSLDFLAGS="${LDFLAGS//-Wl,-z*([^[:space:]])/}"
    
    cd build
    ../wine/configure \
        --prefix='/usr' \
        --libdir='/usr/lib' \
        --disable-tests \
        --enable-archs="${CARCH},i386"
    make
}

package() {
    make -C build \
        prefix="${pkgdir}/usr" \
        libdir="${pkgdir}/usr/lib" \
        dlldir="${pkgdir}/usr/lib/wine" \
        install
    
    # font aliasing settings for win32 applications
    install -d -m755 "${pkgdir}/usr/share/fontconfig/conf.default"
    install -D -m644 "${srcdir}/30-win32-aliases.conf" -t "${pkgdir}/usr/share/fontconfig/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
    
    # wine binfmt
    install -D -m644 "${srcdir}/wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"
}
