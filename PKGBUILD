# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=5.2.1
_ndpiver=4.2
pkgrel=1
pkgdesc='The next generation version of the original ntop, a network traffic probe that shows the network usage'
arch=('x86_64' 'i686')
url='http://www.ntop.org/'
license=('GPL3')
depends=('redis' 'libmariadbclient' 'libpcap' 'sqlite' 'libmaxminddb' 'zeromq' 'rrdtool')
makedepends=('glib2' 'automake' 'libtool' 'wget' 'curl' 'libxml2')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/ntop/$pkgname/archive/$pkgver.tar.gz"
	"nDPI-$_ndpiver.tar.gz::https://github.com/ntop/nDPI/archive/$_ndpiver.tar.gz"
	"$pkgname@.service"
	"$pkgname.install"
	"$pkgname.sysusers")
sha512sums=('01cdf21deac61a3b11e7d0e6b662c911123241332e812bb676cb8c5c003fe1d50a4c61231f9c327d467e89dd1345fc1bdbab5d2599fe04b04a8fe12654c01bdd'
            'c58b228b7de2b5fa111234bb065f9be259cd0282d0058f5985180aab6567c9a18e3453ce9062bd3c057a096ec3dfdc21b7c9680e0148e34af10f707530d853b8'
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
