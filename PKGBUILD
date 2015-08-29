# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname=mpv-sndio
_basepkg=mpv
_commit=f1778d1f
pkgver=41859.gf1778d1f
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2 (with sndio support)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
  'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'enca' 'libxss'
  'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libguess' 'libxrandr' 'jack' 'smbclient' 'rubberband'
  'sndio'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
conflicts=("mpv")
provides=("mpv")
options=('!emptydirs' '!buildflags')
install=mpv.install
source=("git://github.com/mpv-player/mpv.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd $_basepkg

  echo "$(git rev-list --count HEAD).g${_commit}"
}

prepare() {
  cd $_basepkg

  ./bootstrap.py
}

build() {
  cd $_basepkg

  ./waf configure --prefix=/usr \
    --confdir=/etc/mpv \
    --enable-zsh-comp \
    --enable-libmpv-shared \
    --enable-cdda \
    --enable-sndio

  ./waf build
}

package() {
  cd $_basepkg
  ./waf install --destdir="$pkgdir"

  install -d "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 etc/{input,example}.conf \
    "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
    "$pkgdir"/usr/share/doc/mpv
}
