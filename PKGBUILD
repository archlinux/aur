# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: johnnybash <georg at grgw dot de>
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=6.2
_ndpiver=4.10
pkgrel=2
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL-3.0-only')
depends=('valkey' 'libmariadbclient' 'libpcap' 'sqlite' 'libmaxminddb' 'zeromq' 'rrdtool' 'hiredis' 'curl' 'json-c')
optdepends=('net-snmp: support SNMP SET and SNMP v3')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2' 'npm' 'jq' python-setuptools)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
	"nDPI-$_ndpiver.tar.gz::https://github.com/ntop/nDPI/archive/$_ndpiver.tar.gz"
	"$pkgname@.service"
	"$pkgname.install"
	"$pkgname.sysusers")
sha512sums=('00370116dc6ed13b78c5da4338c359abc6a9b24c529c06ce4298df9a6b411d3e5799f29b41543a17d7fc70a3f5b1717306723f5a6899ee2c971ad9eafff602d8'
            '311836477bafc9c7a4ef6cf18438870ec186db4407390883bcd8376bd709cd5c5700e8a3f028dbc3e49012e828ee5199ee86e76ad4d7b1595903818e96bf9cb8'
            'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
            '3e9c2af59c429d18e345cde23d21888524040626db80250dca7a308554aa6e0f580df6cdd553e0ae33942deefa136f0853dbdc93c248f88a17b6b87b63388be1'
            'bb7f81a43e6bd1d58e41693dca1b5f03e507fb040bf036a5847a273f55bcfa665e8512220a54495c2926afb64e786d4e666556d7880be432cc7660de105e3ee4')

build() {
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
