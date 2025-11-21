# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: johnnybash <georg at grgw dot de>
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=6.6
_ndpiver=5.0
_clickhousever=2.6.0
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL-3.0-only')
depends=('valkey' 'libpcap' 'sqlite' 'libmaxminddb' 'zeromq' 'rrdtool' 'hiredis' 'curl' 'json-c')
optdepends=('net-snmp: support SNMP SET and SNMP v3')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2' 'npm' 'jq' 'python-setuptools' 'cmake')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
	"nDPI-$_ndpiver.tar.gz::https://github.com/ntop/nDPI/archive/$_ndpiver.tar.gz"
	"clickhouse-$_clickhousever.tar.gz::https://github.com/ClickHouse/clickhouse-cpp/archive/refs/tags/v$_clickhousever.tar.gz"
	"$pkgname@.service"
	"$pkgname.install"
	"$pkgname.sysusers")
sha512sums=('7e3f9fce3a88b245bcea6b471e2f0ed85fab7577ebfd92bd85b774a89514aa168d703057725ccedd5dbd8e00ebf4bb034e21cf0c9ad345e317c30674f832aa29'
            '9857aa654051d5b91089e6410a8a7faddf9dbd502bad21add9de035c59152031f6d130a4225fadb9738f7ef7ff37a4655300b582f6582658266b58b88c48eae3'
            '4199ac2848b0544a2a9c4e03ca62f9a14e13652b09df62b2c95eda59c567cb8227099b9cb027f18d7bdb3a25ee41f01301a551f1bf98727bf89766f5e1cac3f5'
            'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
            '3e9c2af59c429d18e345cde23d21888524040626db80250dca7a308554aa6e0f580df6cdd553e0ae33942deefa136f0853dbdc93c248f88a17b6b87b63388be1'
            'bb7f81a43e6bd1d58e41693dca1b5f03e507fb040bf036a5847a273f55bcfa665e8512220a54495c2926afb64e786d4e666556d7880be432cc7660de105e3ee4')

build() {
  mv $srcdir/clickhouse-cpp-$_clickhousever/* $srcdir/ntopng-$pkgver/third-party/clickhouse-cpp/
  cd $srcdir/nDPI-$_ndpiver
  ./autogen.sh
  ./configure
  make
  export NDPI_HOME=$srcdir/nDPI-$_ndpiver
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=$pkgdir/usr --datadir=/usr/share
  npm install --save-dev @babel/core
  jq -c '.devDependencies' package.json | jq -r -M | grep ':' | sed 's/:/@/' | sed 's|[", ^]||g' | npm install --save-dev
  npm run build:dev
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make install

  mv $pkgdir/usr/{man,share/}
  install -Dm644 "$srcdir/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
