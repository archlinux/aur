# $Id: PKGBUILD 236317 2015-04-12 19:26:30Z eric $
# Maintainer: Proudzhu <proudzhu.fdu at gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
_pkgname=audacity
pkgver=wx3.stable.r418.g162392e
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://audacity.sourceforge.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'wxgtk' 'lame' 'lilv' 'soundtouch'
	 'ffmpeg' 'vamp-plugin-sdk' 'sbsms' 'portsmf' 'desktop-file-utils'
	 'webkitgtk2')
makedepends=('cmake' 'python2' 'twolame')
options=('!makeflags')
install=audacity.install
provides=('audacity')
conflicts=('audacity')
source=("$_pkgname::git+file:///home/proudzhu/workspace/audacity"
		'audacity-ffmpeg.patch')
sha1sums=('SKIP'
          '5f1733a3802bcec7d9b54cb3ec8d7d81fc38fc61')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i "${srcdir}/audacity-ffmpeg.patch"
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --with-libsamplerate
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
