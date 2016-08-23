# Maintainer: Kaan Genç <SeriousBug at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

pkgname=mpv-vapoursynth
_pkgname=mpv
epoch=1
pkgver=0.19.0
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libguess' 'libxrandr' 'jack' 'smbclient' 'rubberband'
  'vapoursynth'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
conflicts=($_pkgname)
provides=($_pkgname)
options=('!emptydirs' '!buildflags')
install=mpv.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3df5811942cd1d71f48eb4720092fdafec11885bf6dd6d1d3e6413f32e5d67e2')

prepare() {
  cd ${_pkgname}-${pkgver}

  ./bootstrap.py
}

build() {
  cd ${_pkgname}-${pkgver}

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --enable-cdda

  ./waf build
}

package() {
  cd ${_pkgname}-${pkgver}

  ./waf install --destdir="$pkgdir"

  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
