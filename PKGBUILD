# Maintainer: zhanghua<zhanghua.00@qq.com>
# Contributor: Roland <hr_01y@protonmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine64-git
pkgver=7.19.243.g2cfcddb2fef
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs which is only for 64 bit system."
url=https://winehq.org
arch=('x86_64' 'aarch64')
options=('staticlibs' '!lto')
license=('LGPL')
source=(
    "git+https://gitlab.winehq.org/wine/wine.git"
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
    'desktop-file-utils' 'alsa-lib' 'libpulse' 'faudio' 'gstreamer' 'gst-plugins-base-libs' 'mpg123'
    'systemd' 'sdl2' 'vkd3d' 'vulkan-icd-loader' 'vulkan-headers' 'lcms2' 'libcups' 'libgphoto2'
    'sane' 'gsm' 'krb5' 'libldap' 'smbclient' 'ocl-icd' 'libpcap' 'libusb' 'v4l-utils'
    # Depends in Official repo:

    )
makedepends=(
    'bison' 'autoconf' 'perl' 'fontforge' 'flex' 'giflib' 'git' 'libxinerama' 'libxcomposite' 'libxmu' 
    'libxxf86vm' 'openal' 'mesa-libgl' 'opencl-icd-loader' 'gst-plugins-base-libs' 'samba' 'opencl-headers'
    'mingw-w64-gcc'
    )
optdepends=(
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
    ../configure --enable-win64 --prefix=/usr \
        --sysconfdir=/etc --localstatedir=/var \
        --runstatedir=/run --with-x --without-oss
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
