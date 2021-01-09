# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: ianux
# Contributor: priyank
# Contributor: etix

pkgname="ices0"
pkgver=0.4.11
pkgrel=4
pkgdesc="A source client for broadcasting in MP3, FLAC, AAC and OGG Vorbis formats to an icecast2 server"
license=("GPL2")
arch=("i686" "x86_64" "armv7h")
url="https://github.com/Moonbase59/ices0"
depends=("lame" "libxml2" "libshout")
optdepends=("flac: flac audio support"
            "faad2: aac audio support"
            "libmp4v2: aac audio support"
            "libogg: vorbis audio support"
            "libvorbis: vorbis audio support"
            "perl: playlist scripting engine"
            "python2: playlist scripting engine")
makedepends=("autoconf" "automake" "pkgconf")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("9179496149e763a75fea37bf6ec12947cad4bdb868b401d34728b353b836047a")
options=("!docs")
install="$pkgname.install"

build(){
 cd "$pkgname-$pkgver"
 aclocal
 autoreconf -fi
 automake --add-missing
 if [ -f "/usr/bin/python2" ]; then
  ./configure --prefix="/usr" --sysconfdir="/usr/share/$pkgname" -mandir="/usr/share" --with-python="/usr/bin/python2"
 else
  ./configure --prefix="/usr" --sysconfdir="/usr/share/$pkgname" -mandir="/usr/share"
 fi
 echo "Please check that all the features you want are available, otherwise install optional dependencies"
 echo "Waiting 10 seconds"
 sleep 10
 make
}

package(){
 cd "$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
 # Rename files to avoid conflict with ices2
 mv "$pkgdir/usr/bin/ices" "$pkgdir/usr/bin/ices0"
 mv "$pkgdir/usr/share/man1/ices.1" "$pkgdir/usr/share/man1/ices0.1"
 install -D -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
