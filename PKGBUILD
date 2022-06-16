# Maintainer: zhanghua<zhanghua.00@qq.com>
# Contributor: Roland <hr_01y@protonmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine64-git
pkgver=7.10.251.g712c547e086
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs which is only for 64 bit system."
url=https://winehq.org
arch=('x86_64' 'aarch64')
options=('staticlibs' '!lto')
license=('LGPL')
source=(
    "git://source.winehq.org/git/wine.git"
    "30-win32-aliases.conf"
    "wine-binfmt.conf"
)
sha256sums=('SKIP'
            'c5674d8142a87969cc69a1852a8702c0f50ea953ffc01d117318af0187785568'
            '3298abd3a66ab9758d173304a34e952acaf8e718c5be9165b1057de5ae0c7594')

conflicts=('wine' 'wine-x64' 'wine64')
provides=('wine-x64' 'wine64')
depends=(
    'dbus' 'fontconfig' 'freetype2' 'gnutls' 'libjpeg-turbo' 'libpng' 'libtiff' 'mesa' 'libunwind'
    'libxml2' 'libxslt' 'libxcursor' 'libxrandr' 'libxdamage' 'libxi' 'gettext' 'glu' 'libsm' 'gcc-libs'
    'desktop-file-utils'
    )
makedepends=(
    'bison' 'autoconf' 'perl' 'fontforge' 'flex' 'giflib' 'git' 'libxinerama' 'libxcomposite' 'libxmu' 
    'libxxf86vm' 'libldap' 'mpg123' 'openal' 'v4l-utils' 'mesa-libgl' 'opencl-icd-loader' 
    'gst-plugins-base-libs' 'vulkan-icd-loader' 'vkd3d' 'sdl2' 'libcups' 'libgphoto2' 'sane' 'gsm' 
    'vulkan-headers' 'samba' 'opencl-headers' 'smbclient'
    )
optdepends=(
    'mingw-w64-gcc: At least one is necessary for compiling Win64 binaries.'
    'clang: At least one is necessary for compiling Win64 binaries.'
    'llvm: Install if you use clang for compiling.'
    'lld: Install if you use clang for compiling'
    'alsa-lib: At least one is necessary for sound.'
    'libpulse: At least one is necessary for sound.'
    'sdl2: Generally necessary for joystick or other HID support. Only one library is necessary, but they may exhibit different behaviour.'
    'systemd: Generally necessary for joystick or other HID support. Only one library is necessary, but they may exhibit different behaviour.'
    # Really Optional Dependencies:
    'faudio: Needed for audio in some newer applications, especially games newer than 2008.'
    'gstreamer: Generally necessary for games or applications that play back audio or video files.'
    'gst-plugins-base-libs: Generally necessary for games or applications that play back audio or video files.'
    'mpg123: Generally necessary for games or applications that play back audio files.'
    'vkd3d: Needed for some games newer than 2016.'
    'vulkan-icd-loader: Necessary for some games; only supported by some video cards.'
    'vulkan-headers: Necessary for some games; only supported by some video cards.'
    'lcms2: Rarely needed for color management.'
    'libcups: Install only if you need printer support.'
    'libgphoto2: Install only if you are using scanner or still image software.'
    'sane: Install only if you are using scanner or still image software.'
    'gsm: GSM audio codec which is very rarely needed, and generally only in older software.'
    'krb5: Install only if you are connecting via Kerberos.'
    'libldap: Install only if you are using remote directories.'
    'smbclient: Rarely needed for networking.'
    'ocl-icd: Install if you are using parallel computing or GPGPU software.'
    'libpcap: Install if you are using applications that require packet capture. This replaces native wpcap.dll shipped by applications.'
    'libusb: Install only if you are using an application that accesses a USB device directly.'
    'v4l-utils: Install only if you are capturing video.'
    'libcapi: Install only if you are using ISDN software.'
    # Extra Optional Dependencies in Official repo:
    'giflib' 'openal' 'alsa-plugins' 'libxcomposite' 'libxinerama' 'opencl-icd-loader' 'cups' 'samba' 'dosbox'
    )

pkgver(){
    cd "${srcdir}/wine"
    git describe --tags | sed 's/wine-//;s/-/./g'
}
prepare(){
    mkdir -p "${srcdir}/wine/wine64-build"
    cd "${srcdir}/wine/wine64-build"
    ../configure --enable-win64 --prefix=/usr --with-x --without-oss
}
build(){
    cd "${srcdir}/wine/wine64-build"
    make -j$(nproc)
}
package(){
    cd "${srcdir}/wine/wine64-build"
    DESTDIR="${pkgdir}" make install
    install -Dm644 "${srcdir}/30-win32-aliases.conf" \
        "${pkgdir}/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
    install -Dm644 "${srcdir}/wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"
}
check(){
    # Some tests may be failed so it is recommended to skip check()
    cd "${srcdir}/wine/wine64-build"
    mkdir -p "${srcdir}/wine-prefix"
    WINEPREFIX="${srcdir}/wine-prefix" make check || \
        echo -e "\n\033[1m[WARN]\033[0m Wine test failed!"
}
