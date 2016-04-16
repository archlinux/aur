# Maintainer: 2ion
# (Script derived from the mpv-git PKGBUILD)
#
# Contributor:  Philip Sequeira <phsequei@gmail.com>
# Contributor: Rudolf Polzer <divVerent@xonotic.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Eivind Uggedal <eivind@uggedal.com>

# WARNING: The configure script will automatically enable any optional
# features it finds support for on your system. If you want to avoid
# linking against something you have installed, you'll have to disable
# it in the configure below. The package() script will attempt to
# update the dependencies based on dynamic libraries when packaging.

pkgname=mpv-legacy-af-git
_gitname=mpv
pkgver="0.17.0+1"
_gitchangerange=9d9a1fb..8e96e049999ccc4acd88ea43a252bf815464a682
pkgrel=1
epoch=1
pkgdesc='Video player based on MPlayer/mplayer2. This version retains the legacy HRTF and bs2b audio filters.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/2ion/mpv'
_undetected_depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
depends=('ffmpeg' "${_undetected_depends[@]}")
optdepends=('youtube-dl: for --ytdl')
makedepends=('git' 'python-docutils')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
install=mpv.install
source=('git+https://github.com/2ion/mpv'
        'find-deps.py')
md5sums=('SKIP'
         'ffb774b13decbefc62908dda0332046b')
sha256sums=('SKIP'
            'ce974e160347202e0dc63f6a7a5a89e52d2cc1db2d000c661fddb9dc1d007c02')

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
        --enable-libmpv-shared \
        --enable-gpl3 # vo_opengl: enable nnedi

  ./waf build
}

check() {
  cd "$srcdir/$_gitname"
  printf "Displaying changes relative to the previous package release...\n"
  git shortlog "$_gitchangerange" || true
}

package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir="$pkgdir"

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($("$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
  echo 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
