# Maintainer: illusory <becomeillusory@gmail.com>
#
# Prebuilt x86-64-v3 binaries for linux-wallpaperengine.
#
# Built in CI inside the CachyOS x86-64-v3 container, so both this code and
# the libraries it links against are compiled for the x86-64-v3
# micro-architecture level (AVX2, BMI2, FMA, ...).
#
# Requires a CPU that supports x86-64-v3:
#   $ /lib/ld-linux-x86-64.so.2 --help | grep x86-64-v3
#
# Upstream: https://github.com/Almamu/linux-wallpaperengine
# Builds:   https://github.com/Become-ILLUSORY/linux-wallpaperengine/actions

pkgname=linux-wallpaperengine-v3-bin
_pkgname=linux-wallpaperengine
pkgver=1.0.1
pkgrel=1
pkgdesc="Wallpaper Engine backgrounds for Linux (prebuilt x86-64-v3)"
arch=('x86_64')
url="https://github.com/Become-ILLUSORY/linux-wallpaperengine"
license=('GPL-3.0-only')
provides=("${_pkgname}=${pkgver}" "linux-wallpaperengine")
conflicts=("${_pkgname}" "linux-wallpaperengine-git" "linux-wallpaperengine-core-git")
options=('!strip' '!debug')

# Runtime libraries the packaged binary and liblinux-wallpaperengine-lib.so
# link against directly, plus what CEF (Chromium) pulls in. Derived from
# `ldd` output mapped through `pacman -Qoq` in the build job.
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'ffmpeg'
    'freeglut'
    'freetype2'
    'glew'
    'glfw'
    'glib2'
    'glibc'
    'glu'
    'libcups'
    'libdrm'
    'libglvnd'
    'libpulse'
    'libx11'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxi'
    'libxkbcommon'
    'libxrandr'
    'libxrender'
    'libxss'
    'libxtst'
    'libxxf86vm'
    'lz4'
    'mesa'
    'mpv'
    'nspr'
    'nss'
    'pango'
    'sdl2-compat'
    'vulkan-icd-loader'
    'wayland'
    'zlib-ng-compat'
)

source=("${pkgname}-${pkgver}.tar.zst::https://github.com/Become-ILLUSORY/linux-wallpaperengine/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.tar.zst")
sha256sums=('108ca1eeb6ebadf83a41c3269d6e762a5441f92842b54103d6c5cd6ac5e746a6')

# The tarball is already a complete, correctly laid out install tree; makepkg
# would otherwise unpack it into $srcdir and the file names would collide with
# the ones we want to install. Keep it as a single file and extract it
# ourselves in package().
noextract=("${pkgname}-${pkgver}.tar.zst")

package() {
    # Extract straight into $pkgdir. The archive holds the full /opt install
    # tree, the /usr/bin wrapper and the upstream license.
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.zst" -C "${pkgdir}"

    # Arch packaging guidelines want the license under the package's own name.
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/licenses/linux-wallpaperengine/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rmdir "${pkgdir}/usr/share/licenses/linux-wallpaperengine"
}
