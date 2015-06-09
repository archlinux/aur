# Maintainer:  Philip Sequeira <phsequei@gmail.com>
# Contributor: Rudolf Polzer <divVerent@xonotic.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

# WARNING: The configure script will automatically enable any optional
# features it finds support for on your system. If you want to avoid
# linking against something you have installed, you'll have to disable
# it in the configure below. The package() script will attempt to
# update the dependencies based on dynamic libraries when packaging,
# but this is currently experimental.

pkgname=mpv-git
_gitname=mpv
pkgver=0.8.3_135_g9b5a724
pkgrel=1
pkgdesc='Video player based on MPlayer/mplayer2 (git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io'
_undetected_depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
depends=('ffmpeg' "${_undetected_depends[@]}")
# depends that used to be default (a long time ago, probably out of date):
#  'lcms2' 'libcdio-paranoia' 'libdvdnav' 'libguess' 'libxinerama'
#  'libxrandr' 'libxss' 'libxv' 'lirc-utils' 'lua' 'mpg123' 'smbclient'
#  'wayland' 'libxkbcommon' # Note: libxkbcommon is only needed for wayland.
optdepends=('youtube-dl: for --ytdl')
makedepends=('git' 'python-docutils')
# makedepends that used to be default: 'mesa' 'ladspa'
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
install=mpv.install
source=('git+https://github.com/mpv-player/mpv'
        'find-deps.py')
md5sums=('SKIP'
         'ddbaa32dbb359220e9f62b925152c015')
sha256sums=('SKIP'
            '9b0a338b4621c5d0d101009b0195a801e8e773811ec3a47dbf1cc339e9f16e99')

pkgver() {
  cd "$srcdir/$_gitname"
  _curtag="$(git rev-list --tags --max-count=1)"
  _tagver="$(git describe --tags $_curtag | sed -e 's:^v::' -e 's:-:_:g')"
  _commits="$(git rev-list --count HEAD --since=$_tagver)"
  _sha="$(git rev-parse --short HEAD)"
  printf "%s_%s_g%s" $_tagver $_commits $_sha
}

prepare() {
  cd "$srcdir/$_gitname"
  ./bootstrap.py
}

build() {
  cd "$srcdir/$_gitname"

  CFLAGS="$CFLAGS -I/usr/include/samba-4.0"

  ./waf configure --prefix=/usr \
        --confdir=/etc/mpv \
        --enable-zsh-comp \
        --enable-libmpv-shared

  ./waf build
}

package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir="$pkgdir"

  install -d "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 etc/{input,example}.conf \
          "$pkgdir"/usr/share/doc/mpv/examples
  install -m644 DOCS/{encoding.rst,tech-overview.txt} \
          "$pkgdir"/usr/share/doc/mpv

  # Update dependencies automatically (experimental!)
  depends=("${_undetected_depends[@]}"
           $("$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
}
