# Maintainer: Kaan Genç <SeriousBug at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

pkgname=mpv-vapoursynth
_pkgname=mpv
epoch=1
pkgver=0.28.2
pkgrel=2
pkgdesc='Video player based on MPlayer/mplayer2'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
    'desktop-file-utils' 'ffmpeg' 'hicolor-icon-theme' 'jack' 'lcms2'
    'libarchive' 'libcaca' 'libcdio-paranoia' 'libdvdnav' 'libgl' 'libva'
    'libxinerama' 'libxkbcommon' 'libxrandr' 'libxss' 'libxv' 'lua52'
    'rubberband' 'smbclient' 'uchardet' 'vulkan-icd-loader' 'wayland'
    'xdg-utils'
    'vapoursynth'
)
makedepends=('mesa' 'python-docutils' 'ladspa')
optdepends=('youtube-dl: for video-sharing websites playback')
conflicts=($_pkgname)
provides=($_pkgname)
options=('!emptydirs')
install=mpv.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('aada14e025317b5b3e8e58ffaf7902e8b6e4ec347a93d25a7c10d3579426d795')

prepare() {
  cd ${_pkgname}-${pkgver}
  ./bootstrap.py
}

build() {
  cd ${_pkgname}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-cdda \
    --enable-dvb \
    --enable-dvdnav \
    --enable-encoding \
    --enable-libarchive \
    --enable-libmpv-shared \
    --enable-libsmbclient \
    --enable-tv \
    --enable-zsh-comp

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
