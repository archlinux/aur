# Maintainer: Barry Smith <brrtsm at gmmal dot com>
# Contributor: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D
# Contributor: jrdemasi <jrdemasi@gmai.com>
# Contributor: Fernando Manfredi <contact at acidhub.click>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Ari Mizrahi <codemunchies@gmail.com>
# Contributor: CRT <cirkit@kode.email>
validpgpkeys=('EFD9413B17293AFDFE6EA6F1402A088DEDF104CB')
pkgname=ntopng
pkgver=4.2
_ndpiver=3.4
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
sha512sums=('e89ec3f35644ae8bc570d9802ecfadbf0067145e23a589df2032e8781e9c954f4166d3abb650ddafc65e4fbad656730ee1abf9c5273d3e09f8173d423436b8ff'
            'ed5a22b6ddc14ad707a18a0bd96746c1df489969faaa42016fa9aad8d414fc4ee303b96cac15c3ba86f484a80a0aaa2dd1be5f92be672912e0e0d30da4bdad4c'
            'b3d9a2032cce91ee4faf81522a30a2877540b3fc7a0d43f8fe4f01c16efb0b8f6e73cfe26028b3a070296d7156abf511d3e11f93635ca2de8a4d67322b0ade60'
            '72749fbade0f14345481815355f42552bac3a9d053d86cf62caecd3cf7d304fadafd7ccf9a6a456ab7e5b8b0d36a3b92b1f4e1ecd0c40fa3d11e4a7d98cab39e'
            'bb7f81a43e6bd1d58e41693dca1b5f03e507fb040bf036a5847a273f55bcfa665e8512220a54495c2926afb64e786d4e666556d7880be432cc7660de105e3ee4')

build() {
  # export cppflags to fix build error, see https://github.com/ntop/nDPI/issues/1115
  export CPPFLAGS='-D_FORTIFY_SOURCE=2 -O2'
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
