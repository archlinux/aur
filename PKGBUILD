# $Id$
# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>
# Contributor: Frédéric Mangano <fmang+aur@mg0.fr>
#  - disable broken vaapi on rpi

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - armv7/aarch64 needs to be built with fPIC
# Upstream: https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/community/mpv/PKGBUILD

pkgname=mpv-rpi
_pkgname=mpv
epoch=1
pkgver=0.29.1
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
         'xdg-utils')
makedepends=('mesa' 'python-docutils' 'ladspa' 'wayland-protocols'
             'vulkan-headers')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz"
  "https://waf.io/waf-${_waf_version}")
sha256sums=('f9f9d461d1990f9728660b4ccb0e8cb5dce29ccaa6af567bec481b79291ca623'
  '2a8e0816f023995e557f79ea8940d322bec18f286917c8f9a6fa2dc3875dfa48')
provides=('mpv')
conflicts=('mpv')

prepare() {
  cd ${_pkgname}-${pkgver}

  install -m755 "${srcdir}"/waf-${_waf_version} waf
}

build() {
  cd ${_pkgname}-${pkgver}

  [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CFLAGS+=" -fPIC" && CXXFLAGS+=" -fPIC"

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-dvb \
    --enable-dvdnav \
    --enable-libsmbclient \
    --enable-tv \
    --enable-libarchive \
    --enable-libmpv-shared \
    --enable-zsh-comp \
    --enable-egl-x11 \
    --disable-vaapi \
    --enable-rpi

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
