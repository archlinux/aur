# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>

pkgname=qtractor-git
pkgver=0.9.15.r10.gb97fdff2
pkgrel=1
pkgdesc="Audio/MIDI multitrack sequencer"
arch=('i686' 'x86_64')
url="http://qtractor.sourceforge.net/"
license=('GPL')
groups=('pro-audio')
depends=('alsa-lib' 'aubio' 'desktop-file-utils' 'hicolor-icon-theme' 'jack' 'liblo' 'libmad' 'lilv' 'qt5-x11extras' 'rubberband' 'suil')
makedepends=('dssi' 'git' 'ladspa' 'libogg' 'libsamplerate' 'libsndfile' 'libvorbis' 'lv2' 'qt5-tools')
optdepends=('dssi-vst: win32 VST support')
provides=('qtractor')
conflicts=('qtractor')
source=("${pkgname%-*}::git+https://github.com/rncbc/qtractor.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  # cutting off the "qtractor_" prefix present in the git tag + remaining underscores (ugly but gets the job done).
  git describe --long | sed 's/^qtractor_//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/\_/./g'
}

build() {
  cd "${srcdir}/${pkgname%-*}"
  make -f Makefile.git
  ./configure --prefix=/usr \
			  --libdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  make DESTDIR="${pkgdir}" install
    # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm 644 {AUTHORS,README,README.VST,TODO}
}

