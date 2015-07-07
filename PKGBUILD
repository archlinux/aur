# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Submitter: Andy Kiss <vithon985(at)gmail(dot)com>
# Contributor: Kevin Piche <kevin(at)archlinux(dot)org>
# Contributor: Aaron Griffin <aaron(at)archlinux(dot)org>

pkgname=gtkpod1
pkgver=1.0.0
pkgrel=2
pkgdesc="A platform-independent GUI for Apple's iPod using GTK2 (old version)"
arch=('i686' 'x86_64')
url="http://gtkpod.sourceforge.net/"
license=('GPL' 'MPL')
depends=('awk' 'libgpod>=0.8.0' 'libid3tag' 'flac' 'libvorbis' 'curl' 'libglade' 'hicolor-icon-theme' 'gcc-libs')
makedepends=('intltool')
optdepends=('vorbis-tools: OGG support'
            'id3v2: mp3 conversion support')
conflicts=('gtkpod')
options=('!libtool')
install=gtkpod.install
source=("http://downloads.sourceforge.net/project/gtkpod/gtkpod/gtkpod-${pkgver}/gtkpod-${pkgver}.tar.gz"
        "http://mp4v2.googlecode.com/files/mp4v2-1.9.1.tar.bz2")
md5sums=('cadd402dcd1cfbedda0357bf24965a7c'
         '986701929ef15b03155ac4fb16444797')

build() {
  # build libmp4v2 1.9.1
  cd "${srcdir}/mp4v2-1.9.1"
  ./configure --prefix=/usr
  make

  # build gtkpod 1.0.0
  cd "${srcdir}/gtkpod-${pkgver}"
  sed -i 's#python#python2#' scripts/sync-palm-jppy.py
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/gtkpod-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # copy libmp4v2.so.1.9.1
  install -m755 -d "${pkgdir}/usr/lib"
  install -m644 "${srcdir}/mp4v2-1.9.1/.libs/libmp4v2.so.1.9.1" "${pkgdir}/usr/lib"
  ln -s "/usr/lib/libmp4v2.so.1.9.1" "${pkgdir}/usr/lib/libmp4v2.so.1"
}
