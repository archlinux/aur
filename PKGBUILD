# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=5.6
_ndpiver=4.6
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'libmariadbclient' 'libpcap' 'sqlite' 'libmaxminddb' 'zeromq' 'rrdtool' 'hiredis')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
	"nDPI-$_ndpiver.tar.gz::https://github.com/ntop/nDPI/archive/$_ndpiver.tar.gz"
	"$pkgname@.service"
	"$pkgname.install"
	"$pkgname.sysusers")
sha512sums=('c4ab79f98b2dc99218cd0c7ac0ed7275d23e7a161de742632f3ec7a538ea4948ba906d40e7fd2ba36fb4bd9be86ecc69f5df65e7f81607e6da489863947b2da5'
            '12dd50eeaae0aa5c2e3c89cb53cdb9989036759bd900312d3875eaba296646c2e42be31dc2b003cbc2401ccef8fbf8d2e460b9a604d7bece360f17f937d60cad'
            'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
            '72749fbade0f14345481815355f42552bac3a9d053d86cf62caecd3cf7d304fadafd7ccf9a6a456ab7e5b8b0d36a3b92b1f4e1ecd0c40fa3d11e4a7d98cab39e'
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
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make install

  mv $pkgdir/usr/{man,share/}
  install -Dm644 "$srcdir/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
