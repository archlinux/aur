# Maintainer: Moritz Patelscheck <moritz(at)patelscheck.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Biginoz < biginoz AT free point fr>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Contributor: Matthias Sobczyk <matthias.sobczyk@googlemail.com>
# Contributor: Kamil Kaminski <kyle@kkaminsk.com>

_pkgname=minidlna
pkgname=minidlna-custom-icon
pkgver=1.2.1
pkgrel=2
pkgdesc="A DLNA/UPnP-AV Media server (aka ReadyDLNA) with patch to set a custom icon (instead of a tux)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/minidlna/"
license=('GPL')
depends=('libexif' 'libjpeg' 'libid3tag' 'flac' 'libvorbis' 'ffmpeg' 'sqlite')
makedepends=('git')
provides=('minidlna')
conflicts=('minidlna' 'readymedia-transcode-git')
backup=('etc/minidlna.conf')
changelog=changelog
source=("minidlna::git://git.code.sf.net/p/minidlna/git#tag=v${pkgver//./_}"
	minidlna.service
	minidlna.tmpfiles
	minidlna.sysusers
	minidlna-custom-icon.patch)
sha256sums=('SKIP'
            'dd0fd8f21b49de74c98cd848c820262634cbfb2d26a6fc360eb4455fe1089d1c'
            '63a6edd22f14ba19618e251f4e7117da65ab80c8136466cfe1035cff7e7fde81'
            'b68ae22828629bc0143d2318e5ec58c94d399ec09bdac529972e35f50321628c'
            '9f871d5dd24fd272b84263b0061ef2ccbeb70a4a952df7ea7b380ae20fe5eeb3')

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's|#user=.*|user=minidlna|g' minidlna.conf
  patch -Np1 -i ../minidlna-custom-icon.patch
}

build() {
  cd "$srcdir/$_pkgname"
  [ -x configure ] || ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" make install
  install -Dm644 minidlna.conf "$pkgdir"/etc/minidlna.conf
  install -Dm0644 "$srcdir"/minidlna.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/minidlna.conf
  install -Dm0644 "$srcdir"/minidlna.sysusers "$pkgdir"/usr/lib/sysusers.d/minidlna.conf
  install -Dm0644 "$srcdir"/minidlna.service "$pkgdir"/usr/lib/systemd/system/minidlna.service
  install -Dm644 "$srcdir"/$_pkgname/minidlna.conf.5 "$pkgdir"/usr/share/man/man5/minidlna.conf.5
  install -Dm644 "$srcdir"/$_pkgname/minidlnad.8 "$pkgdir"/usr/share/man/man8/minidlnad.8
}
