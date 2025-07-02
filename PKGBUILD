# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=wine-staging-git
pkgver=10.11.r0.g3e94d124
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (staging branch, git version)'
arch=('x86_64')
url='https://www.wine-staging.com/'
license=('LGPL-2.1-or-later')
depends=(
    'attr'
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
    'giflib'
    'git'
    'gnutls'
    'gst-plugins-base-libs'
    'gstreamer'
    'gtk3'
    'libcups'
    'libgphoto2'
    'libpulse'
    'libusb'
    'libva'
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
    'v4l-utils'
    'vulkan-icd-loader')
optdepends=(
    'alsa-lib'
    'alsa-plugins'
    'cups'
    'dosbox'
    'ffmpeg'
    'giflib'
    'gnutls'
    'gst-plugins-base-libs'
    'gstreamer'
    'gtk3'
    'libgphoto2'
    'libpulse'
    'libusb'
    'libva'
    'libxcomposite'
    'libxinerama'
    'opencl-icd-loader'
    'perl'
    'pcsclite'
    'samba'
    'sane'
    'sdl2'
    'v4l-utils'
    'vulkan-icd-loader'
    'wine-gecko'
    'wine-mono')
options=('!lto')
install="${pkgname}.install"
provides=("wine-staging=${pkgver}" "wine=${pkgver%%.r*}" 'wine-wow64')
conflicts=('wine' 'wine-wow64')
source=('git+https://gitlab.winehq.org/wine/wine-staging.git'
        'git+https://gitlab.winehq.org/wine/wine.git'
        '30-win32-aliases.conf'
        'wine-binfmt.conf')
sha256sums=('SKIP'
            'SKIP'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4')

prepare() {
    mkdir -p build
    
    # restore the wine tree to its git origin state, without wine-staging patches
    printf '%s\n' '  -> Cleaning wine source code tree...'
    git -C wine reset --hard HEAD  # restore tracked files
    git -C wine clean -xdf         # delete untracked files
    
    # change back to the wine upstream commit that this version of wine-staging is based in
    printf '%s\n' '  -> Changing wine HEAD to the wine-staging base commit...'
    git -C wine config --local advice.detachedHead false
    git -C wine checkout "$(wine-staging/staging/patchinstall.py --upstream-commit)"
    
    # apply all wine-staging patches
    printf '%s\n' '  -> Applying wine-staging patches...'
    wine-staging/staging/patchinstall.py DESTDIR="${srcdir}/wine" --all
}

pkgver() {
    git -C wine-staging describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
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
    
    # strip native PE libraries
    i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/usr/lib/wine/i386-windows"/*.dll
    "${CARCH}-w64-mingw32-strip" --strip-unneeded "${pkgdir}/usr/lib/wine/${CARCH}-windows"/*.dll
}
