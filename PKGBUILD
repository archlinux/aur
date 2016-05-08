# Maintainer: Petar Petrov <petar.petrov.georgiev at gmail d0t com>
pkgname=savagewheels
pkgver=1.6.1
pkgrel=1
pkgdesc="Savage Wheels is a 2D car crashing arcade game similar to the old classic Destruction Derby."
arch=('i686' 'x86_64')
url="https://github.com/petarov/savagewheels"
license=('MIT')
groups=()
depends=('cmake' 'sdl' 'sdl_mixer')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/petarov/savagewheels/archive/$pkgver.tar.gz https://github.com/petarov/savagewheels/releases/download/v1.4/savagewheels-gamedata.tar.gz)
noextract=(savagewheels-gamedata.tar.gz)
md5sums=('9785c07d85d89517e6167bffb002381c'
         '98f2c9750c0dab008fbb74fa97a5f10d')

if [ "${CARCH}" = 'x86_64' ] ; then
	_arch='x64'
else
	_arch="x86"
fi

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	echo Extracting binary resources ...
	binfile="savagewheels-gamedata.tar.gz"
	cd bin
	tar zxf ../../../$binfile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cd release
	cmake -G "Unix Makefiles" ../ \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DINSTALL_DATADIR=/usr/share/$pkgname \
    -DINSTALL_LIBEXECDIR=/usr/local/bin \
    -DCMAKE_INSTALL_DATADIR=$pkgdir/usr/share/$pkgname \
    -DCMAKE_INSTALL_DATAROOTDIR=$pkgdir/usr/share \
    -DCMAKE_INSTALL_DOCDIR=$pkgdir/usr/share/doc/$pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=$pkgdir/usr/local/bin \
    -DCMAKE_INSTALL_BINDIR=$pkgdir/usr/local/sbin \
    -DCMAKE_INSTALL_SBINDIR=$pkgdir/usr/local/sbin \
    -DCMAKE_INSTALL_PREFIX=$pkgdir
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	cd release
	if [ ! -f savagewheels ]; then
	  echo "Binary not found! Was compile successful?"
	fi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
	cd release
  make install

  # .desktop entries
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 sw1.png "$pkgdir"/usr/share/pixmaps/sw1.png
  install -Dm644 savagewheels.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
