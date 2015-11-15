# $Id: PKGBUILD 141377 2015-09-21 11:12:32Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:Biginoz < biginoz AT free point fr>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Contributor: Matthias Sobczyk <matthias.sobczyk@googlemail.com>
# Contributor: Kamil Kaminski <kyle@kkaminsk.com>

pkgname=minidlna-custom-icon
pkgver=1.1.5
pkgrel=1
pkgdesc="A DLNA/UPnP-AV Media server (aka ReadyDLNA) with patch to set a custom icon (instead of a tux)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/minidlna/"
license=('GPL')
depends=('libexif' 'libjpeg' 'libid3tag' 'flac' 'libvorbis' 'ffmpeg' 'sqlite')
provides=('minidlna')
conflicts=('minidlna' 'readymedia-transcode-git')
backup=('etc/minidlna.conf')
install=minidlna.install
source=(http://downloads.sourceforge.net/project/minidlna/minidlna/$pkgver/minidlna-$pkgver.tar.gz
	minidlna.service
	minidlna.tmpfiles
	minidlna.sysusers
	minidlna-custom-icon.patch)
md5sums=('1970e553a1eb8a3e7e302e2ce292cbc4'
         '1f53adef7dfa12c1d4636737366b1d39'
         'a61f97b037ea17555f6632b3ffd761ef'
         '5b2a57160589dfd559a23b1a7f365a23'
         '2ea8a7cd48234900c9e510373d3d3d6a')

prepare() {
  cd "$srcdir/minidlna-$pkgver"
  sed -i 's|#user=.*|user=minidlna|g' minidlna.conf
}

build() {
  cd "$srcdir/minidlna-$pkgver"
  patch -Np1 -i ../minidlna-custom-icon.patch
  ./configure --prefix=/usr --sbindir=/usr/bin
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
