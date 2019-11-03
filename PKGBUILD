# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>
# Contributor: Frédéric Mangano <fmang+aur@mg0.fr>
#  - disable broken vaapi on rpi

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - armv7/aarch64 needs to be built with fPIC

# Upstream: https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/mpv

pkgname=mpv-rpi
_pkgname=mpv
epoch=1
pkgver=0.30.0
pkgrel=1
_waf_version=2.0.9
pkgdesc='mpv with Raspberry Pi support'
arch=('armv6h' 'armv7h' 'aarch64')
# We link against libraries that are licensed GPLv3 explicitly, libsmbclient
# being one of these. So our package is GPLv3 only as well.
license=('GPL3')
url='https://mpv.io/'
depends=('desktop-file-utils' 'ffmpeg-mmal' 'hicolor-icon-theme' 'jack' 'lcms2'
         'libarchive' 'libcaca' 'libcdio-paranoia' 'libdvdnav' 'libgl' 'libva'
         'libxinerama' 'libxkbcommon' 'libxrandr' 'libxss' 'libxv' 'lua52'
         'rubberband' 'smbclient' 'uchardet' 'vulkan-icd-loader' 'wayland'
         'xdg-utils' 'shaderc' 'mujs' 'libplacebo')
makedepends=('mesa' 'python-docutils' 'ladspa' 'wayland-protocols'
             'ffnvcodec-headers' 'vulkan-headers')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz"
        "https://waf.io/waf-${_waf_version}")
sha256sums=('33a1bcb7e74ff17f070e754c15c52228cf44f2cefbfd8f34886ae81df214ca35'
            '2a8e0816f023995e557f79ea8940d322bec18f286917c8f9a6fa2dc3875dfa48')
provides=('mpv')
conflicts=('mpv')

prepare() {
  cd ${_pkgname}-${pkgver}

  install -m0755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_pkgname}-${pkgver}

  [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CFLAGS+=" -fPIC" && CXXFLAGS+=" -fPIC"

  # Ugly hack to help mpv/waf find bcrmegl.
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/vc/lib/pkgconfig"

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-dvbin \
    --enable-dvdnav \
    --enable-libarchive \
    --enable-libmpv-shared \
    --enable-libsmbclient \
    --enable-egl-x11 \
    --disable-egl-drm \
    --disable-vaapi \
    --enable-rpi \
    --enable-rpi-mmal

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m0644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv

  install -m0644 TOOLS/lua/* \
    -D -t "$pkgdir"/usr/share/mpv/scripts
}
