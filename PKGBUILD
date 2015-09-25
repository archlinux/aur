# Maintainer: haliax
# (Script derived from the mpv-git PKGBUILD)

# WARNING: The configure script will automatically enable any optional
# features it finds support for on your system. If you want to avoid
# linking against something you have installed, you'll have to disable
# it in the configure below. The package() script will attempt to
# update the dependencies based on dynamic libraries when packaging.

pkgname=mpvhq-git
_gitname="mpvhq"
pkgver=42070.g407ce0e
pkgrel=1
pkgdesc='General Purpose video player based on MPlayer and mplayer2, now with extra features by Niklas Haas.'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/haasn/mpvhq'
_undetected_depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
depends=('ffmpeg' "${_undetected_depends[@]}")
makedepends=('git' 'mesa' 'python-docutils' 'hardening-wrapper')
optdepends=('youtube-dl: for video-sharing websites playback')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs' '!buildflags')
install=mpv.install
source=("$_gitname::git+https://github.com/haasn/mpvhq"
		'find-deps.py')
sha256sums=('SKIP'
            'ce974e160347202e0dc63f6a7a5a89e52d2cc1db2d000c661fddb9dc1d007c02')

pkgver() {
    cd "$_gitname"
    echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_gitname"
    ./bootstrap.py
}

build() {
    cd "$_gitname"

    ./waf configure --prefix=/usr \
          --confdir=/etc/mpv \
          --enable-zsh-comp \
          --enable-libmpv-shared

	./waf build
}

package() {
    cd "$_gitname"

	./waf install --destdir="$pkgdir"

    # Update dependencies automatically based on dynamic libraries
    _detected_depends=($("$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
    echo 'Auto-detected dependencies:'
    echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
    depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
