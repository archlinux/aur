# Maintainer: Kaan Genç <SeriousBug at gmail dot com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

pkgname=mpv-vapoursynth
_pkgname=mpv
pkgver=0.9.2
pkgrel=2
pkgdesc='Video player based on MPlayer/mplayer2'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libguess' 'libxrandr' 'jack' 'smbclient' 'rubberband'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
conflicts=($_pkgname)
options=('!emptydirs' '!buildflags')
install=mpv.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mpv-player/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('ed1384e703f7032e531731842e4da4f7')

prepare() {
  cd $_pkgname-$pkgver

  ./bootstrap.py
}

build() {
  cd $_pkgname-$pkgver

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --enable-vapoursynth \
    --enable-cdda

  ./waf build
}

package() {
  cd $_pkgname-$pkgver
  ./waf install --destdir="$pkgdir"

  install -d "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 etc/{input,example}.conf \
    "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
