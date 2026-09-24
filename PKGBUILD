# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: johnnybash <georg at grgw dot de>
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=7.0
_ndpiver=6.0
_clickhousever=2.6.2
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL-3.0-only')
depends=('valkey' 'libpcap' 'sqlite' 'libmaxminddb' 'zeromq' 'rrdtool' 'hiredis' 'curl' 'json-c')
optdepends=('net-snmp: support SNMP SET and SNMP v3')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2' 'cmake')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
	"nDPI-$_ndpiver.tar.gz::https://github.com/ntop/nDPI/archive/$_ndpiver.tar.gz"
	"clickhouse-$_clickhousever.tar.gz::https://github.com/ClickHouse/clickhouse-cpp/archive/refs/tags/v$_clickhousever.tar.gz"
    "ntopng-dist-$pkgver-stable.zip::https://github.com/ntop/ntopng-dist/archive/refs/heads/$pkgver-stable.zip"
	"$pkgname@.service"
	"$pkgname.install"
	"$pkgname.sysusers")
sha512sums=('b4aca5a7fa1a8cafbc6d8a1337215279d7c06411bb9cbdb8a462b9e7ac0a636cfb34a5197ef74f7ce91066c96c89f25b679b8f730e25c3259702cbbe87d4a075'
            'a404930ecafecd1990f07b01c3b66f7fd5d61df7c7b4e0b5d20fd0ed6ccfeec216438b66a1d3a58df6b16bbad1038a1162023a0e92c30d3b441950e75eb1447a'
            '3b6d76a541d75e3565b3d196193ac04baa7e99c54fd175deeb5bb143f9192243966c7d82a5c3159760d8b77f9e3d6b88254bce9ee58af53505dc0c5dc6e429a6'
            'dcc9442c4ad0038aefff20309e01f469b0a234e0cd380066ef17bd6d556d908f4e23dfbf84120567564971388da33d02f41f8a49806993417a37024db80e8dd3'
            'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
            '3e9c2af59c429d18e345cde23d21888524040626db80250dca7a308554aa6e0f580df6cdd553e0ae33942deefa136f0853dbdc93c248f88a17b6b87b63388be1'
            'bb7f81a43e6bd1d58e41693dca1b5f03e507fb040bf036a5847a273f55bcfa665e8512220a54495c2926afb64e786d4e666556d7880be432cc7660de105e3ee4')

build() {
  mv $srcdir/clickhouse-cpp-$_clickhousever/* $srcdir/ntopng-$pkgver/third-party/clickhouse-cpp/
  mv $srcdir/ntopng-dist-$pkgver-stable/* $srcdir/ntopng-$pkgver/httpdocs/dist/
  cd $srcdir/nDPI-$_ndpiver
  ./autogen.sh
  ./configure
  make
  export NDPI_HOME=$srcdir/nDPI-$_ndpiver
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=$pkgdir/usr --datadir=/usr/share
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make install

  mv $pkgdir/usr/{man,share/}
  install -Dm644 "$srcdir/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
