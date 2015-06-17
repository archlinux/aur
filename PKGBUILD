# Maintainer: Bruno Pagani <bruno.n.pagani at gmail dot com>

pkgbase=mpv
pkgname=mpv-light
pkgver=0.9.2
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2, with selection of features.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg' 'lcms2' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libguess' 'libxrandr'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
options=('!emptydirs' '!buildflags')
install=mpv.install
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mpv-player/$pkgbase/archive/v$pkgver.tar.gz")
md5sums=('ed1384e703f7032e531731842e4da4f7')

prepare() {
  cd $pkgbase-$pkgver

  ./bootstrap.py
}

build() {
  cd $pkgbase-$pkgver

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --lua=52arch \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --disable-libsmbclient \
    --disable-rubberband \
    --disable-libbs2b \
    --disable-vapoursynth \
    --disable-oss-audio \
    --disable-jack \
    --disable-pulse \
    --disable-vdpau \
    --enable-egl-x11 \
    --disable-tv \
    --disable-pvr \
    --disable-dvbin

  ./waf build
}

package_mpv-light() {
  cd $pkgbase-$pkgver
  ./waf install --destdir="$pkgdir"

  install -d "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 etc/{input,example}.conf \
    "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
