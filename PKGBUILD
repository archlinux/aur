# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: ianux
# Contributor: priyank
# Contributor: etix

pkgname="ices0"
pkgver=0.4.11
pkgrel=7
pkgdesc="A source client for broadcasting in MP3, FLAC, AAC and OGG Vorbis formats to an icecast2 server"
license=("GPL2")
arch=("i686" "x86_64" "armv7h" "aarch64")
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
source=("$url/archive/v$pkgver.tar.gz"
        "example.xml"
        "ices0@.service"
        "ices0.sysusers"
        "ices0.tmpfiles")
sha256sums=('9179496149e763a75fea37bf6ec12947cad4bdb868b401d34728b353b836047a'
            '4bef8de900f69fe7b252d0d7bc0478100483a7372a3969bb7a79cc9a6edd442c'
            'af5bd06ee8d6c528b3067956162755b11cf3c340f3c6a15f8951fbb2ec2a73c6'
            'f9d80a8af448036c256db7ab16f2cf1996275c33d69c948a45eeb7d3f1a14223'
            'a7b7d8d462e4fd98964ccdb59d4b09aefb7086471844be9f29ac91568634b1cb')
options=("!docs")
install="$pkgname.install"

build(){
 cd "$pkgname-$pkgver"
 aclocal
 autoreconf -fi
 automake --add-missing
 if [ -f "/usr/bin/python2" ]; then
  ./configure --prefix="/usr" --sysconfdir="/usr/share/$pkgname" --mandir="/usr/share" --with-python="/usr/bin/python2"
 else
  ./configure --prefix="/usr" --sysconfdir="/usr/share/$pkgname" --mandir="/usr/share"
 fi
 echo "Please check that all the features you want are available, otherwise install optional dependencies before installing ices0"
 echo "Waiting 5 seconds"
 sleep 5
 make
}

package(){
 cd "$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
 # rename files to avoid conflict with ices2
 mv "$pkgdir/usr/bin/ices" "$pkgdir/usr/bin/ices0"
 mv "$pkgdir/usr/share/man1/ices.1" "$pkgdir/usr/share/man1/ices0.1"
 install -D -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 install -D -m 644 "$srcdir/example.xml" "$pkgdir/etc/ices0/example.conf"
 install -D -m 644 "$srcdir/ices0@.service" "$pkgdir/usr/lib/systemd/system/ices0@.service"
 install -D -m 644 "$srcdir/ices0.sysusers" "$pkgdir/usr/lib/sysusers.d/ices0.conf"
 install -D -m 644 "$srcdir/ices0.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ices0.conf"
}
