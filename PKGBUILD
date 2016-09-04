# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:Biginoz < biginoz AT free point fr>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Contributor: Matthias Sobczyk <matthias.sobczyk@googlemail.com>
# Contributor: Kamil Kaminski <kyle@kkaminsk.com>
# Contributor: Dominik Heidler <dominik@heidler.eu>

pkgname=minidlna-video-thumb
pkgver=1.1.5
pkgrel=5
pkgdesc="A DLNA/UPnP-AV Media server (aka ReadyDLNA) with patch to create video thumbnails"
# The patch can be found here: https://sourceforge.net/p/minidlna/patches/92/
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/minidlna/"
license=('GPL')
depends=('libexif' 'libjpeg' 'libid3tag' 'flac' 'libvorbis' 'ffmpeg' 'sqlite' 'ffmpegthumbnailer')
provides=('minidlna')
conflicts=('minidlna')
backup=('etc/minidlna.conf')
install=minidlna.install
changelog=changelog
source=(http://downloads.sourceforge.net/project/minidlna/minidlna/$pkgver/minidlna-$pkgver.tar.gz
	minidlna.service
	minidlna.tmpfiles
	minidlna.sysusers
    video_thumbnail-1.1.4.patch)
md5sums=('1970e553a1eb8a3e7e302e2ce292cbc4'
         '1f53adef7dfa12c1d4636737366b1d39'
         'a61f97b037ea17555f6632b3ffd761ef'
         '5b2a57160589dfd559a23b1a7f365a23'
         '13d17191788bbdf6134e0a3d26e95767')

prepare() {
  cd "$srcdir/minidlna-$pkgver"
  patch -p1 < "$srcdir/video_thumbnail-1.1.4.patch"
  sed -i 's|#user=.*|user=minidlna|g' minidlna.conf
  ./autogen.sh
}

build() {
  cd "$srcdir/minidlna-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --enable-thumbnail
  make
}

package() {
  cd "$srcdir/minidlna-$pkgver"
  DESTDIR=$pkgdir make install
  install -Dm644 minidlna.conf ${pkgdir}/etc/minidlna.conf
  install -Dm0644 $srcdir/minidlna.tmpfiles $pkgdir/usr/lib/tmpfiles.d/minidlna.conf
  install -Dm0644 $srcdir/minidlna.sysusers $pkgdir/usr/lib/sysusers.d/minidlna.conf
  install -Dm0644 $srcdir/minidlna.service $pkgdir/usr/lib/systemd/system/minidlna.service
  install -Dm644 $srcdir/minidlna-$pkgver/minidlna.conf.5 $pkgdir/usr/share/man/man5/minidlna.conf.5
  install -Dm644 $srcdir/minidlna-$pkgver/minidlnad.8 $pkgdir/usr/share/man/man8/minidlnad.8
}
