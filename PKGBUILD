# Maintainer: Garfield <kiddyfurby AAT gmail com>
# Contributor: Shrimpkin <https://sourceforge.net/u/shrimpkin/profile/>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Biginoz < biginoz AT free point fr>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Contributor: Matthias Sobczyk <matthias.sobczyk@googlemail.com>
# Contributor: Kamil Kaminski <kyle@kkaminsk.com>

_pkgname=minidlna
pkgname=minidlna-listen-interface-fix
pkgver=1.2.1
pkgrel=1
pkgdesc="A DLNA/UPnP-AV Media server (aka ReadyDLNA), with fixes from https://sourceforge.net/p/minidlna/bugs/297/"
arch=('x86_64')
url="https://sourceforge.net/projects/minidlna/"
license=('GPL')
depends=('libexif' 'libjpeg' 'libid3tag' 'flac' 'libvorbis' 'ffmpeg' 'sqlite')
makedepends=('git')
provides=('minidlna')
conflicts=('minidlna' 'readymedia-transcode-git')
backup=('etc/minidlna.conf')
changelog=changelog
source=("minidlna::git+https://git.code.sf.net/p/minidlna/git#tag=v${pkgver//./_}"
	minidlna.service
	minidlna.tmpfiles
	minidlna.sysusers
	minidlna_listen_interface.patch
)
sha512sums=('SKIP'
            'f428710f3ad2de007ba2e4e8937a0b9262b5c6b4a63da536190e2866ae48c35be81672e3b097c8eb479d5749dd07be40c5a6a8c98e9c0a10ba08607d56b1a590'
            'c58631c20416997c538be6258ef9c13b9304d5906b19f063157df70f672b7153b452ffb9612be267a90942bd880af8d665ebe3c53a2926ffa99acc943d875d97'
            'e3e6c46faac768b283134a47013b77c4152840c61d3503f51fbe154bf25fe8a0e585ed9a40950212254b4a844b007f674875e4d25f55af51914694213fecc420'
            'ce477b6967ef045398e70d5c05c586abf048722cd886e9b2b9f72495c052baec931f5cabc73c148dbd11f200d242c6c85c62ac36e883767a18d57dea7fcb2cb1'
)

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's|#user=.*|user=minidlna|g' minidlna.conf
  patch -Np1 -i ../minidlna_listen_interface.patch
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
